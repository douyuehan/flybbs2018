<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/12/13
  Time: 10:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="fly-panel fly-column">
    <div class="layui-container">
        <ul class="layui-clear">
            <li class="layui-hide-xs layui-this"><a href="${pageContext.request.contextPath}/">首页</a></li>
            <li><a href="${pageContext.request.contextPath}/jie/index/1/0">提问</a></li>
            <li><a href="${pageContext.request.contextPath}/jie/index/2/0">分享<span class="layui-badge-dot"></span></a></li>
            <li><a href="${pageContext.request.contextPath}/jie/index/3/0">讨论</a></li>
            <li><a href="${pageContext.request.contextPath}/jie/index/4/0">建议</a></li>
            <li><a href="${pageContext.request.contextPath}/jie/index/5/0">公告</a></li>
            <li><a href="${pageContext.request.contextPath}/jie/index/6/0">动态</a></li>
            <li class="layui-hide-xs layui-hide-sm layui-show-md-inline-block"><span class="fly-mid"></span></li>

            <!-- 用户登入后显示 -->
            <li class="layui-hide-xs layui-hide-sm layui-show-md-inline-block"><a href="user/index.html">我发表的贴</a></li>
            <li class="layui-hide-xs layui-hide-sm layui-show-md-inline-block"><a href="user/index.html#collection">我收藏的贴</a></li>
        </ul>

        <div class="fly-column-right layui-hide-xs">
            <span class="fly-search"><i class="layui-icon"></i></span>
            <a href="${pageContext.request.contextPath}/jie/add/0" class="layui-btn">发表新帖</a>
        </div>
        <div class="layui-hide-sm layui-show-xs-block" style="margin-top: -10px; padding-bottom: 10px; text-align: center;">
            <a href="${pageContext.request.contextPath}/jie/add/0" class="layui-btn">发表新帖</a>
        </div>
    </div>
</div>
