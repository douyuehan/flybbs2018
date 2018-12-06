package com.neusoft.controller;

import com.neusoft.domain.User;
import com.neusoft.response.RegRespObj;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * Created by Administrator on 2018/12/6.
 */
@Controller
@RequestMapping("user")
public class UserController {
    @RequestMapping("reg")
    public String reg()
    {
        return "user/reg";
    }

    @RequestMapping("doreg")
    @ResponseBody
    public RegRespObj doReg(User user)
    {
        RegRespObj regRespObj = new RegRespObj();
//        fsljfslkjfsdlkjfsd
//        regRespObj.setStatus(0);
//        regRespObj.setAction("/");

        regRespObj.setStatus(1);
        regRespObj.setMsg("user exist");
        return regRespObj;

    }

    @RequestMapping("login")
    public String login()
    {
        return "user/login";
    }
}
