package com.neusoft.controller;

import com.neusoft.domain.Topic;
import com.neusoft.domain.User;
import com.neusoft.domain.UserQiandao;
import com.neusoft.mapper.TopicMapper;
import com.neusoft.mapper.UserMapper;
import com.neusoft.mapper.UserQiandaoMapper;
import com.neusoft.util.KissUtils;
import com.neusoft.util.StringDate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
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

    @Autowired
    UserQiandaoMapper userQiandaoMapper;

    @RequestMapping("/")
    public ModelAndView index(HttpSession httpSession)
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

        User user = (User)httpSession.getAttribute("userinfo");
        UserQiandao userQiandao = null;
        int kissnum = 5;
        boolean isTodaySigned = false;
        if(user != null)
        {
            userQiandao = userQiandaoMapper.selectByUserID(user.getId());
            if(userQiandao != null)
            {
                kissnum = KissUtils.getKissNum(userQiandao.getTotal());
                if(new Date().getDate() == userQiandao.getCreateTime().getDate())
                {
                    isTodaySigned = true;
                }
            }
        }


        modelAndView.addObject("qiandao",userQiandao);
        modelAndView.addObject("kissnum",kissnum);
        modelAndView.addObject("is_today_signed",isTodaySigned);


        modelAndView.setViewName("index");
        modelAndView.addObject("top_topics",mapList);
        modelAndView.addObject("typeid",0);
        modelAndView.addObject("topics",topics);
        modelAndView.addObject("top_users",userList);


        return modelAndView;
    }
}


