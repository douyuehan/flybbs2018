package com.neusoft.controller;

import com.alibaba.fastjson.JSON;
import com.neusoft.domain.PageInfo;
import com.neusoft.mapper.TopicMapper;
import com.neusoft.util.StringDate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by Administrator on 2018/12/12.
 */
@Controller
@RequestMapping("topic")
public class TopicController {
    @Autowired
    TopicMapper topicMapper;

    @RequestMapping("get_paged_topic")
    public void getPagedTopic(PageInfo pageInfo, HttpServletResponse response) throws IOException {

        int total = topicMapper.getTopicTotal(pageInfo);
        List<Map<String,Object>> mapList = topicMapper.getPagedTopics(pageInfo);



        for(Map<String,Object> map : mapList)
        {
            Date date = (Date)map.get("create_time");
            String strDate = StringDate.getStringDate(date);
            map.put("create_time",strDate);
        }

        Map<String,Object> map = new HashMap<>();
        map.put("num",total);
        map.put("topics",mapList);

        response.setContentType("text/html;charset=utf8");
        response.getWriter().println(JSON.toJSONString(map));

    }
}
