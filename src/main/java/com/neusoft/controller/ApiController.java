package com.neusoft.controller;

import com.alibaba.fastjson.JSON;
import com.neusoft.domain.Topic;
import com.neusoft.mapper.TopicMapper;
import com.neusoft.response.RegRespObj;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Map;

/**
 * Created by Administrator on 2018/12/13.
 */
@Controller
@RequestMapping("api")
public class ApiController {
    @Autowired
    TopicMapper topicMapper;
    @RequestMapping("jie-set")
    public void jieSet(Integer id, Integer rank, String field, HttpServletResponse response) throws IOException {
        Topic topic = topicMapper.selectByPrimaryKey(id);
        if(field.equals("stick"))
        {
            topic.setIsTop(rank);
        }
        else if(field.equals("status"))
        {
            topic.setIsGood(rank);
        }
        topicMapper.updateByPrimaryKeySelective(topic);
        RegRespObj regRespObj = new RegRespObj();
        regRespObj.setStatus(0);

        response.getWriter().println(JSON.toJSONString(regRespObj));
    }
}
