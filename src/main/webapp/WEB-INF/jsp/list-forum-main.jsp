<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">


    <title>项目管理系统 - 论坛</title>
    <meta name="keywords" content="项目管理系统">
    <meta name="description" content="项目管理系统">

    <link rel="shortcut icon" href="favicon.ico">
    <link href="/css/bootstrap.min14ed.css?v=3.3.6" rel="stylesheet">
    <link href="/css/font-awesome.min93e3.css?v=4.4.0" rel="stylesheet">
    <link href="/css/font-awesome.min93e3.css?v=4.4.0" rel="stylesheet">
    <link href="/css/animate.min.css" rel="stylesheet">
    <link href="/css/style.min862f.css?v=4.1.0" rel="stylesheet">

</head>

<body class="gray-bg">
<div class="row">
    <div class="wrapper wrapper-content animated fadeInRight">
        <div class="row">
            <div class="col-sm-12">
                <div class="wrapper wrapper-content animated fadeInRight">

                    <div class="ibox-content m-b-sm border-bottom">
                        <div class="p-xs">
                            <div class="pull-left m-r-md">
                                <i class="fa fa-globe text-navy mid-icon"></i>
                            </div>
                            <h2>欢迎来到H+论坛</h2>
                            <span>你可以自由选择你感兴趣的话题。</span>
                        </div>
                    </div>

                    <div class="ibox-content forum-container">

                        <div class="forum-title">
                            <div class="pull-right forum-desc">
                                <samll>总帖子数： <span id="mainSum"></span></samll>
                            </div>
                            <h3>主版</h3>
                        </div>

                        <c:forEach items="${list}" var="forumsort" begin="0" varStatus="index">
                        <c:if test="${forumsort.type==0}">

                        <div class="forum-item <c:if test="${index.index%2==0}">active</c:if> ">
                            <div class="row">
                                <div class="col-sm-10">
                                    <div class="forum-icon">
                                        <c:if test="${index.index==0}"><i class="fa fa-shield"></i></c:if>
                                        <c:if test="${index.index==1}"><i class="fa fa-bolt"></i></c:if>
                                        <c:if test="${index.index==2}"><i class="fa fa-calendar"></i></c:if>
                                        <c:if test="${index.index==3}"><i class="fa fa-star"></i></c:if>
                                    </div>
                                    <a href="/forumpost/list?forumsort_fk=${forumsort.id}" class="forum-item-title">${forumsort.title}</a>
                                    <div class="forum-sub-title">${forumsort.description}</div>
                                </div>
                                <div class="col-sm-1 forum-info">
                                        <span class="views-number">
                                                ${forumsort.click}
                                        </span>
                                    <div>
                                        <small>浏览</small>
                                    </div>
                                </div>
                                <div class="col-sm-1 forum-info">
                                        <span class="views-number main-number">
                                                ${forumsort.count}
                                        </span>
                                    <div>
                                        <small>帖子</small>
                                    </div>
                                </div>
                            </div>
                        </div>
                        </c:if>
                        </c:forEach>


                        <div class="forum-title">
                            <div class="pull-right forum-desc">
                                <samll>总贴子数：<span id="fuSum"></span></samll>
                            </div>
                            <h3>副版</h3>
                        </div>


                        <c:forEach items="${list}" var="forumsort" begin="0" varStatus="index">
                        <c:if test="${forumsort.type==1}">
                        <div class="forum-item">
                            <div class="row">
                                <div class="col-sm-10">
                                    <div class="forum-icon">
                                        <c:if test="${index.index==4}"><i class="fa fa-clock-o"></i></c:if>
                                        <c:if test="${index.index==5}"><i class="fa fa-bomb"></i></c:if>
                                        <c:if test="${index.index==6}"><i class="fa fa-bookmark"></i></c:if>
                                    </div>
                                    <a href="/forumpost/list?forumsort_fk=${forumsort.id}" class="forum-item-title">${forumsort.title}</a>
                                    <div class="forum-sub-title">${forumsort.description}</div>
                                </div>
                                <div class="col-sm-1 forum-info">
                                        <span class="views-number">
                                                ${forumsort.click}
                                        </span>
                                    <div>
                                        <small>浏览</small>
                                    </div>
                                </div>
                                <div class="col-sm-1 forum-info">
                                        <span class="views-number fu-number">
                                                ${forumsort.count}
                                        </span>
                                    <div>
                                        <small>帖子</small>
                                    </div>
                                </div>
                            </div>
                        </div>
                        </c:if>
                        </c:forEach>




                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script src="/js/jquery.min.js?v=2.1.4"></script>
<script src="/js/bootstrap.min.js?v=3.3.6"></script>
<script src="/js/plugins/peity/jquery.peity.min.js"></script>
<script src="/js/content.min.js?v=1.0.0"></script>
<script type="text/javascript" src="http://tajs.qq.com/stats?sId=9051096" charset="UTF-8"></script>

<script>
    $(function () {
        /*优化前的代码
        //统计主版块帖子总数
        var sumMain=0;
        $(".main-number").each(function () {
            sumMain+=parseInt($(this).text());
        });
        $("#mainSum").html(sumMain);


        //统计副版块
        var sumFu=0;
        $(".fu-number").each(function () {
            sumFu+=parseInt($(this).text());
        });
        $("#fuSum").html(sumFu);

         */

        //优化  ele:".fu-number",".main-number"
        function getSum(ele) {
            var sum=0;
            $(ele).each(function () {
                sum+=parseInt($(this).text());
            });
            return sum;
        }
        $("#fuSum").html(getSum(".fu-number"));
        $("#mainSum").html(getSum(".main-number"));

    });
</script>
</body>


</html>