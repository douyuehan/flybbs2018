package com.neusoft.interceptor;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Created by Administrator on 2018/12/10.
 */
public class LoginInterceptor implements HandlerInterceptor {
    @Override
    public boolean preHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o) throws Exception {


        String strUrl = httpServletRequest.getRequestURL().toString();

        //判断用户是否登录
        //如果登录，则放行，否则，转发到登录页面
        HttpSession httpSession = httpServletRequest.getSession();
        httpSession.setAttribute("referer",strUrl);
        Object object = httpSession.getAttribute("userinfo");
        if(object != null)
        {
            return true;
        }
        else
        {
            httpServletRequest.getRequestDispatcher("/WEB-INF/jsp/user/login.jsp").forward(httpServletRequest,httpServletResponse);
        }
        return false;
    }

    @Override
    public void postHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, ModelAndView modelAndView) throws Exception {

    }

    @Override
    public void afterCompletion(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, Exception e) throws Exception {

    }
}
