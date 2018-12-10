package com.neusoft.controller;

import com.neusoft.mapper.TopicMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;
import java.util.Map;

/**
 * Created by Administrator on 2018/12/6.
 */
@Controller
public class IndexController {

    @Autowired
    TopicMapper topicMapper;

    @RequestMapping("/")
    public ModelAndView index()
    {
        List<Map<String,Object>> mapList = topicMapper.getAllTopics();
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("index");
        modelAndView.addObject("topics",mapList);
        return modelAndView;
    }
}


