 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
 <%@ taglib prefix="fun" uri="http://java.sun.com/jsp/jstl/functions" %>
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
    	<link href="${pageContext.request.contextPath}/css/font-awesome.min93e3.css?v=4.4.0" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/plugins/sweetalert/sweetalert.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/animate.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/style.min862f.css?v=4.1.0" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/plugins/select/bootstrap-select.min.css" rel="stylesheet">

</head>

<body class="gray-bg">
	<div class="wrapper2 wrapper-content2 animated fadeInRight">
    <div class="ibox float-e-margins">
                   <div class="ibox-content">
                        <div class="row">
                            <form method="post" action="/programmer/datacollect/list">
                                <div class="col-sm-3 text-right">
                                    <h3><small>搜索条件:</small></h3>
                                </div>
                                <div class="col-sm-2">
                                    <select class="selectpicker form-control">
                                        <option value="0">公司名称</option>
                                    </select>
                                </div>

                                <div class="col-sm-3">
                                    <div class="input-group">
                                        <input type="text" value="${param.keyword}" name="keyword" placeholder="请输入关键词" class="input-sm form-control">
                                        <span class="input-group-btn">
                                        <button type="submit" class="btn btn-sm btn-primary"><i class="fa fa-search"></i> 搜索</button>
                                    </span>
                                    </div>

                                </div>
                                <div class="col-sm-2 text-right">
                                    <a href="save-benchmarking.jsp" class="btn btn-sm btn-primary" type="button"><i
                                            class="fa fa-plus-circle"></i>添加对标信息</a>
                                </div>
                                <div class="col-sm-2 text-right">
                                    <a href="save-customerforfile.jsp" class="btn btn-sm btn-primary" type="button"><i
                                            class="fa fa-plus-circle"></i>采集对标信息</a>
                                </div>
                            </form>
                        </div>
                        <div class="hr-line-dashed2"></div>
                        <div class="table-responsive">
                            <table class="table table-striped list-table">
                                <thead>
                                    <tr>
                                        <th>选择</th>
                                        <th>序号</th>
                                        <th>企业名称</th>
                                        <th>年营业额</th>
                                        <th>企业性质</th>
                                        <th>员工数量</th>
                                        <th>成立时间</th>
                                        <th class="text-center">操作</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach items="${page.list}" var="datacollect">
                                    <tr>
                                        <td><input  type="checkbox" value="${datacollect.id}"></td>
										<td>${datacollect.id}</td>
										<td>${datacollect.cname}</td>
										<td>${datacollect.turnover}亿</td>
										<td>${datacollect.business}</td>
										<td>${datacollect.employeecount}</td>
										<td><fmt:formatDate value="${datacollect.buildtime}"/></td>
                                        <td class="text-right">
	                                        	<a href="show-benchmarking.jsp" class="btn btn-primary btn-xs"><i class="fa fa-eye"></i>查看</a>
	                                        	<button class="btn btn-primary btn-xs"><i class="fa fa-edit"></i>编辑</button>
	                                        	<button class="btn btn-danger btn-xs btndel"><i class="fa fa-close"></i>删除</button>
                                        </td>
                                    </tr>
                                    </c:forEach>
                                    <c:if test="${fun:length(page.list)==0}">
                                        <tr>
                                            <td class="text-center" colspan="8">
                                                没有相关的数据
                                            </td>
                                        </tr>
                                    </c:if>
                                </tbody>
                            </table>
                        </div>
 <c:if test="${fun:length(page.list)>0}">
                        <div class="row">
	                        	<div class="col-sm-5">
	                        		<button class="btn btn-sm btn-primary" type="button"><i class="fa fa-check-square-o"></i> 全选</button>
	                        		<button class="btn btn-sm btn-primary" type="button"><i class="fa fa-square-o"></i> 反选</button>
	                        		<button class="btn btn-sm btn-primary" type="button"><i class="fa fa-times-circle-o"></i> 删除</button>
	                        		<button id="demo1" class="btn btn-sm btn-primary" type="button"><i class="fa fa-table"></i> 导出Excel</button>
	                        	</div>
							<div class="col-sm-7 text-right">
                                <div class="btn-group">

                                    <a href="/programmer/datacollect/list?pageNum=${page.pageNum-1}&keyword=${param.keyword}" class="btn btn-sm btn-white  <c:if test="${page.pageNum==1}">disabled</c:if>"><i class="glyphicon glyphicon-chevron-left"></i></a>
                                    <c:forEach begin="1" end="${page.pages}" varStatus="index">
                                        <a href="/programmer/datacollect/list?pageNum=${index.index}&keyword=${param.keyword}" class="btn btn-sm btn-white <c:if test="${index.index==page.pageNum}">active</c:if> ">${index.index}</a>
                                    </c:forEach>
                                    <a href="/programmer/datacollect/list?pageNum=${page.pageNum+1}&keyword=${param.keyword}" class="btn btn-sm btn-white  <c:if test="${page.pageNum==page.pages}">disabled</c:if>"><i class="glyphicon glyphicon-chevron-right"></i></a>
                                </div>
							</div>
                        </div>
 </c:if>
                    </div>
                </div>
     </div>       
    <script src="${pageContext.request.contextPath}/js/jquery.min.js?v=2.1.4"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js?v=3.3.6"></script>
     <script src="${pageContext.request.contextPath}/js/plugins/select/bootstrap-select.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/plugins/sweetalert/sweetalert.min.js"></script>

   <script>
	$(document).ready(function() {
		// 设置按钮的样式
		$('.selectpicker').selectpicker('setStyle', 'btn-white').selectpicker('setStyle', 'btn-sm');

	});
    </script>
    
</body>


</html>
