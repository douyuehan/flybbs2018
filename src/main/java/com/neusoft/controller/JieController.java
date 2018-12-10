package com.neusoft.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by Administrator on 2018/12/10.
 */
@Controller
@RequestMapping("jie")
public class JieController {
    @RequestMapping("add")
    public String add()
    {
        return "jie/add";
    }
}
