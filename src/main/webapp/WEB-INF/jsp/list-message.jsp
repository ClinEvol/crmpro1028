<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fun" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<!DOCTYPE html>
<html>

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>项目管理系统 - 收件箱</title>
    <meta name="keywords" content="项目管理系统">
    <meta name="description" content="项目管理系统">

    <link rel="shortcut icon" href="favicon.ico">
    <link href="/css/bootstrap.min14ed.css?v=3.3.6" rel="stylesheet">
    <link href="/css/font-awesome.min93e3.css?v=4.4.0" rel="stylesheet">
    <link href="/css/plugins/iCheck/custom.css" rel="stylesheet">
    <link href="/css/animate.min.css" rel="stylesheet">
    <link href="/css/style.min862f.css?v=4.1.0" rel="stylesheet">

</head>

<body class="gray-bg">
<div class="wrapper wrapper-content">
    <div class="row">
        <div class="col-sm-3">
            <div class="ibox float-e-margins">
                <div class="ibox-content mailbox-content">
                    <div class="file-manager">
                        <a class="btn btn-block btn-primary compose-mail" href="/message/tosave"><i class="fa fa-paper-plane"></i>&nbsp;&nbsp;写信</a>
                        <div class="space-25"></div>
                        <h5>文件夹</h5>
                        <ul class="folder-list m-b-md" style="padding: 0">
                            <li>
                                <a href="/notice/list"> <i class="fa fa-certificate"></i> 公告列表</a>
                            </li>
                            <li>
                                <a href="/message/list?sort=1"> <i class="fa fa-inbox "></i> 收件箱 <span class="label label-warning pull-right">16</span>
                                </a>
                            </li>
                            <li>
                                <a href="/message/list?sort=2"> <i class="fa fa-envelope-o"></i>发件箱</a>
                            </li>

                            <li>
                                <a href="/message/list?sort=2&status=2"> <i class="fa fa-file-text-o"></i> 草稿 <span class="label label-danger pull-right">2</span>
                                </a>
                            </li>
                            <li>
                                <a href="/message/list?sort=1&status=3"> <i class="fa fa-trash-o"></i> 垃圾箱</a>
                            </li>
                        </ul>
                        <h5>收件箱分类</h5>
                        <ul class="category-list" style="padding: 0">
                            <li>
                                <a href="/message/list?type=3&sort=1&keyword=${param.keyword}"> <i class="fa fa-circle text-navy"></i> 重要</a>
                            </li>
                            <li>
                                <a href="/message/list?type=0&sort=1&keyword=${param.keyword}"> <i class="fa fa-circle text-danger"></i> 工作</a>
                            </li>
                            <li>
                                <a href="/message/list?type=2&sort=1&keyword=${param.keyword}"> <i class="fa fa-circle text-primary"></i> 文件</a>
                            </li>
                            <li>
                                <a href="/message/list?type=1&sort=1&keyword=${param.keyword}"> <i class="fa fa-circle text-info"></i> 社交</a>
                            </li>

                        </ul>


                        <div class="clearfix"></div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-sm-9 animated fadeInRight">
            <div class="mail-box-header">

                <form method="post" action="/notice/list" class="pull-right mail-search">
                    <div class="input-group">
                        <input value="${param.keyword}"  type="text" class="form-control input-sm" name="keyword" placeholder="搜索标题">
                        <div class="input-group-btn">
                            <button type="submit" class="btn btn-sm btn-primary">
                                <i class="fa fa-search"></i> 搜索
                            </button>
                        </div>
                    </div>
                </form>
                <h2>
                    ${title}
                </h2>
                <div class="mail-tools tooltip-demo m-t-md">


                    <div class="btn-group pull-right">
                        <a href="/message/list?pageNum=${page.pageNum-1}&keyword=${param.keyword}" class="btn btn-sm btn-white <c:if test="${page.pageNum==1}">disabled</c:if> "><i class="glyphicon glyphicon-chevron-left"></i></a>
                        <a href="/message/list?pageNum=${page.pageNum+1}&keyword=${param.keyword}" class="btn btn-sm btn-white <c:if test="${page.pageNum==page.pages}">disabled</c:if> "><i class="glyphicon glyphicon-chevron-right"></i></a>
                    </div>
                    <button class="btn btn-white btn-sm" data-toggle="tooltip" data-placement="left" title="刷新公告列表"><i class="fa fa-refresh"></i> 刷新</button>

                        <button class="btn btn-white btn-sm btnAll" data-toggle="tooltip" data-placement="top" title="全选"><i class="fa fa-check-square-o"></i></button>
                        <button class="btn btn-white btn-sm btnRever" data-toggle="tooltip" data-placement="top" title="反选"><i class="fa fa-square-o"></i></button>
                        <button class="btn btn-white btn-sm btnRemove" data-toggle="tooltip" data-placement="top" title="删除选中的公告"><i class="fa fa-trash-o"></i>
                        </button>
                </div>
            </div>
            <div class="mail-box">

                <table class="table table-hover table-mail">
                    <tbody>
                    <c:forEach items="${page.list}" var="message">
                    <tr class="unread">
                        <td class="check-mail">
                            <input type="checkbox" value="${message.id}" >
                        </td>
                        <td>
                            <c:if test="${message.status==1 and param.sort==1}">
                                <span class="label label-danger pull-left">未读</span>
                            </c:if>
                            <a href="/message/show?id=${message.id}">${message.title}
                            </a>
                            <c:if test="${message.path!=null and !message.path.equals('')}">
                                <i class="fa fa-paperclip"></i>
                            </c:if>

                        </td>
                        <td class="text-right mail-date"><fmt:formatDate value="${message.time}" pattern="yyyy/MM/dd HH:mm"/></td>
                    </tr>
                    </c:forEach>
                    



                    <c:if test="${fun:length(page.list)==0}">
                        <tr>
                            <td class="text-center" colspan="2">
                                没有相关的数据
                            </td>
                        </tr>
                    </c:if>

                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>
<script src="/js/jquery.min.js?v=2.1.4"></script>
<script src="/js/bootstrap.min.js?v=3.3.6"></script>
<script src="/js/content.min.js?v=1.0.0"></script>
<script src="/js/plugins/iCheck/icheck.min.js"></script>
</body>


</html>