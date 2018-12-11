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
    <script>
        var isOk = false;
        function getPageData(pageIndex) {
            var req = new XMLHttpRequest();
            req.open('get','${pageContext.request.contextPath}/getpagedata/'+pageIndex,true);
            req.send();
            req.onload = function () {
//                alert(req.responseText)
                var jsonObj = JSON.parse(req.responseText);
                var laypage = layui.laypage;
                //执行一个laypage实例
                if(isOk == false)
                {
                    laypage.render({
                        elem: 'page' //注意，这里的 test1 是 ID，不用加 # 号
                        ,limit:2
                        ,count:jsonObj.total//数据总数，从服务端得到
                        ,jump: function(obj, first){
                            //obj包含了当前分页的所有参数，比如：
//                        console.log(obj.curr); //得到当前页，以便向服务端请求对应页的数据。
//                        console.log(obj.limit); //得到每页显示的条数
                            if(!first)
                            {
                                getPageData(obj.curr);
                            }
                        }
                    });
                    isOk = true;
                }


                var getTpl = demo.innerHTML;
                var view = document.getElementById('data');

                layui.laytpl(getTpl).render(jsonObj, function(html){
                    view.innerHTML = html;
                });
            }
        }

        window.onload = function () {
            getPageData(1);
        }
    </script>
</head>
<body>
<script id="demo" type="text/html">
    <ul>
        {{#  layui.each(d.datas, function(index, item){ }}
        <li>
            {{item.nickname}}
        </li>
        {{#  }); }}
    </ul>
</script>

<div id="data">

</div>
<div id="page">

</div>
</body>
</html>
