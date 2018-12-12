<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/12/11
  Time: 15:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/res/layui/css/layui.css" media="all">
    <script src="${pageContext.request.contextPath}/res/layui/layui.all.js"></script>
    <script src="${pageContext.request.contextPath}/res/jquery-3.3.1.js"></script>
    <script>

        function fillCurrentPageData(jsonObj) {
            var getTpl = demo.innerHTML;
            var view = document.getElementById('data');

            layui.laytpl(getTpl).render(jsonObj, function(html){
                view.innerHTML = html;
            });
        }

        function getPageData(pageInfo) {

            if(!pageInfo)
            {
                pageInfo = {};
                pageInfo.pageSize = 3;
                pageInfo.pageIndex = 1;
            }

            $.ajax({
                url:'${pageContext.request.contextPath}/getpagedata/',
                type:'post',
                dataType:'json',
                data:pageInfo,
                success:function (jsonObj) {
                    //执行一个laypage实例
                    var laypage = layui.laypage;

                    laypage.render({
                        elem: 'page' //注意，这里的 test1 是 ID，不用加 # 号
                        ,limit:pageInfo.pageSize
                        ,curr:pageInfo.pageIndex
                        ,count:jsonObj.total//数据总数，从服务端得到
                        ,first:"首页"
                        ,last:"尾页"
                        ,jump: function(obj, first){
                            //obj包含了当前分页的所有参数，比如：
//                        console.log(obj.curr); //得到当前页，以便向服务端请求对应页的数据。
//                        console.log(obj.limit); //得到每页显示的条数
                            if(!first)
                            {
                                pageInfo.pageIndex = obj.curr;
                                pageInfo.pageSize = obj.limit;
                                getPageData(pageInfo);
                            }
                        }
                    });

                    //填充当前页的数据
                    fillCurrentPageData(jsonObj);
                }
            })
        }

        $(function () {
            getPageData();
        })

    </script>
</head>
<body>
<script id="demo" type="text/html">
    <table>
        <tr>
            <td>昵称</td>
            <td>邮箱</td>
        </tr>
        {{#  layui.each(d.datas, function(index, item){ }}
        <tr>
            <td>{{item.nickname}}</td>
            <td>{{item.email}}</td>
        </tr>
        {{#  }); }}
    </table>
</script>

<input type="text">

<div id="data">

</div>
<div id="page">

</div>
</body>
</html>


