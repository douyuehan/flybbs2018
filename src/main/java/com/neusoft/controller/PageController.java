package com.neusoft.controller;

import com.alibaba.fastjson.JSON;
import com.neusoft.domain.PageInfo;
import com.neusoft.domain.User;
import com.neusoft.mapper.UserMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by Administrator on 2018/12/11.
 */
@Controller
public class PageController {
    @Autowired
    UserMapper userMapper;
    @RequestMapping("getpagedata")
    public void getcount(PageInfo pageInfo, HttpServletResponse response) throws IOException {


        int num = userMapper.getTotalCounts();

        List<User> userList = userMapper.getPagedUser(pageInfo);

        Map<String,Object> map = new HashMap<>();
        map.put("total",num);
        map.put("datas",userList);

        response.getWriter().println(JSON.toJSONString(map));
    }
}
