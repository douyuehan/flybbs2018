<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/12/11
  Time: 14:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>用户主页</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <meta name="keywords" content="fly,layui,前端社区">
    <meta name="description" content="Fly社区是模块化前端UI框架Layui的官网社区，致力于为web开发提供强劲动力">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/res/layui/css/layui.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/res/css/global.css">
</head>
<body style="margin-top: 65px;">

<%@include file="../common/header.jsp"%>


<div class="fly-home fly-panel" style="background-image: url();">
    <img src="${pageContext.request.contextPath}/res/uploadImgs/${user.picPath}" alt="贤心">
    <i class="iconfont icon-renzheng" title="Fly社区认证"></i>
    <h1>
        ${user.nickname}
        <i class="iconfont icon-nan"></i>
        <!-- <i class="iconfont icon-nv"></i>  -->
        <i class="layui-badge fly-badge-vip">VIP3</i>
        <!--
        <span style="color:#c00;">（管理员）</span>
        <span style="color:#5FB878;">（社区之光）</span>
        <span>（该号已被封）</span>
        -->
    </h1>

    <p style="padding: 10px 0; color: #5FB878;">认证信息：layui 作者</p>

    <p class="fly-home-info">
        <i class="iconfont icon-kiss" title="飞吻"></i><span style="color: #FF7200;">66666 飞吻</span>
        <i class="iconfont icon-shijian"></i><span>2015-6-17 加入</span>
        <i class="iconfont icon-chengshi"></i><span>来自杭州</span>
    </p>

    <p class="fly-home-sign">（人生仿若一场修行）</p>

    <div class="fly-sns" data-user="">
        <a href="javascript:;" class="layui-btn layui-btn-primary fly-imActive" data-type="addFriend">加为好友</a>
        <a href="javascript:;" class="layui-btn layui-btn-normal fly-imActive" data-type="chat">发起会话</a>
    </div>

</div>

<div class="layui-container">
    <div class="layui-row layui-col-space15">
        <div class="layui-col-md6 fly-home-jie">
            <div class="fly-panel">
                <h3 class="fly-panel-title">贤心 最近的提问</h3>
                <ul class="jie-row">
                    <li>
                        <span class="fly-jing">精</span>
                        <a href="" class="jie-title"> 基于 layui 的极简社区页面模版</a>
                        <i>刚刚</i>
                        <em class="layui-hide-xs">1136阅/27答</em>
                    </li>
                    <li>
                        <a href="" class="jie-title"> 基于 layui 的极简社区页面模版</a>
                        <i>1天前</i>
                        <em class="layui-hide-xs">1136阅/27答</em>
                    </li>
                    <li>
                        <a href="" class="jie-title"> 基于 layui 的极简社区页面模版</a>
                        <i>2017-10-30</i>
                        <em class="layui-hide-xs">1136阅/27答</em>
                    </li>
                    <li>
                        <a href="" class="jie-title"> 基于 layui 的极简社区页面模版</a>
                        <i>1天前</i>
                        <em class="layui-hide-xs">1136阅/27答</em>
                    </li>
                    <li>
                        <a href="" class="jie-title"> 基于 layui 的极简社区页面模版</a>
                        <i>1天前</i>
                        <em class="layui-hide-xs">1136阅/27答</em>
                    </li>
                    <li>
                        <a href="" class="jie-title"> 基于 layui 的极简社区页面模版</a>
                        <i>1天前</i>
                        <em class="layui-hide-xs">1136阅/27答</em>
                    </li>
                    <li>
                        <a href="" class="jie-title"> 基于 layui 的极简社区页面模版</a>
                        <i>1天前</i>
                        <em class="layui-hide-xs">1136阅/27答</em>
                    </li>
                    <!-- <div class="fly-none" style="min-height: 50px; padding:30px 0; height:auto;"><i style="font-size:14px;">没有发表任何求解</i></div> -->
                </ul>
            </div>
        </div>

        <div class="layui-col-md6 fly-home-da">
            <div class="fly-panel">
                <h3 class="fly-panel-title">贤心 最近的回答</h3>
                <ul class="home-jieda">
                    <li>
                        <p>
                            <span>1分钟前</span>
                            在<a href="" target="_blank">tips能同时渲染多个吗?</a>中回答：
                        </p>
                        <div class="home-dacontent">
                            尝试给layer.photos加上这个属性试试：
                            <pre>
full: true
</pre>
                            文档没有提及
                        </div>
                    </li>
                    <li>
                        <p>
                            <span>5分钟前</span>
                            在<a href="" target="_blank">在Fly社区用的是什么系统啊?</a>中回答：
                        </p>
                        <div class="home-dacontent">
                            Fly社区采用的是NodeJS。分享出来的只是前端模版
                        </div>
                    </li>

                    <!-- <div class="fly-none" style="min-height: 50px; padding:30px 0; height:auto;"><span>没有回答任何问题</span></div> -->
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

<script src="${pageContext.request.contextPath}/res/layui/layui.js"></script>
<script>
    layui.cache.page = 'user';
    layui.cache.user = {
        username: '游客'
        ,uid: -1
        ,avatar: '${pageContext.request.contextPath}/res/images/avatar/00.jpg'
        ,experience: 83
        ,sex: '男'
    };
    layui.config({
        version: "3.0.0"
        ,base: '${pageContext.request.contextPath}/res/mods/'
    }).extend({
        fly: 'index'
    }).use('fly');
</script>

</body>
</html>