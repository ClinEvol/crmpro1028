 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">


    <title>项目管理系统 - 基础表格</title>
    <meta name="keywords" content="项目管理系统">
    <meta name="description" content="项目管理系统">

    <link rel="shortcut icon" href="favicon.ico"> 
    	<link href="${pageContext.request.contextPath}/css/bootstrap.min14ed.css?v=3.3.6" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/plugins/sweetalert/sweetalert.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/animate.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/style.min862f.css?v=4.1.0" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/plugins/select/bootstrap-select.min.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/css/font-awesome.min93e3.css?v=4.4.0" rel="stylesheet">
</head>

<body class="gray-bg">
    <div class="wrapper wrapper-content animated fadeInRight">
        
      <div class="row">
            <div class="col-sm-12">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h5>消息管理<small>>查看详情</small></h5>
                    </div>
                    <div class="ibox-content">
                        <form method="get" action="#" class="form-horizontal">
                       	<div class="row">
                            <div class="form-group">
                                <label class="col-sm-2 control-label">标题:</label>
                                <div class="col-sm-9 show-text">
                                    ${message.title}
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="form-group">
                                <label class="col-sm-2 control-label">发件人:</label>
                                <div class="col-sm-2 show-text">
                                    ${message.sender.name}
                                </div>
                                <label class="col-sm-2 control-label">收件时间:</label>
                                 <div class="col-sm-2 show-text">
                                    <fmt:formatDate value="${message.time}" pattern="yyyy/MM/dd HH:mm"/>
                                </div>
                                <label class="col-sm-2 control-label">标签:</label>
                                <div class="col-sm-2 show-text">
                                    <c:if test="${message.type==0}">工作</c:if>
                                    <c:if test="${message.type==1}">社交</c:if>
                                    <c:if test="${message.type==2}">文件</c:if>
                                    <c:if test="${message.type==3}">重要</c:if>
                                </div>
                            </div>
                        </div>
                        
                        
                        <div class="row">
                            <div class="form-group">
                                <label class="col-sm-2 control-label">内容</label>
                                <div class="col-sm-9 show-text">
                                    ${message.content}
                                </div>
                            </div>
                        </div>
                        <c:if test="${message.path!=null and message.path.length()>0}">
                        <div class="row">
                            <div class="form-group">
                                <label class="col-sm-2 control-label">附件:</label>
                                <div class="col-sm-9 show-text">
                                    <a href="/message/download?filename=${message.path}"><i class="fa fa-download"></i> 下载</a>
                                </div>
                            </div>
                        </div>
                        </c:if>

                            <div class="row">
                     		<div class="hr-line-dashed"></div>
                     	</div>
                          
                         <div class="row">
                            <div class="form-group">
                                <div class="col-sm-3 col-sm-offset-3 text-right">
                                    <!--回复时，接收者为该消的发送者-->
                                    <a href="/message/tosave?receive=${message.send}" class="btn btn-primary"><i class="fa fa-paper-plane"></i> 回复</a>
                                </div>
                                <div class="col-sm-3">
                                	<a href="javascript:history.back(-1)" class="btn btn-white"><i class="fa fa-reply"></i> 返回</a>
                                	</div>
                               
                            </div>
                       </div>
                       </form>
                    </div>
                </div>
            </div>
        </div>
    </div>

 
    
    
    <script src="${pageContext.request.contextPath}/js/jquery.min.js?v=2.1.4"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js?v=3.3.6"></script>
    <script src="${pageContext.request.contextPath}/js/plugins/sweetalert/sweetalert.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/plugins/select/bootstrap-select.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/plugins/layer/laydate/laydate.js"></script>

   <link href="${pageContext.request.contextPath}/css/customer.css" rel="stylesheet">
</body>


</html>
