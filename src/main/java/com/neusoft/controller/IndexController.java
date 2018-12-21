package com.neusoft.controller;

import com.neusoft.domain.Topic;
import com.neusoft.mapper.TopicMapper;
import com.neusoft.mapper.UserMapper;
import com.neusoft.util.StringDate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * Created by Administrator on 2018/12/6.
 */
@Controller
public class IndexController {

    @Autowired
    TopicMapper topicMapper;
    @Autowired
    UserMapper userMapper;

    @RequestMapping("/")
    public ModelAndView index()
    {
//        ModelAndView modelAndView = new ModelAndView();
//        modelAndView.setViewName("page");
//        return modelAndView;

        List<Map<String,Object>> userList = userMapper.getTopUsers();

        List<Topic> topics = topicMapper.getTop10Topics();
        //置顶帖子
        List<Map<String,Object>> mapList = topicMapper.getTopTopics();
        for(Map<String,Object> map : mapList)
        {
            Date date = (Date)map.get("create_time");
            String strDate = StringDate.getStringDate(date);
            map.put("create_time",strDate);
        }


        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("index");
        modelAndView.addObject("top_topics",mapList);
        modelAndView.addObject("typeid",0);
        modelAndView.addObject("topics",topics);
        modelAndView.addObject("top_users",userList);


        return modelAndView;
    }
}


