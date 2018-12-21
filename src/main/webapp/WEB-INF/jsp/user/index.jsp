<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/12/20
  Time: 10:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>用户中心</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <meta name="keywords" content="fly,layui,前端社区">
    <meta name="description" content="Fly社区是模块化前端UI框架Layui的官网社区，致力于为web开发提供强劲动力">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/res/layui/css/layui.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/res/css/global.css">
</head>
<body>

<%@include file="../common/header.jsp"%>

<div class="layui-container fly-marginTop fly-user-main">
<%@include file="../common/user_nav.jsp"%>

    <div class="fly-panel fly-panel-user" pad20>
        <!--
        <div class="fly-msg" style="margin-top: 15px;">
          您的邮箱尚未验证，这比较影响您的帐号安全，<a href="activate.html">立即去激活？</a>
        </div>
        -->
        <div class="layui-tab layui-tab-brief" lay-filter="user">
            <ul class="layui-tab-title" id="LAY_mine">
                <li data-type="mine-jie" lay-id="index" class="layui-this">我发的帖（<span>${topic_num}</span>）</li>
                <li data-type="collection" data-url="/collection/find/" lay-id="collection">我收藏的帖（<span>${collect_num}</span>）</li>
            </ul>
            <div class="layui-tab-content" style="padding: 20px 0;">
                <div class="layui-tab-item layui-show">
                    <ul class="mine-view jie-row">
                        <c:forEach items="${topics}" var="topic">
                            <li>
                                <a class="jie-title" href="${pageContext.request.contextPath}/jie/detail/${topic.id}" target="_blank">${topic.title}</a>
                                <i>${topic.createTimeStr}</i>
                                <a class="mine-edit" href="${pageContext.request.contextPath}/jie/add/${topic.id}">编辑</a>
                                <em>${topic.viewTimes}阅/${topic.commentNum}答</em>
                            </li>
                        </c:forEach>


                    </ul>
                    <div id="LAY_page"></div>
                </div>
                <div class="layui-tab-item">
                    <ul class="mine-view jie-row">
                        <c:forEach items="${collections}" var="collect">
                            <li>
                                <a class="jie-title" href="${pageContext.request.contextPath}/jie/detail/${collect.id}" target="_blank">${collect.title}</a>

                            </li>
                        </c:forEach>

                    </ul>
                    <div id="LAY_page1"></div>
                </div>
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

<script src="${pageContext.request.contextPath}/res/layui/layui.js"></script>
<script>
    layui.cache.page = 'user';
    <%@include file="../common/cache_user.jsp"%>
    layui.config({
        version: "3.0.0"
        ,base: '${pageContext.request.contextPath}/res/mods/'
    }).extend({
        fly: 'index'
    }).use('fly',function () {
        var $ = layui.jquery;
        $('.neu-nav-item').eq(1).addClass('layui-this').siblings().removeClass('layui-this')
    });
</script>

</body>
</html>