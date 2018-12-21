package com.neusoft.controller;

import com.alibaba.fastjson.JSON;
import com.neusoft.domain.User;
import com.neusoft.domain.UserQiandao;
import com.neusoft.mapper.UserMapper;
import com.neusoft.mapper.UserQiandaoMapper;
import com.neusoft.response.Data;
import com.neusoft.response.RegRespObj;
import com.neusoft.util.KissUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by Administrator on 2018/12/21.
 */
@Controller
@RequestMapping("sign")
public class SignController {
    @Autowired
    UserQiandaoMapper qiandaoMapper;

    @Autowired
    UserMapper userMapper;

    @RequestMapping("in")
    public void signIn(HttpSession httpSession, HttpServletResponse response) throws IOException {
        RegRespObj regRespObj = new RegRespObj();
        Data data = new Data();
        regRespObj.setData(data);
        data.setDays(1);
        data.setExperience(5);
        data.setSigned(true);

        User user = (User)httpSession.getAttribute("userinfo");
        if(user == null)
        {
            regRespObj.setStatus(1);
            regRespObj.setMsg("请先登录");
        }
        else
        {





            UserQiandao userQiandao = qiandaoMapper.selectByUserID(user.getId());
            if(userQiandao != null)
            {
                Calendar calendarNow = Calendar.getInstance();
                calendarNow.setTime(new Date());

                Calendar calendarLastTime = Calendar.getInstance();
                calendarLastTime.setTime(userQiandao.getCreateTime());

                calendarNow.add(Calendar.DATE, -1);
                int date = calendarNow.get(Calendar.DATE);
                int lasttime = calendarLastTime.get(Calendar.DATE);
                if(date == lasttime)
                {
                    userQiandao.setCreateTime(new Date());
                    userQiandao.setTotal(1 + userQiandao.getTotal());
                    qiandaoMapper.updateByPrimaryKeySelective(userQiandao);

                    int kissnum = KissUtils.getKissNum(1 + userQiandao.getTotal());

                    User user1 = userMapper.selectByPrimaryKey(user.getId());
                    user1.setKissNum(kissnum + user1.getKissNum());
                    userMapper.updateByPrimaryKeySelective(user1);

                    data.setDays(userQiandao.getTotal());
                    data.setExperience(kissnum);
                }
                else
                {
                    userQiandao.setCreateTime(new Date());
                    userQiandao.setTotal(1);
                    qiandaoMapper.updateByPrimaryKeySelective(userQiandao);
                    User user1 = userMapper.selectByPrimaryKey(user.getId());
                    user1.setKissNum(5+user1.getKissNum());
                    userMapper.updateByPrimaryKeySelective(user1);

                }
            }
            else
            {
                UserQiandao userQiandao1 = new UserQiandao();
                userQiandao1.setUserId(user.getId());
                userQiandao1.setCreateTime(new Date());
                userQiandao1.setTotal(1);
                qiandaoMapper.insertSelective(userQiandao1);

                User user1 = userMapper.selectByPrimaryKey(user.getId());
                user1.setKissNum(5+user1.getKissNum());
                userMapper.updateByPrimaryKeySelective(user1);


            }
        }
        response.getWriter().println(JSON.toJSONString(regRespObj));
    }
}
