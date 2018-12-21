<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/12/20
  Time: 11:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>我的消息</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <meta name="keywords" content="fly,layui,前端社区">
    <meta name="description" content="Fly社区是模块化前端UI框架Layui的官网社区，致力于为web开发提供强劲动力">
    <link rel="stylesheet" href="../../res/layui/css/layui.css">
    <link rel="stylesheet" href="../../res/css/global.css">
</head>
<body>

<%@include file="../common/header.jsp"%>
<div class="layui-container fly-marginTop fly-user-main">
    <%@include file="../common/user_nav.jsp"%>

    <div class="fly-panel fly-panel-user" pad20>
        <div class="layui-tab layui-tab-brief" lay-filter="user" id="LAY_msg" style="margin-top: 15px;">
            <button class="layui-btn layui-btn-danger" id="LAY_delallmsg">清空全部消息</button>
            <div  id="LAY_minemsg" style="margin-top: 10px;">
                <!--<div class="fly-none">您暂时没有最新消息</div>-->
                <ul class="mine-msg">
                    <c:forEach items="${messages}" var="message">
                        <li data-id="${message.msg_id}">
                            <blockquote class="layui-elem-quote">
                                <a href="${pageContext.request.contextPath}/user/home/${message.userid}" target="_blank"><cite>${message.nickname}</cite></a>${message.msg_content1}<a target="_blank" href="${pageContext.request.contextPath}/jie/detail/${message.topic_id}"><cite>${message.title}</cite>${message.msg_content2}</a>
                            </blockquote>
                            <p><span>${message.create_time}</span><a href="javascript:;" class="layui-btn layui-btn-small layui-btn-danger fly-delete">删除</a></p>
                        </li>
                    </c:forEach>

                    <%--<li data-id="123">--%>
                        <%--<blockquote class="layui-elem-quote">--%>
                            <%--系统消息：欢迎使用 layui--%>
                        <%--</blockquote>--%>
                        <%--<p><span>1小时前</span><a href="javascript:;" class="layui-btn layui-btn-small layui-btn-danger fly-delete">删除</a></p>--%>
                    <%--</li>--%>
                </ul>
            </div>
        </div>
    </div>

</div>


<div class="fly-footer">
    <p><a href="http://fly.layui.com/" target="_blank">Fly社区</a> 2017 &copy; <a href="http://www.layui.com/" target="_blank">layui.com 出品</a></p>
    <p>
        <a href="http://fly.layui.com/jie/3147/" target="_blank">付费计划</a>
        <a href="http://www.layui.com/template/fly/" target="_blank">获取Fly社区模版</a>
        <a href="http://fly.layui.com/jie/2461/" target="_blank">微信公众号</a>
    </p>
</div>

<script src="../../res/layui/layui.js"></script>
<script>
    layui.cache.page = 'user';
    <%@include file="../common/cache_user.jsp"%>
    layui.config({
        version: "3.0.0"
        ,base: '../../res/mods/'
    }).extend({
        fly: 'index'
    }).use('fly',function () {
        var $ = layui.jquery;
        $('.neu-nav-item').eq(3).addClass('layui-this').siblings().removeClass('layui-this')
    });
</script>

</body>
</html>
