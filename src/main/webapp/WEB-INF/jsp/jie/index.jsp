<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/12/13
  Time: 10:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>基于 layui 的极简社区页面模版</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <meta name="keywords" content="fly,layui,前端社区">
    <meta name="description" content="Fly社区是模块化前端UI框架Layui的官网社区，致力于为web开发提供强劲动力">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/res/layui/css/layui.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/res/css/global.css">
</head>
<body>

<%@include file="../common/header.jsp"%>

<%@include file="../common/column.jsp"%>


<div class="layui-container">
    <div class="layui-row layui-col-space15">
        <div class="layui-col-md8">
            <div class="fly-panel" style="margin-bottom: 0;">

                <div class="fly-panel-title fly-filter">
                    <a href="" class="layui-this">综合</a>
                    <span class="fly-mid"></span>
                    <a href="">未结</a>
                    <span class="fly-mid"></span>
                    <a href="">已结</a>
                    <span class="fly-mid"></span>
                    <a href="">精华</a>
                    <span class="fly-filter-right layui-hide-xs">
            <a href="" class="layui-this">按最新</a>
            <span class="fly-mid"></span>
            <a href="">按热议</a>
          </span>
                </div>

                <ul class="fly-list" id="page_topics">



                </ul>

                <!-- <div class="fly-none">没有相关数据</div> -->

                <div style="text-align: center" id="laypage-main">
                    <%--<div class="laypage-main" >--%>
                    <%--&lt;%&ndash;<a href="jie/index.html" class="laypage-next">更多求解</a>&ndash;%&gt;--%>
                    <%--</div>--%>
                </div>

            </div>
        </div>
        <div class="layui-col-md4">
            <dl class="fly-panel fly-list-one">
                <dt class="fly-panel-title">本周热议</dt>
                <dd>
                    <a href="">基于 layui 的极简社区页面模版</a>
                    <span><i class="iconfont icon-pinglun1"></i> 16</span>
                </dd>
                <dd>
                    <a href="">基于 layui 的极简社区页面模版</a>
                    <span><i class="iconfont icon-pinglun1"></i> 16</span>
                </dd>
                <dd>
                    <a href="">基于 layui 的极简社区页面模版</a>
                    <span><i class="iconfont icon-pinglun1"></i> 16</span>
                </dd>
                <dd>
                    <a href="">基于 layui 的极简社区页面模版</a>
                    <span><i class="iconfont icon-pinglun1"></i> 16</span>
                </dd>
                <dd>
                    <a href="">基于 layui 的极简社区页面模版</a>
                    <span><i class="iconfont icon-pinglun1"></i> 16</span>
                </dd>
                <dd>
                    <a href="">基于 layui 的极简社区页面模版</a>
                    <span><i class="iconfont icon-pinglun1"></i> 16</span>
                </dd>
                <dd>
                    <a href="">基于 layui 的极简社区页面模版</a>
                    <span><i class="iconfont icon-pinglun1"></i> 16</span>
                </dd>
                <dd>
                    <a href="">基于 layui 的极简社区页面模版</a>
                    <span><i class="iconfont icon-pinglun1"></i> 16</span>
                </dd>
                <dd>
                    <a href="">基于 layui 的极简社区页面模版</a>
                    <span><i class="iconfont icon-pinglun1"></i> 16</span>
                </dd>
                <dd>
                    <a href="">基于 layui 的极简社区页面模版</a>
                    <span><i class="iconfont icon-pinglun1"></i> 16</span>
                </dd>

                <!-- 无数据时 -->
                <!--
                <div class="fly-none">没有相关数据</div>
                -->
            </dl>

            <div class="fly-panel">
                <div class="fly-panel-title">
                    这里可作为广告区域
                </div>
                <div class="fly-panel-main">
                    <a href="" target="_blank" class="fly-zanzhu" style="background-color: #393D49;">虚席以待</a>
                </div>
            </div>

            <div class="fly-panel fly-link">
                <h3 class="fly-panel-title">友情链接</h3>
                <dl class="fly-panel-main">
                    <dd><a href="http://www.layui.com/" target="_blank">layui</a><dd>
                    <dd><a href="http://layim.layui.com/" target="_blank">WebIM</a><dd>
                    <dd><a href="http://layer.layui.com/" target="_blank">layer</a><dd>
                    <dd><a href="http://www.layui.com/laydate/" target="_blank">layDate</a><dd>
                    <dd><a href="mailto:xianxin@layui-inc.com?subject=%E7%94%B3%E8%AF%B7Fly%E7%A4%BE%E5%8C%BA%E5%8F%8B%E9%93%BE" class="fly-link">申请友链</a><dd>
                </dl>
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

<script id="topic_list" type="text/html">


    {{#  layui.each(d.topics,function(index,topic){   }}
    <li>
        <a href="${pageContext.request.contextPath}/user/home/{{topic.userid}}" class="fly-avatar">
            {{# if(topic.pic_path!=''){ }}
            <img src="${pageContext.request.contextPath}/res/uploadImgs/{{topic.pic_path}}" alt="{{topic.nickname}}">
            {{#    }else{  }}
            <img src="https://tva1.sinaimg.cn/crop.0.0.118.118.180/5db11ff4gw1e77d3nqrv8j203b03cweg.jpg">
            {{#   }  }}
        </a>
        <h2>
            <a class="layui-badge">{{topic.name}}</a>
            <a href="${pageContext.request.contextPath}/jie/detail/{{topic.id}}">{{topic.title}}</a>
        </h2>
        <div class="fly-list-info">
            <a href="user/home.html" link>
                <cite>{{topic.nickname}}</cite>
                <!--
                <i class="iconfont icon-renzheng" title="认证信息：XXX"></i>
                <i class="layui-badge fly-badge-vip">VIP3</i>
                -->
            </a>
            <span>{{topic.create_time}}</span>

            <span class="fly-list-kiss layui-hide-xs" title="悬赏飞吻"><i class="iconfont icon-kiss"></i> {{topic.kiss_num}}</span>
            <!--<span class="layui-badge fly-badge-accept layui-hide-xs">已结</span>-->
            <span class="fly-list-nums">
                <i class="iconfont icon-pinglun1" title="回答"></i> {{topic.comment_num}}
              </span>
        </div>
        <div class="fly-list-badge">
            <!--<span class="layui-badge layui-bg-red">精帖</span>-->
        </div>
    </li>
    {{# });   }}
</script>


<script src="${pageContext.request.contextPath}/res/layui/layui.js"></script>
<script>
    layui.cache.page = 'jie';
    layui.cache.user = {
        username: '游客'
        ,uid: -1
        ,avatar: '${pageContext.request.contextPath}/res/images/avatar/00.jpg'
        ,experience: 83
        ,sex: '男'
    };

    function fillTopicList(jsonData) {
        //模板替换--把jsonData绑定到topic_list模板上
        var tpl = topic_list.innerHTML;

        layui.laytpl(tpl).render(jsonData,function (html) {
//            alert(html)
            document.getElementById('page_topics').innerHTML = html;
        })

    }

    function getPagedTopic(pageInfo,jq) {
        var $ = jq;
        if(!pageInfo)
        {
            var pageInfo = {};
            pageInfo.pageIndex = 1;
            pageInfo.pageSize = 2;
            pageInfo.cid = ${cid};
        }

        $.ajax({
            url:'${pageContext.request.contextPath}/topic/get_paged_topic',
            type:'post',
            dataType:'json',
            data:pageInfo,
            success:function (res) {
//                alert(res.topics[0].title);
                //1.渲染分页组件
                layui.laypage.render({
                    elem: 'laypage-main' //注意，这里的 test1 是 ID，不用加 # 号
                    ,limit:pageInfo.pageSize
                    ,curr:pageInfo.pageIndex
                    ,count:res.num//数据总数，从服务端得到
                    ,first:"首页"
                    ,last:"尾页"
                    ,jump:function (obj,fisrt) {
                        if(!fisrt)
                        {
                            pageInfo.pageSize = obj.limit;
                            pageInfo.pageIndex = obj.curr;
                            pageInfo.cid = ${cid};
                            getPagedTopic(pageInfo,$);
                        }
                    }
                })
                //2.渲染帖子列表
                fillTopicList(res);
            }
        })
    }

    layui.config({
        version: "3.0.0"
        ,base: '${pageContext.request.contextPath}/res/mods/' //这里实际使用时，建议改成绝对路径
    }).extend({
        fly: 'index'
    }).use(['fly','laypage','laytpl'],function () {
        var jq = layui.jquery;
        //请求第一页的数据（每页2条）
        getPagedTopic(null,jq);
    });
</script>


</body>
</html>
