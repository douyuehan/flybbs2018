<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/12/10
  Time: 8:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>发表问题 编辑问题 公用</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <meta name="keywords" content="fly,layui,前端社区">
    <meta name="description" content="Fly社区是模块化前端UI框架Layui的官网社区，致力于为web开发提供强劲动力">
    <link rel="stylesheet" href="../../res/layui/css/layui.css">
    <link rel="stylesheet" href="../../res/css/global.css">
</head>
<body>

<%@include file="../common/header.jsp"%>

<div class="layui-container fly-marginTop">
    <div class="fly-panel" pad20 style="padding-top: 5px;">
        <!--<div class="fly-none">没有权限</div>-->
        <div class="layui-form layui-form-pane">
            <div class="layui-tab layui-tab-brief" lay-filter="user">
                <ul class="layui-tab-title">
                    <li class="layui-this">发表新帖<!-- 编辑帖子 --></li>
                </ul>
                <div class="layui-form layui-tab-content" id="LAY_ucm" style="padding: 20px 0;">
                    <div class="layui-tab-item layui-show">
                        <form action="${pageContext.request.contextPath}/jie/doadd" method="post">
                            <div class="layui-row layui-col-space15 layui-form-item">
                                <div class="layui-col-md3">
                                    <label class="layui-form-label">所在专栏</label>
                                    <div class="layui-input-block">
                                        <c:choose>
                                            <c:when test="${tid > 0}">
                                                <select lay-verify="required" name="topicCategoryId" lay-filter="column" disabled>
                                            </c:when>
                                            <c:otherwise>
                                                <select lay-verify="required" name="topicCategoryId" lay-filter="column">
                                            </c:otherwise>
                                        </c:choose>
                                            <option></option>
                                            <c:forEach items="${categories}" var="category">
                                                <c:choose>
                                                    <c:when test="${category.id == topic.topicCategoryId}">
                                                        <option value="${category.id}" selected>${category.name}</option>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <option value="${category.id}">${category.name}</option>
                                                    </c:otherwise>
                                                </c:choose>

                                            </c:forEach>
                                        </select>
                                    </div>
                                </div>
                                <div class="layui-col-md9">
                                    <label for="L_title" class="layui-form-label">标题</label>
                                    <div class="layui-input-block">
                                        <input type="text" value="${topic.title}" id="L_title" name="title" required lay-verify="required" autocomplete="off" class="layui-input">
                                        <input type="hidden" name="id" value="${tid}">
                                    </div>
                                </div>
                            </div>

                            <div class="layui-form-item layui-form-text">
                                <div class="layui-input-block">
                                    <textarea id="L_content" name="content" required lay-verify="required" placeholder="详细描述" class="layui-textarea fly-editor" style="height: 260px;">${topic.content}</textarea>
                                </div>
                            </div>
                            <div class="layui-form-item">
                                <div class="layui-inline">
                                    <label class="layui-form-label">悬赏飞吻</label>
                                    <div class="layui-input-inline" style="width: 190px;">

                                        <c:choose>
                                            <c:when test="${tid > 0}">
                                                <select name="kissNum" disabled>
                                                    <option value="${topic.kissNum}">${topic.kissNum}</option>
                                                </select>
                                            </c:when>
                                            <c:otherwise>
                                                <select name="kissNum">
                                                    <option value="20">20</option>
                                                    <option value="30">30</option>
                                                    <option value="50">50</option>
                                                    <option value="60">60</option>
                                                    <option value="80">80</option>
                                                </select>
                                            </c:otherwise>
                                        </c:choose>

                                    </div>
                                    <div class="layui-form-mid layui-word-aux">发表后无法更改飞吻</div>
                                </div>
                            </div>
                            <div class="layui-form-item">
                                <label for="L_vercode" class="layui-form-label">人类验证</label>
                                <div class="layui-input-inline">
                                    <input type="text" id="L_vercode" name="vercode" required lay-verify="required" placeholder="请回答后面的问题" autocomplete="off" class="layui-input">
                                </div>
                                <div class="layui-form-mid">
                                    <span style="color: #c00;">1+1=?</span>
                                </div>
                            </div>
                            <div class="layui-form-item">
                                <button class="layui-btn" lay-filter="*" lay-submit>立即发布</button>
                            </div>
                        </form>
                    </div>
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

<script src="../../res/layui/layui.js"></script>
<script>
    layui.cache.page = 'jie';
    <%@include file="../common/cache_user.jsp"%>
    layui.config({
        version: "3.0.0"
        ,base: '../../res/mods/'
    }).extend({
        fly: 'index'
    }).use('fly');
</script>

</body>
</html>
