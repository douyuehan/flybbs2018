package com.neusoft.controller;

import com.alibaba.fastjson.JSON;
import com.neusoft.domain.User;
import com.neusoft.mapper.UserMessageMapper;
import com.neusoft.response.RegRespObj;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

/**
 * Created by Administrator on 2018/12/21.
 */
@Controller
@RequestMapping("message")
public class MessageController {
    @Autowired
    UserMessageMapper userMessageMapper;

    @RequestMapping("nums")
    public void getMsgCount(HttpSession httpSession, HttpServletResponse response) throws IOException {
        User user = (User)httpSession.getAttribute("userinfo");
        int count = userMessageMapper.getUnreadMsgCountByUserID(user.getId());
        RegRespObj regRespObj = new RegRespObj();
        regRespObj.setStatus(0);
        regRespObj.setCount(count);

        response.getWriter().println(JSON.toJSONString(regRespObj));
    }

    @RequestMapping("remove")
    public void delMsg(Boolean all, Integer id, HttpSession httpSession, HttpServletResponse response) throws IOException {
        RegRespObj regRespObj = new RegRespObj();

        if(all == null)
        {
            userMessageMapper.deleteByPrimaryKey(id);
            regRespObj.setStatus(0);
        }
        else
        {
            User user = (User)httpSession.getAttribute("userinfo");
            userMessageMapper.delAllUserMsg(user.getId());
            regRespObj.setStatus(0);
        }

        response.getWriter().println(JSON.toJSONString(regRespObj));
    }

    @RequestMapping("read")
    public void readMsg(HttpSession httpSession, HttpServletResponse response) throws IOException {
        User user = (User)httpSession.getAttribute("userinfo");
        userMessageMapper.updateUserMsgReadState(user.getId());
        RegRespObj regRespObj = new RegRespObj();
        regRespObj.setStatus(0);

        response.getWriter().println(JSON.toJSONString(regRespObj));
    }
}
