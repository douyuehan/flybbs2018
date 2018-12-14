package com.neusoft.controller;

import com.alibaba.fastjson.JSON;
import com.neusoft.domain.Comment;
import com.neusoft.domain.Topic;
import com.neusoft.domain.User;
import com.neusoft.mapper.CommentMapper;
import com.neusoft.mapper.TopicMapper;
import com.neusoft.response.RegRespObj;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.Map;

/**
 * Created by Administrator on 2018/12/13.
 */
@Controller
@RequestMapping("api")
public class ApiController {
    @Autowired
    TopicMapper topicMapper;
    @Autowired
    CommentMapper commentMapper;
    @RequestMapping("jie-set")
    public void jieSet(Integer id, Integer rank, String field, HttpServletResponse response) throws IOException {
        Topic topic = topicMapper.selectByPrimaryKey(id);
        if(field.equals("stick"))
        {
            topic.setIsTop(rank);
        }
        else if(field.equals("status"))
        {
            topic.setIsGood(rank);
        }
        topicMapper.updateByPrimaryKeySelective(topic);
        RegRespObj regRespObj = new RegRespObj();
        regRespObj.setStatus(0);

        response.getWriter().println(JSON.toJSONString(regRespObj));
    }

    @RequestMapping("jieda-accept")
    public void jiedaAccept(Integer id, HttpServletResponse response) throws IOException {
        RegRespObj regRespObj = new RegRespObj();
        regRespObj.setStatus(0);

        //评论记录的is_choose变成1
        Comment comment = commentMapper.selectByPrimaryKey(id);
        comment.setIsChoose(1);
        commentMapper.updateByPrimaryKeySelective(comment);
        //评论所在的topic的is_end变成1
        Topic topic = topicMapper.selectByPrimaryKey(comment.getTopicId());
        topic.setIsEnd(1);
        topicMapper.updateByPrimaryKeySelective(topic);

        response.getWriter().println(JSON.toJSONString(regRespObj));
    }

    @RequestMapping("jieda-zan")
    public void jiedaZan(Integer id, Boolean ok, HttpServletResponse response, HttpServletRequest request) throws IOException {
        RegRespObj regRespObj = new RegRespObj();
        HttpSession httpSession = request.getSession();
        User user = (User)httpSession.getAttribute("userinfo");
        if(user != null)
        {
            if(ok == false)//点赞
            {
                //当前评论的likenum++

                //在tab_user_comment_agree添加一条相应的记录
            }
            else//取消点赞
            {
                //当前评论的likenum--
                //在tab_user_comment_agree删除一条相应的记录
            }

        }
        else
        {
            regRespObj.setStatus(1);
            regRespObj.setMsg("未登录");
        }

        response.getWriter().println(JSON.toJSONString(regRespObj));
    }

}
