<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/12/6
  Time: 14:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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

<%@include file="common/header.jsp"%>

<%@include file="common/column.jsp"%>


<div class="layui-container">
    <div class="layui-row layui-col-space15">
        <div class="layui-col-md8">
            <div class="fly-panel">
                <div class="fly-panel-title fly-filter">
                    <a>置顶</a>
                    <a href="#signin" class="layui-hide-sm layui-show-xs-block fly-right" id="LAY_goSignin" style="color: #FF5722;">去签到</a>
                </div>
                <ul class="fly-list">

                    <c:forEach items="${top_topics}" var="topic">

                        <li>
                            <a href="${pageContext.request.contextPath}/user/home/${topic.userid}" class="fly-avatar">
                                <c:choose>
                                    <c:when test="${topic.pic_path != ''}">
                                        <img src="${pageContext.request.contextPath}/res/uploadImgs/${topic.pic_path}" alt="${topic.nickname}">
                                    </c:when>
                                    <c:otherwise>
                                        <img src="https://tva1.sinaimg.cn/crop.0.0.118.118.180/5db11ff4gw1e77d3nqrv8j203b03cweg.jpg">
                                    </c:otherwise>
                                </c:choose>
                            </a>
                            <h2>
                                <a class="layui-badge">${topic.name}</a>
                                <a href="${pageContext.request.contextPath}/jie/detail/${topic.id}">${topic.title}</a>
                            </h2>
                            <div class="fly-list-info">
                                <a href="${pageContext.request.contextPath}/user/home/${topic.userid}" link>
                                    <cite>${topic.nickname}</cite>
                                    <!--
                                    <i class="iconfont icon-renzheng" title="认证信息：XXX"></i>
                                    <i class="layui-badge fly-badge-vip">VIP3</i>
                                    -->
                                </a>
                                <span>${topic.create_time}</span>
                                <span class="fly-list-kiss layui-hide-xs" title="悬赏飞吻"><i class="iconfont icon-kiss"></i> ${topic.kiss_num}</span>
                                <!--<span class="layui-badge fly-badge-accept layui-hide-xs">已结</span>-->
                                <span class="fly-list-nums">
                <i class="iconfont icon-pinglun1" title="回答"></i> ${topic.comment_num}
              </span>
                            </div>
                            <div class="fly-list-badge">
                                <!--
                              <span class="layui-badge layui-bg-black">置顶</span>
                              <span class="layui-badge layui-bg-red">精帖</span>
                              -->
                            </div>
                        </li>
                    </c:forEach>


                </ul>
            </div>

            <div class="fly-panel" style="margin-bottom: 0;">

                <div class="fly-panel-title fly-filter" id="topic-type">
                    <a href="${pageContext.request.contextPath}/jie/index/0/0" class="layui-this">综合</a>
                    <span class="fly-mid"></span>
                    <a href="${pageContext.request.contextPath}/jie/index/0/1">未结</a>
                    <span class="fly-mid"></span>
                    <a href="${pageContext.request.contextPath}/jie/index/0/2">已结</a>
                    <span class="fly-mid"></span>
                    <a href="${pageContext.request.contextPath}/jie/index/0/3">精华</a>
                    <%--<span class="fly-filter-right layui-hide-xs">--%>
            <%--<a href="" class="layui-this">按最新</a>--%>
            <%--<span class="fly-mid"></span>--%>
            <%--<a href="">按热议</a>--%>
          <%--</span>--%>
                </div>

                <ul class="fly-list" id="page_topics">













                </ul>

                <div style="text-align: center" id="laypage-main">
                    <%--<div class="laypage-main" >--%>
                        <%--&lt;%&ndash;<a href="jie/index.html" class="laypage-next">更多求解</a>&ndash;%&gt;--%>
                    <%--</div>--%>
                </div>

            </div>
        </div>
        <div class="layui-col-md4">

            <div class="fly-panel">
                <h3 class="fly-panel-title">温馨通道</h3>
                <ul class="fly-panel-main fly-list-static">
                    <li>
                        <a href="http://fly.layui.com/jie/4281/" target="_blank">layui 的 GitHub 及 Gitee (码云) 仓库，欢迎Star</a>
                    </li>
                    <li>
                        <a href="http://fly.layui.com/jie/5366/" target="_blank">
                            layui 常见问题的处理和实用干货集锦
                        </a>
                    </li>
                    <li>
                        <a href="http://fly.layui.com/jie/4281/" target="_blank">layui 的 GitHub 及 Gitee (码云) 仓库，欢迎Star</a>
                    </li>
                    <li>
                        <a href="http://fly.layui.com/jie/5366/" target="_blank">
                            layui 常见问题的处理和实用干货集锦
                        </a>
                    </li>
                    <li>
                        <a href="http://fly.layui.com/jie/4281/" target="_blank">layui 的 GitHub 及 Gitee (码云) 仓库，欢迎Star</a>
                    </li>
                </ul>
            </div>


            <div class="fly-panel fly-signin">
                <div class="fly-panel-title">
                    签到
                    <i class="fly-mid"></i>
                    <a href="javascript:;" class="fly-link" id="LAY_signinHelp">说明</a>
                    <i class="fly-mid"></i>
                    <a href="javascript:;" class="fly-link" id="LAY_signinTop">活跃榜<span class="layui-badge-dot"></span></a>
                    <span class="fly-signin-days">已连续签到<cite>16</cite>天</span>
                </div>
                <div class="fly-panel-main fly-signin-main">
                    <button class="layui-btn layui-btn-danger" id="LAY_signin">今日签到</button>
                    <span>可获得<cite>5</cite>飞吻</span>

                    <!-- 已签到状态 -->
                    <!--
                    <button class="layui-btn layui-btn-disabled">今日已签到</button>
                    <span>获得了<cite>20</cite>飞吻</span>
                    -->
                </div>
            </div>

            <div class="fly-panel fly-rank fly-rank-reply" id="LAY_replyRank">
                <h3 class="fly-panel-title">回贴周榜</h3>
                <dl>
                    <!--<i class="layui-icon fly-loading">&#xe63d;</i>-->
                    <dd>
                        <a href="user/home.html">
                            <img src="https://tva1.sinaimg.cn/crop.0.0.118.118.180/5db11ff4gw1e77d3nqrv8j203b03cweg.jpg"><cite>贤心</cite><i>106次回答</i>
                        </a>
                    </dd>
                    <dd>
                        <a href="user/home.html">
                            <img src="https://tva1.sinaimg.cn/crop.0.0.118.118.180/5db11ff4gw1e77d3nqrv8j203b03cweg.jpg"><cite>贤心</cite><i>106次回答</i>
                        </a>
                    </dd>
                    <dd>
                        <a href="user/home.html">
                            <img src="https://tva1.sinaimg.cn/crop.0.0.118.118.180/5db11ff4gw1e77d3nqrv8j203b03cweg.jpg"><cite>贤心</cite><i>106次回答</i>
                        </a>
                    </dd>
                    <dd>
                        <a href="user/home.html">
                            <img src="https://tva1.sinaimg.cn/crop.0.0.118.118.180/5db11ff4gw1e77d3nqrv8j203b03cweg.jpg"><cite>贤心</cite><i>106次回答</i>
                        </a>
                    </dd>
                    <dd>
                        <a href="user/home.html">
                            <img src="https://tva1.sinaimg.cn/crop.0.0.118.118.180/5db11ff4gw1e77d3nqrv8j203b03cweg.jpg"><cite>贤心</cite><i>106次回答</i>
                        </a>
                    </dd>
                    <dd>
                        <a href="user/home.html">
                            <img src="https://tva1.sinaimg.cn/crop.0.0.118.118.180/5db11ff4gw1e77d3nqrv8j203b03cweg.jpg"><cite>贤心</cite><i>106次回答</i>
                        </a>
                    </dd>
                    <dd>
                        <a href="user/home.html">
                            <img src="https://tva1.sinaimg.cn/crop.0.0.118.118.180/5db11ff4gw1e77d3nqrv8j203b03cweg.jpg"><cite>贤心</cite><i>106次回答</i>
                        </a>
                    </dd>
                    <dd>
                        <a href="user/home.html">
                            <img src="https://tva1.sinaimg.cn/crop.0.0.118.118.180/5db11ff4gw1e77d3nqrv8j203b03cweg.jpg"><cite>贤心</cite><i>106次回答</i>
                        </a>
                    </dd>
                    <dd>
                        <a href="user/home.html">
                            <img src="https://tva1.sinaimg.cn/crop.0.0.118.118.180/5db11ff4gw1e77d3nqrv8j203b03cweg.jpg"><cite>贤心</cite><i>106次回答</i>
                        </a>
                    </dd>
                    <dd>
                        <a href="user/home.html">
                            <img src="https://tva1.sinaimg.cn/crop.0.0.118.118.180/5db11ff4gw1e77d3nqrv8j203b03cweg.jpg"><cite>贤心</cite><i>106次回答</i>
                        </a>
                    </dd>
                    <dd>
                        <a href="user/home.html">
                            <img src="https://tva1.sinaimg.cn/crop.0.0.118.118.180/5db11ff4gw1e77d3nqrv8j203b03cweg.jpg"><cite>贤心</cite><i>106次回答</i>
                        </a>
                    </dd>
                    <dd>
                        <a href="user/home.html">
                            <img src="https://tva1.sinaimg.cn/crop.0.0.118.118.180/5db11ff4gw1e77d3nqrv8j203b03cweg.jpg"><cite>贤心</cite><i>106次回答</i>
                        </a>
                    </dd>
                </dl>
            </div>

            <dl class="fly-panel fly-list-one">
                <dt class="fly-panel-title">本周热议</dt>
                <dd>
                    <a href="jie/detail.html">基于 layui 的极简社区页面模版</a>
                    <span><i class="iconfont icon-pinglun1"></i> 16</span>
                </dd>
                <dd>
                    <a href="jie/detail.html">基于 layui 的极简社区页面模版</a>
                    <span><i class="iconfont icon-pinglun1"></i> 16</span>
                </dd>
                <dd>
                    <a href="jie/detail.html">基于 layui 的极简社区页面模版</a>
                    <span><i class="iconfont icon-pinglun1"></i> 16</span>
                </dd>
                <dd>
                    <a href="jie/detail.html">基于 layui 的极简社区页面模版</a>
                    <span><i class="iconfont icon-pinglun1"></i> 16</span>
                </dd>
                <dd>
                    <a href="jie/detail.html">基于 layui 的极简社区页面模版</a>
                    <span><i class="iconfont icon-pinglun1"></i> 16</span>
                </dd>
                <dd>
                    <a href="jie/detail.html">基于 layui 的极简社区页面模版</a>
                    <span><i class="iconfont icon-pinglun1"></i> 16</span>
                </dd>
                <dd>
                    <a href="jie/detail.html">基于 layui 的极简社区页面模版</a>
                    <span><i class="iconfont icon-pinglun1"></i> 16</span>
                </dd>
                <dd>
                    <a href="jie/detail.html">基于 layui 的极简社区页面模版</a>
                    <span><i class="iconfont icon-pinglun1"></i> 16</span>
                </dd>
                <dd>
                    <a href="jie/detail.html">基于 layui 的极简社区页面模版</a>
                    <span><i class="iconfont icon-pinglun1"></i> 16</span>
                </dd>
                <dd>
                    <a href="jie/detail.html">基于 layui 的极简社区页面模版</a>
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
                    <a href="http://layim.layui.com/?from=fly" target="_blank" class="fly-zanzhu" time-limit="2017.09.25-2099.01.01" style="background-color: #5FB878;">LayIM 3.0 - layui 旗舰之作</a>
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
                <a href="user/home/{{topic.userid}}" link>
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
    layui.cache.page = '';

    <%@include file="common/cache_user.jsp"%>

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
            pageInfo.pageSize = 10;
            pageInfo.cid = 0;
            pageInfo.typeid = ${typeid};
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

        $('#topic-type').find('a').eq(${typeid}).addClass('layui-this').siblings().removeClass('layui-this');
    });
</script>

<script type="text/javascript">var cnzz_protocol = (("https:" == document.location.protocol) ? " https://" : " http://");document.write(unescape("%3Cspan id='cnzz_stat_icon_30088308'%3E%3C/span%3E%3Cscript src='" + cnzz_protocol + "w.cnzz.com/c.php%3Fid%3D30088308' type='text/javascript'%3E%3C/script%3E"));</script>

</body>
</html>
