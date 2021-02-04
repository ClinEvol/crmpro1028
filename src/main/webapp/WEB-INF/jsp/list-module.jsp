<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
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
    <link href="/css/bootstrap.min14ed.css?v=3.3.6" rel="stylesheet">
    <link href="/css/plugins/sweetalert/sweetalert.css" rel="stylesheet">
    <link href="/css/font-awesome.min93e3.css?v=4.4.0" rel="stylesheet">
    <link href="/css/animate.min.css" rel="stylesheet">
    <link href="/css/style.min862f.css?v=4.1.0" rel="stylesheet">
    <link href="/css/plugins/select/bootstrap-select.min.css" rel="stylesheet">

</head>

<body class="gray-bg">
<div class="wrapper2 wrapper-content2 animated fadeInRight">
    <div class="ibox float-e-margins">
        <div class="ibox-content">
            <div class="row">
                <form action="/programmer/module/list" method="post">
                    <div class="col-sm-3 col-sm-offset-2 text-right">
                        <h3><small>搜索条件:</small></h3>
                    </div>
                    <div class="col-sm-2">
                        <select name="type" class="selectpicker form-control">
                            <option value="0">选择类型</option>
                            <option  value="1"  <c:if test="${param.type==1}">selected</c:if> >模块名称</option>
                            <option value="2" <c:if test="${param.type==2}">selected</c:if> >项目名称</option>
                            <option value="3" <c:if test="${param.type==3}">selected</c:if> >需求名称</option>
                        </select>
                    </div>

                    <div class="col-sm-3">
                        <div class="input-group">
                            <input name="keyword" value="${param.keyword}" type="text" placeholder="请输入关键词" class="input-sm form-control">
                            <span class="input-group-btn">
                                        <button type="submit" class="btn btn-sm btn-primary"><i class="fa fa-search"></i>  搜索</button>
                                    </span>
                        </div>

                    </div>
                    <div class="col-sm-2 text-right">
                        <a href="/programmer/module/tosave" class="btn btn-sm btn-primary" type="button"><i class="fa fa-plus-circle"></i> 添加模块</a>
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
                        <th>模块名称</th>
                        <th>需求名称</th>
                        <th>项目名称</th>
                        <th>优先级</th>
                        <th>添加时间</th>
                        <th>修改时间</th>
                        <th>操作</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${page.list}" var="module">
                    <tr>
                        <td><input  type="checkbox" value="${module.id}"></td>

                        <td>${module.id}</td>
                        <td><a href=''>${module.modulename}</a></td>
                        <td><a href=''>${module.analysis.title}</a></td>
                        <td><a href=''>${module.project.name}</a></td>
                        <td>
                            <c:if test="${module.level=='高'}"><i class="fa fa-star"></i>高</c:if>
                            <c:if test="${module.level=='中'}"><i class="fa fa-star-half-empty"></i>中</c:if>
                            <c:if test="${module.level=='低'}"><i class="fa fa-star-o"></i>低</c:if>
                        </td>
                        <td><fmt:formatDate value="${module.addtime}" pattern="yyyy-MM-dd" /></td>
                        <td><fmt:formatDate value="${module.updatetime}" pattern="yyyy-MM-dd" /></td>
                        <td>
                            <a href="/programmer/module/show?id=${module.id}2"><i class="glyphicon glyphicon-eye-open  text-navy"></i></a>
                            <a href="/programmer/module/toupdate?id=${module.id}"><i class="glyphicon glyphicon-edit  text-navy"></i></a>
                            <a id="${module.id}" href="javascript:void(0)" class="btndel"><i class="glyphicon glyphicon-remove  text-navy"></i></a>
                        </td>
                    </tr>
                    </c:forEach>
                    <c:if test="${fun:length(page.list)==0}">
                        <tr>
                            <td class="text-center" colspan="9">
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
                    <button class="btn btn-sm btn-primary btnAll" type="button"><i class="fa fa-check-square-o"></i> 全选</button>
                    <button class="btn btn-sm btn-primary btnRever" type="button"><i class="fa fa-square-o"></i> 反选</button>
                    <button class="btn btn-sm btn-primary btnRemove" type="button"><i class="fa fa-times-circle-o"></i> 删除</button>
                    <button id="demo1" class="btn btn-sm btn-primary" type="button"><i class="fa fa-table"></i> 导出Excel</button>
                </div>
                <div class="col-sm-7 text-right">
                    <div class="btn-group">

                        <a href="/programmer/module/list?pageNum=${page.pageNum-1}&type=${param.type}&keyword=${param.keyword}" class="btn btn-sm btn-white  <c:if test="${page.pageNum==1}">disabled</c:if>"><i class="glyphicon glyphicon-chevron-left"></i></a>
                        <c:forEach begin="1" end="${page.pages}" varStatus="index">
                            <a href="/programmer/module/list?pageNum=${index.index}&type=${param.type}&keyword=${param.keyword}" class="btn btn-sm btn-white <c:if test="${index.index==page.pageNum}">active</c:if> ">${index.index}</a>
                        </c:forEach>
                        <a href="/programmer/module/list?pageNum=${page.pageNum+1}&type=${param.type}&keyword=${param.keyword}" class="btn btn-sm btn-white  <c:if test="${page.pageNum==page.pages}">disabled</c:if>"><i class="glyphicon glyphicon-chevron-right"></i></a>
                    </div>
                </div>
            </div>
            </c:if>
        </div>
    </div>
</div>
<script src="/js/jquery.min.js?v=2.1.4"></script>
<script src="/js/bootstrap.min.js?v=3.3.6"></script>
<script src="/js/plugins/select/bootstrap-select.min.js"></script>
<script src="/js/plugins/sweetalert/sweetalert.min.js"></script>

<script>
    $(document).ready(function() {
        // 设置按钮的样式
        $('.selectpicker').selectpicker('setStyle', 'btn-white').selectpicker('setStyle', 'btn-sm');


    });
</script>

</body>


</html>