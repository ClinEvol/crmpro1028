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
    <link href="${pageContext.request.contextPath}/css/font-awesome.min93e3.css?v=4.4.0" rel="stylesheet">
    	<link href="${pageContext.request.contextPath}/css/bootstrap.min14ed.css?v=3.3.6" rel="stylesheet">
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
                           <form method="post" action="/hr/archives/list">
                           <div class="col-sm-3 text-right">
                               <h3><small>搜索条件:</small></h3>
                           </div>
                           <div class="col-sm-2">
                               <select name="type" class="selectpicker form-control">
                                   <option value="0">选择类型</option>
                                   <option value="1"<c:if test="${param.type==1}">selected</c:if>>姓名</option>
                                   <option value="2"<c:if test="${param.type==2}">selected</c:if>>邮箱</option>
                                   <option value="3"<c:if test="${param.type==3}">selected</c:if>>毕业院校</option>
                                   <option value="4"<c:if test="${param.type==4}">selected</c:if>>专业</option>
                               </select>
                           </div>

                           <div class="col-sm-3">
                               <div class="input-group">
                                   <input name="keyword" value="${param.keyword}"  type="text" placeholder="请输入关键词" class="input-sm form-control">
                                   <span class="input-group-btn">
                                        <button type="submit" class="btn btn-sm btn-primary"><i class="fa fa-search"></i> 搜索</button>
                                    </span>
                               </div>

                           </div>

                           </form>
                       </div>
                        <div class="hr-line-dashed2"></div>
                        <div class="table-responsive">
                            <table class="table table-striped list-table">
                                <thead>
                                    <tr>
                                        <th>序号</th>
                                        <th>姓名</th>
                                        <th>毕业院校</th>
                                        <th>入职时间</th>
                                        <th>专业</th>
                                        <th>学历</th>
                                        <th>邮箱</th>
                                        <th>政治面貌</th>
                                        <th>民族</th>
                                        <th>操作</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach items="${page.list}" var="archive">
                               		<tr>
                                        <td>${archive.no}</td>
										<td>${archive.employee.name}</td>
										<td>${archive.school}</td>
										<td><fmt:formatDate value="${archive.employee.hiredate}"/></td>
										<td>${archive.major}</td>
										<td>${archive.education}</td>
										<td>${archive.email}</td>
										<td>${archive.politics}</td>
										<td>${archive.nation}</td>
                                        <td>
	                                        	<a href="/archives/show?employee_fk=${archive.employee.id}"><i class="glyphicon glyphicon-eye-open  text-navy"></i></a>
	                                        	<a href="/archives/toupdate?employee_fk=${archive.employee.id}"><i class="glyphicon glyphicon-edit  text-navy"></i></a>

                                        </td>
                                    </tr>
                                    </c:forEach>
                                    <c:if test="${fun:length(page.list)==0}">
                                        <tr>
                                            <td class="text-center" colspan="11">
                                                没有相关的数据
                                            </td>
                                        </tr>
                                    </c:if>
                                </tbody>
                            </table>
                        </div>
                        <c:if test="${fun:length(page.list)>0}">
                        <div class="row">

							<div class="col-sm-7 text-right">
                                <div class="btn-group">

                                    <a href="/hr/archives/list?pageNum=${page.pageNum-1}&type=${param.type}&keyword=${param.keyword}" class="btn btn-sm btn-white  <c:if test="${page.pageNum==1}">disabled</c:if>"><i class="glyphicon glyphicon-chevron-left"></i></a>
                                    <c:forEach begin="1" end="${page.pages}" varStatus="index">
                                        <a href="/hr/archives/list?pageNum=${index.index}&type=${param.type}&keyword=${param.keyword}" class="btn btn-sm btn-white <c:if test="${index.index==page.pageNum}">active</c:if> ">${index.index}</a>
                                    </c:forEach>
                                    <a href="/hr/archives/list?pageNum=${page.pageNum+1}&type=${param.type}&keyword=${param.keyword}" class="btn btn-sm btn-white  <c:if test="${page.pageNum==page.pages}">disabled</c:if>"><i class="glyphicon glyphicon-chevron-right"></i></a>
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
		
		//点击删除
		$('.btndel').click(function () {
		    swal({
		        title: "您确定要删除这条信息吗",
		        text: "删除后将无法恢复，请谨慎操作！",
		        type: "warning",
		        showCancelButton: true,
		        confirmButtonColor: "#DD6B55",
		        confirmButtonText: "删除",
		        closeOnConfirm: false
		    }, function () {//此函数是点击删除执行的函数
		    		//这里写ajax代码
		    		// 以下是成功的提示框，请在ajax回调函数中执行
			    swal("删除成功！", "您已经永久删除了这条信息。", "success");
		    });
		});
		
		
		$("#demo1").click(function() {
			//基本消息框－留着备用
			swal({
				title: "欢迎使用SweetAlert",
				text: "Sweet Alert 是一个替代传统的 JavaScript Alert 的漂亮提示效果。"
			})
		});
	});
    </script>
    
</body>


</html>
