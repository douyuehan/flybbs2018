package com.neusoft.controller;

import org.springframework.stereotype.Controller;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import weibo4j.Users;
import weibo4j.model.User;
import weibo4j.model.WeiboException;

/**
 * Created by Administrator on 2018/12/24.
 */
@Controller
@RequestMapping("oauth")
public class WeiboLoginController {
    // 新浪微博登录界面
    @RequestMapping(value = "/weiboLogin", method = RequestMethod.GET)
    public String loginSinaWeibo(HttpServletRequest request, HttpSession session) throws WeiboException {

        weibo4j.Oauth oauth = new weibo4j.Oauth();
        String url = oauth.authorize("code", "");
        return "redirect:" + url;
    }
//    http://127.0.0.1:8085/oauth/weiboRedirect
//    http://127.0.0.1:8085/oauth/weiboRedirect
    // 微博登入后 重定向到这里 code参数
    @RequestMapping(value = "/weiboRedirect")
    public void loginSinaWeiboAction(HttpServletRequest request, HttpSession session,
                                     @RequestParam(value = "code", required = false) String code) throws WeiboException {

        // 用户授权的时候取消了，跳转到首页吧
        if (code == null) {
            // return "redirect:../index.jsp";
        }

        weibo4j.Oauth oauth = new weibo4j.Oauth();
        weibo4j.http.AccessToken accessToken = oauth.getAccessTokenByCode(code);
        // token相当于密码了，就是每一次授权的时候密码都是不一样的了(授权时间)
        String token = accessToken.getAccessToken();
        // 相当于微博的账号了，uid是唯一的
        String uid = accessToken.getUid();

        Users users = new Users();
        users.setToken(token);
        User user = users.showUserById(uid);// 微博用户的对象
        System.out.println(user);

    }

}
