package com.neusoft.controller;

import com.alibaba.fastjson.JSON;
import com.neusoft.domain.Comment;
import com.neusoft.domain.Topic;
import com.neusoft.domain.TopicCategory;
import com.neusoft.domain.User;
import com.neusoft.mapper.CommentMapper;
import com.neusoft.mapper.TopicCategoryMapper;
import com.neusoft.mapper.TopicMapper;
import com.neusoft.response.RegRespObj;
import com.neusoft.util.StringDate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * Created by Administrator on 2018/12/10.
 */
@Controller
@RequestMapping("jie")
public class JieController {

    @Autowired
    TopicCategoryMapper topicCategoryMapper;

    @Autowired
    TopicMapper topicMapper;

    @Autowired
    CommentMapper commentMapper;
    @RequestMapping("add")
    public ModelAndView add()
    {
        List<TopicCategory> topicCategoryList = topicCategoryMapper.getAllCategories();
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject("categories",topicCategoryList);
        modelAndView.setViewName("jie/add");
        return modelAndView;
    }
    @RequestMapping("detail/{tid}")
    public ModelAndView detail(@PathVariable Integer tid)
    {
        ModelAndView modelAndView = new ModelAndView();
        Map<String,Object> map = topicMapper.getTopicInfo(tid);

        Date date = (Date)map.get("create_time");
        String strDate = StringDate.getStringDate(date);
        map.put("create_time",strDate);


        List<Map<String,Object>> mapList = commentMapper.getCommentsByTopicID(tid);
        for(Map<String,Object> map2 : mapList)
        {
            Date date2 = (Date)map2.get("comment_time");
            String strDate2 = StringDate.getStringDate(date2);
            map2.put("comment_time",strDate2);
        }

        modelAndView.setViewName("jie/detail");
        modelAndView.addObject("topic",map);
        modelAndView.addObject("comments",mapList);
        return modelAndView;
    }
    @RequestMapping("doadd")
    public void doadd(Topic topic, HttpServletResponse response, HttpServletRequest request) throws IOException {
        RegRespObj regRespObj = new RegRespObj();

        HttpSession httpSession = request.getSession();
        User user = (User)httpSession.getAttribute("userinfo");
        topic.setUserid(user.getId());
        topic.setCreateTime(new Date());

        int result = topicMapper.insertSelective(topic);
        if(result > 0)
        {
            regRespObj.setStatus(0);
            regRespObj.setAction(request.getServletContext().getContextPath() + "/");
            response.getWriter().println(JSON.toJSONString(regRespObj));
        }

        return;
    }

    @RequestMapping("reply")
    public void reply(Comment comment,String content, HttpServletRequest request, HttpServletResponse response) throws IOException {
        RegRespObj regRespObj = new RegRespObj();
        HttpSession httpSession = request.getSession();
        User user = (User)httpSession.getAttribute("userinfo");
        if(user != null)
        {
            comment.setCommentContent(content);
            comment.setUserId(user.getId());
            comment.setCommentTime(new Date());
            commentMapper.insertSelective(comment);
            regRespObj.setStatus(0);

        }
        else
        {
            regRespObj.setStatus(0);
            regRespObj.setAction(request.getServletContext().getContextPath()+"/user/login");
        }

        response.getWriter().println(JSON.toJSONString(regRespObj));
        return;
    }
}
