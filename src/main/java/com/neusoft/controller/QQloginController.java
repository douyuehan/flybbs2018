package com.neusoft.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.neusoft.util.HttpClientUtils;
import com.neusoft.util.JsonUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.qq.connect.QQConnectException;
import com.qq.connect.api.OpenID;
import com.qq.connect.api.qzone.UserInfo;
import com.qq.connect.javabeans.AccessToken;
import com.qq.connect.javabeans.qzone.UserInfoBean;
import com.qq.connect.oauth.Oauth;

import java.util.Map;

/**
 * QQ登入
 *
 * @author 王家···羽
 *
 */

@Controller
@RequestMapping(value = "oauth")
public class QQloginController {
    private static String QQ_APP_ID = "101533819";
    private static String QQ_APP_KEY = "9b3328e1f3c22dd1b3839450253aab0f";
    private static String QQ_REDIRECT_URL = "http://127.0.0.1/oauth/qqAfterlogin";

    /**
     * 页面重定向到qq第三方的登录页面。
     */
    @RequestMapping(value = "/qqLogin")
    public void qqLogin(HttpServletRequest request, HttpServletResponse response) throws Exception {
        // QQ认证服务器地址
        String url = "https://graph.qq.com/oauth2.0/authorize";
        // 生成并保存state，忽略该参数有可能导致CSRF攻击
        String state = "";
        // 传递参数response_type、client_id、state、redirect_uri
        String param = "response_type=code&" + "client_id=" + QQ_APP_ID + "&state=" + state
                + "&redirect_uri=" + QQ_REDIRECT_URL;

        // 1、请求QQ认证服务器
        response.sendRedirect(url + "?" + param);

    }

    /**
     * 获取QQ账号信息 redirect_URI是值使用第三方登录页面登录成功后的跳转地址
     *
     * @return
     */
    @RequestMapping(value = "/qqAfterlogin")
    public void qqAfterlogin(String code, String state, HttpServletResponse response) throws Exception {



        // 2、向QQ认证服务器申请令牌
        String url = "https://graph.qq.com/oauth2.0/token";
        // 传递参数grant_type、code、redirect_uri、client_id
        String param = "grant_type=authorization_code&code=" + code + "&redirect_uri=" +
                QQ_REDIRECT_URL + "&client_id=" + QQ_APP_ID + "&client_secret=" + QQ_APP_KEY;

        // 申请令牌，注意此处为post请求
        // QQ获取到的access token具有3个月有效期，用户再次登录时自动刷新。
        String result = HttpClientUtils.sendPostRequest(url, param);

    /*
     * result示例：
     * 成功：access_token=A24B37194E89A0DDF8DDFA7EF8D3E4F8&expires_in=7776000&refresh_token=BD36DADB0FE7B910B4C8BBE1A41F6783
     */
        Map<String, String> resultMap = HttpClientUtils.params2Map(result);
        // 如果返回结果中包含access_token，表示成功
        if(!resultMap.containsKey("access_token")) {
            throw  new Exception("获取token失败");
        }
        // 得到token
        String accessToken = resultMap.get("access_token");

        // 3、使用Access Token来获取用户的OpenID
        String meUrl = "https://graph.qq.com/oauth2.0/me";
        String meParams = "access_token=" + accessToken;
        String meResult = HttpClientUtils.sendGetRequest(meUrl, meParams);
        // 成功返回如下：callback( {"client_id":"YOUR_APPID","openid":"YOUR_OPENID"} );
        // 取出openid
        String openid = getQQOpenid(meResult);

        // 4、使用Access Token以及OpenID来访问和修改用户数据
        String userInfoUrl = "https://graph.qq.com/user/get_user_info";
        String userInfoParam = "access_token=" + accessToken + "&oauth_consumer_key=" + QQ_APP_ID + "&openid=" + openid;
        String userInfo = HttpClientUtils.sendGetRequest(userInfoUrl, userInfoParam);

        // 5、输出用户信息
        response.setContentType("text/html;charset=utf-8");
        response.getWriter().write(userInfo);


    }
    /**
     * 提取Openid
     * @param str 形如：callback( {"client_id":"YOUR_APPID","openid":"YOUR_OPENID"} );
     * @author jitwxs
     * @since 2018/5/22 21:37
     */
    private String getQQOpenid(String str) {
        // 获取花括号内串
        String json = str.substring(str.indexOf("{"), str.indexOf("}") + 1);
        // 转为Map
        Map<String, String> map = JsonUtils.jsonToPojo(json, Map.class);
        return map.get("openid");
    }

}
