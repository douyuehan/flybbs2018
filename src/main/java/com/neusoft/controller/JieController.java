package com.neusoft.controller;

import com.alibaba.fastjson.JSON;
import com.neusoft.domain.*;
import com.neusoft.mapper.*;
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
import java.util.*;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

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
    @Autowired
    UserMapper userMapper;
    @Autowired
    UserMessageMapper userMessageMapper;

    @RequestMapping("index/{cid}/{typeid}")
    public ModelAndView index(@PathVariable Integer cid,@PathVariable Integer typeid)
    {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("jie/index");
        modelAndView.addObject("cid",cid);
        modelAndView.addObject("typeid",typeid);
        return modelAndView;
    }

    @RequestMapping("add/{tid}")
    public ModelAndView add(@PathVariable Integer tid)
    {

        List<TopicCategory> topicCategoryList = topicCategoryMapper.getAllCategories();
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject("categories",topicCategoryList);
        modelAndView.addObject("tid",tid);
        if(tid > 0)
        {
            Topic topic = topicMapper.selectByPrimaryKey(tid);
            modelAndView.addObject("topic",topic);
        }

        modelAndView.setViewName("jie/add");
        return modelAndView;
    }
    @RequestMapping("detail/{tid}")
    public ModelAndView detail(@PathVariable Integer tid, HttpSession httpSession)
    {

        //帖子的阅读数量加一
        Topic topic = topicMapper.selectByPrimaryKey(tid);
        topic.setViewTimes(topic.getViewTimes() + 1);
        topicMapper.updateByPrimaryKeySelective(topic);

        ModelAndView modelAndView = new ModelAndView();
        Map<String,Object> map = topicMapper.getTopicInfo(tid);

        Date date = (Date)map.get("create_time");
        String strDate = StringDate.getStringDate(date);
        map.put("create_time",strDate);




        //3.该帖的评论的赞的信息得到
        User user = (User)httpSession.getAttribute("userinfo");

        Map<String,Object> params = new HashMap<>();
        params.put("topicid",tid);
        if(user == null)
        {
            params.put("userid",0);
        }
        else
        {
            params.put("userid",user.getId());
        }

        List<Map<String,Object>> mapList = commentMapper.getCommentsByTopicID(params);
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

        if(topic.getId() == 0)//新增
        {
            topic.setCreateTime(new Date());

            if(topic.getKissNum() > user.getKissNum())
            {
                regRespObj.setStatus(1);
                regRespObj.setMsg("飞吻不够");
            }
            else
            {
                int result = topicMapper.insertSelective(topic);
                user.setKissNum(user.getKissNum() - topic.getKissNum());
                userMapper.updateByPrimaryKeySelective(user);
                if(result > 0)
                {
                    regRespObj.setStatus(0);
                    regRespObj.setAction(request.getServletContext().getContextPath() + "/");

                }
            }
        }
        else
        {
            int result = topicMapper.updateByPrimaryKeySelective(topic);

            if(result > 0)
            {
                regRespObj.setStatus(0);
                regRespObj.setAction(request.getServletContext().getContextPath() + "/");
            }
        }

        response.getWriter().println(JSON.toJSONString(regRespObj));
    }

    @RequestMapping("reply")
    public void reply(Comment comment,String content, HttpServletRequest request, HttpServletResponse response) throws IOException {
        RegRespObj regRespObj = new RegRespObj();
        HttpSession httpSession = request.getSession();
        User user = (User)httpSession.getAttribute("userinfo");
        if(user != null)
        {
            //插入评论
            comment.setCommentContent(content);
            comment.setUserId(user.getId());
            comment.setCommentTime(new Date());
            commentMapper.insertSelective(comment);
            regRespObj.setStatus(0);


            //更新topic的评论数字段
            Topic topic = topicMapper.selectByPrimaryKey(comment.getTopicId());
            int comment_num = topic.getCommentNum();
            topic.setCommentNum(comment_num + 1);
            topicMapper.updateByPrimaryKeySelective(topic);

            //在消息表中添加一条消息
            if(topic.getUserid() != user.getId())
            {
                UserMessage userMessage = new UserMessage();
                userMessage.setCreateTime(new Date());
                userMessage.setTopicId(comment.getTopicId());
                userMessage.setMsgType(1);
                userMessage.setTriggerMsgUserId(user.getId());
                userMessage.setRecvMsgUserId(topic.getUserid());
                userMessageMapper.insertSelective(userMessage);
            }


            Pattern pattern = Pattern.compile("@(.*?)\\s");
            Matcher matcher = pattern.matcher(comment.getCommentContent());
            Set<String> stringSet = new HashSet<>();
            while (matcher.find()) {
                String nickname = matcher.group(1);
                stringSet.add(nickname);
            }
            for(String username : stringSet)
            {
                User user1 = userMapper.selectByNickname(username);
                if(user1 != null)
                {
                    UserMessage userMessage = new UserMessage();
                    userMessage.setCreateTime(new Date());
                    userMessage.setTopicId(comment.getTopicId());
                    userMessage.setMsgType(1);
                    userMessage.setTriggerMsgUserId(user.getId());
                    userMessage.setRecvMsgUserId(user1.getId());
                    userMessageMapper.insertSelective(userMessage);
                }
            }

        }
        else
        {
            String referer = request.getHeader("Referer");
            httpSession.setAttribute("referer",referer);
            regRespObj.setStatus(0);
            regRespObj.setAction(request.getServletContext().getContextPath()+"/user/login");
        }

        response.getWriter().println(JSON.toJSONString(regRespObj));
        return;
    }
}
