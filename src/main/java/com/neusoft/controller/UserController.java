package com.neusoft.controller;

import com.alibaba.fastjson.JSON;
import com.neusoft.domain.Topic;
import com.neusoft.domain.UserMessage;
import com.neusoft.mapper.*;
import com.neusoft.util.MD5Utils;
import com.neusoft.domain.User;
import com.neusoft.response.RegRespObj;
import com.neusoft.util.MailUtil;
import com.neusoft.util.StringDate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.UUID;

/**
 * Created by Administrator on 2018/12/6.
 */
@Controller
@RequestMapping("user")
public class UserController {

    @Autowired
    UserMapper userMapper;

    @Autowired
    TopicMapper topicMapper;

    @Autowired
    CommentMapper commentMapper;

    @Autowired
    UserMessageMapper userMessageMapper;

    @Autowired
    UserCollectTopicMapper userCollectTopicMapper;

    @RequestMapping("reg")
    public String reg()
    {
        return "user/reg";
    }

    @RequestMapping("active")
    public String active()
    {
        return "user/active";
    }

    @RequestMapping("activemail/{code}")
    public String activemail(@PathVariable String code,HttpSession session,HttpServletResponse response)
    {
        User user = userMapper.selectByActiveCode(code);
        if(user != null)
        {
            user.setActiveState(1);
            userMapper.updateByPrimaryKeySelective(user);
            session.setAttribute("userinfo",user);
            return "user/active_success";
        }
        else
        {
            return "user/active";
        }

    }


    @RequestMapping("doreg")
    @ResponseBody
    public RegRespObj doReg(User user, HttpServletRequest request) throws Exception {
        RegRespObj regRespObj = new RegRespObj();
        User user1 = userMapper.selectByEmail(user.getEmail());
        if(user1==null){
            user.setKissNum(100);
            user.setJoinTime(new Date());
            String passwd = user.getPasswd();
            String pwd = MD5Utils.getPwd(passwd);
            user.setPasswd(pwd);

            int i = userMapper.insertSelective(user);
            if(i>0){
                User userReg = userMapper.selectByNickname(user.getNickname());
                //插入一条系统欢迎消息
                UserMessage userMessage = new UserMessage();
                userMessage.setCreateTime(new Date());
                userMessage.setTopicId(-1);
                userMessage.setMsgType(0);
                userMessage.setTriggerMsgUserId(0);
                userMessage.setRecvMsgUserId(userReg.getId());
                userMessageMapper.insertSelective(userMessage);

                regRespObj.setStatus(0);
                System.out.println(request.getServletContext().getContextPath());
                regRespObj.setAction(request.getServletContext().getContextPath() + "/");
            }else {
                regRespObj.setStatus(1);
                regRespObj.setMsg("数据库错误，联系管理员");
            }
        }else {
            regRespObj.setStatus(1);
            regRespObj.setMsg("邮箱重复，请换邮箱注册");
        }
        return regRespObj;

    }
    @RequestMapping("/checkEmail")
    @ResponseBody
    public RegRespObj checkEmail(User user){
        RegRespObj regRespObj = new RegRespObj();
        User user1 = userMapper.selectByEmail(user.getEmail());
        if(user1==null){
            regRespObj.setMsg("可以注册");
        }else {
            regRespObj.setMsg("邮箱重复，请更换邮箱");
        }
        return regRespObj;
    }
    @RequestMapping("logout")
    public String logout(HttpServletRequest request)
    {
        request.getSession().invalidate();
        return "redirect:" + request.getServletContext().getContextPath() +"/";
    }



    @RequestMapping("login")
    public String login()
    {
        return "user/login";
    }

    @RequestMapping("index")
    public ModelAndView index(HttpSession httpSession)
    {
        User userLogin = (User)httpSession.getAttribute("userinfo");
        List<Map<String,Object>> mapList = userCollectTopicMapper.getCollectionsByUserID(userLogin.getId());


        List<Topic> topicList = topicMapper.getTopicsByUserID(userLogin.getId());

        for(Topic topic : topicList)
        {
            Date date = topic.getCreateTime();
            String strDate = StringDate.getStringDate(date);
            topic.setCreateTimeStr(strDate);
        }

        int topic_num = topicMapper.getTopicNumByUserID(userLogin.getId());
        int collect_num = userCollectTopicMapper.getCollectNumByUserID(userLogin.getId());

        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("user/index");
        modelAndView.addObject("collections",mapList);
        modelAndView.addObject("topics",topicList);
        modelAndView.addObject("topic_num",topic_num);
        modelAndView.addObject("collect_num",collect_num);
        return modelAndView;
    }
    @RequestMapping("message")
    public ModelAndView message(HttpSession httpSession)
    {
        ModelAndView modelAndView = new ModelAndView();
        User userLogin = (User)httpSession.getAttribute("userinfo");
        List<Map<String,Object>> mapList = userMessageMapper.getMessagesByUserID(userLogin.getId());
        for(Map<String,Object> map : mapList)
        {
            Date date = (Date)map.get("create_time");
            String strDate = StringDate.getStringDate(date);
            map.put("create_time",strDate);
        }

        modelAndView.addObject("messages",mapList);
        modelAndView.setViewName("user/message");
        return modelAndView;
    }
    @RequestMapping("jumphome/{username}")
    public ModelAndView jumphome(@PathVariable String username)
    {
        User user = userMapper.selectByNickname(username);
        ModelAndView modelAndView = home(user.getId());
        return modelAndView;
    }
    @RequestMapping("home/{uid}")
    public ModelAndView home(@PathVariable Integer uid)
    {
        ModelAndView modelAndView = new ModelAndView();
        User user = userMapper.selectByPrimaryKey(uid);
        List<Topic> topicList = topicMapper.getTopicsByUserID(uid);

        for(Topic topic : topicList)
        {
            Date date = topic.getCreateTime();
            String strDate = StringDate.getStringDate(date);
            topic.setCreateTimeStr(strDate);
        }

        List<Map<String,Object>> mapList = commentMapper.getCommentsByUserID(uid);
        for(Map<String,Object> map : mapList)
        {
            Date date = (Date)map.get("comment_time");
            String strDate = StringDate.getStringDate(date);
            map.put("comment_time",strDate);
        }
        modelAndView.addObject("comments",mapList);
        modelAndView.addObject("topics",topicList);
        modelAndView.addObject("user",user);
        modelAndView.setViewName("user/home");
        return modelAndView;
    }
    @RequestMapping("dologin")
    @ResponseBody
    public RegRespObj dologin(User user,HttpServletRequest request)
    {
        HttpSession httpSession = request.getSession();
        String referer = (String)httpSession.getAttribute("referer");
        httpSession.removeAttribute("referer");
        //查询数据库，用email和密码作为条件查询，如果查出来0条记录，登录失败
        //否则，登录成功
        user.setPasswd(MD5Utils.getPwd(user.getPasswd()));
        User userResult = userMapper.selectByEmailAndPass(user);
        RegRespObj regRespObj = new RegRespObj();
        if(userResult == null)
        {
            regRespObj.setStatus(1);
            regRespObj.setMsg("登录失败");
        }
        else
        {

            httpSession.setAttribute("userinfo",userResult);
            regRespObj.setStatus(0);
            if(referer == null)
            {
                regRespObj.setAction(request.getServletContext().getContextPath() + "/");
            }
            else
            {
                regRespObj.setAction(referer);
            }

        }

        return regRespObj;
    }

    @RequestMapping(value = "set",method = {RequestMethod.GET})
    public String userSetting()
    {
        System.out.println("userSetting");
        return "user/set";
    }
    @RequestMapping(value = "set",method = {RequestMethod.POST})
    public void userUpdateSetting(User user,HttpServletResponse response,HttpSession httpSession) throws IOException {
        User userLogin = (User)httpSession.getAttribute("userinfo");
        user.setId(userLogin.getId());
        userMapper.updateByPrimaryKeySelective(user);
        RegRespObj regRespObj = new RegRespObj();
        regRespObj.setStatus(0);

        response.getWriter().println(JSON.toJSONString(regRespObj));
    }

    @RequestMapping("upload")
    @ResponseBody
    public RegRespObj upload(@RequestParam  MultipartFile file,HttpServletRequest request) throws IOException {
        RegRespObj regRespObj = new RegRespObj();
        if(file.getSize()>0){
            String realPath = request.getServletContext().getRealPath("/res/uploadImgs");
            File file1 = new File(realPath);
            if(!file1.exists()){
                file1.mkdirs();
            }
            UUID uuid = UUID.randomUUID();
            File file2 = new File(realPath+File.separator+uuid+file.getOriginalFilename());
            file.transferTo(file2);

            HttpSession session = request.getSession();
            User userinfo = (User)session.getAttribute("userinfo");
            userinfo.setPicPath(uuid+file.getOriginalFilename());
            session.setAttribute("userinfo",userinfo);

            userMapper.updateByPrimaryKeySelective(userinfo);

            regRespObj.setStatus(0);
        }
        else
        {
            regRespObj.setStatus(1);
        }
        return regRespObj;
    }
}
