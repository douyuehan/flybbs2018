<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/12/21
  Time: 10:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:choose>
    <c:when test="${!empty userinfo}">
        layui.cache.user = {
        username: '${userinfo.nickname}'
        ,uid: ${userinfo.id}
        ,avatar: '${pageContext.request.contextPath}/res/uploadImgs/${userinfo.picPath}'
        ,experience: 83
        ,sex: '男'
        };
    </c:when>
    <c:otherwise>
        layui.cache.user = {
        username: '游客'
        ,uid: -1
        ,avatar: '../../res/images/avatar/00.jpg'
        ,experience: 83
        ,sex: '男'
        };
    </c:otherwise>
</c:choose>
