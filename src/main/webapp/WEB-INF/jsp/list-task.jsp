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
     <link href="/css/bootstrap.min14ed.css?v=3.3.6" rel="stylesheet">
     <link href="/css/font-awesome.min93e3.css?v=4.4.0" rel="stylesheet">
     <link href="/css/plugins/sweetalert/sweetalert.css" rel="stylesheet">
     <link href="/css/animate.min.css" rel="stylesheet">
     <link href="/css/style.min862f.css?v=4.1.0" rel="stylesheet">
     <link href="/css/plugins/select/bootstrap-select.min.css" rel="stylesheet">

 </head>

 <body class="gray-bg">
 <div class="wrapper2 wrapper-content2 animated fadeInRight">
     <div class="ibox float-e-margins">
         <div class="ibox-content">
             <div class="row">
                 <form action="/projectManager/task/list" method="post">
                     <div class="col-sm-3 col-sm-offset-4 text-right">
                         <h3><small>搜索条件:</small></h3>
                     </div>
                     <div class="col-sm-2">
                         <select name="type" class="selectpicker form-control">
                             <option  value="0">选择类型</option>
                             <option  value="1" <c:if test="${param.type==1}">selected</c:if> >任务标题</option>
                             <option  value="2" <c:if test="${param.type==2}">selected</c:if> >执行者</option>
                             <option  value="3" <c:if test="${param.type==3}">selected</c:if> >分配者</option>
                         </select>
                     </div>

                     <div class="col-sm-3">
                         <div class="input-group">
                             <input name="keyword" value="${param.keyword}" type="text" placeholder="请输入关键词" class="input-sm form-control">
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
                         <th>选择</th>
                         <th>序号</th>
                         <th>任务标题</th>
                         <th>执行者</th>
                         <th>创建人</th>
                         <th>状态</th>
                         <th>优先级</th>
                         <th>开始时间</th>
                         <th>结束时间</th>
                         <th>操作</th>
                     </tr>
                     </thead>
                     <tbody>
                        <c:forEach items="${page.list}" var="task">
                     <tr>
                         <td><input type="checkbox" value="${task.id}" /> </td>
                         <td>${task.id}</td>
                         <td>${task.tasktitle}</td>
                         <td>${task.executor.name}</td>
                         <td>${task.allocator.name}</td>
                         <td>
                             <c:if test="${task.status==0}"><i class="fa fa-hourglass-start"></i> 分配</c:if>
                             <c:if test="${task.status==1}"><i class="fa fa-hourglass-half"></i> 进行中...</c:if>
                             <c:if test="${task.status==2}"><i class="fa fa-hourglass-end"></i>完成</c:if>
                         </td>
                         <td>
                             <c:if test="${task.level=='高'}"><i class="fa fa-star"></i>高</c:if>
                             <c:if test="${task.level=='中'}"><i class="fa fa-star-half-empty"></i>中</c:if>
                             <c:if test="${task.level=='低'}"><i class="fa fa-star-o"></i>低</c:if>
                             <c:if test="${task.level=='暂缓'}">暂缓</c:if>
                         </td>
                         <td><fmt:formatDate value="${task.starttime}" pattern="yyyy-MM-dd" /></td>
                         <td><fmt:formatDate value="${task.endtime}" pattern="yyyy-MM-dd" /></td>
                         <td>
                             <a href="/programmer/task/show?id=${task.id}"><i class="glyphicon glyphicon-eye-open  text-navy"></i></a>

                             <a href="/projectManager/task/toupdate?id=${task.id}"><i class="glyphicon glyphicon-edit  text-navy"></i></a>
                             <a id="${task.id}" href="javascript:void(0)" class="btndel"><i class="glyphicon glyphicon-remove  text-navy"></i></a>

                         </td>
                     </tr>
                        </c:forEach>

                        <c:if test="${fun:length(page.list)==0}">
                            <tr>
                                <td class="text-center" colspan="10">
                                    没有相关的数据
                                </td>
                            </tr>
                        </c:if>


                     </tbody>
                 </table>
             </div>

             <div class="row">
                 <div class="col-sm-5">
                     <button class="btn btn-sm btn-primary btnAll" type="button"><i class="fa fa-check-square-o"></i> 全选</button>
                     <button class="btn btn-sm btn-primary btnRever" type="button"><i class="fa fa-square-o"></i> 反选</button>
                     <button class="btn btn-sm btn-primary btnRemove" type="button"><i class="fa fa-times-circle-o"></i> 删除</button>
                     <button id="demo1" class="btn btn-sm btn-primary" type="button"><i class="fa fa-table"></i> 导出Excel</button>
                 </div>
                 <div class="col-sm-7 text-right">
                     <div class="btn-group">

                         <a href="/projectManager/task/list?pageNum=${page.pageNum-1}&type=${param.type}&keyword=${param.keyword}" class="btn btn-sm btn-white  <c:if test="${page.pageNum==1}">disabled</c:if>"><i class="glyphicon glyphicon-chevron-left"></i></a>
                         <c:forEach begin="1" end="${page.pages}" varStatus="index">
                             <a href="/projectManager/task/list?pageNum=${index.index}&type=${param.type}&keyword=${param.keyword}" class="btn btn-sm btn-white <c:if test="${index.index==page.pageNum}">active</c:if> ">${index.index}</a>
                         </c:forEach>
                         <a href="/projectManager/task/list?pageNum=${page.pageNum+1}&type=${param.type}&keyword=${param.keyword}" class="btn btn-sm btn-white  <c:if test="${page.pageNum==page.pages}">disabled</c:if>"><i class="glyphicon glyphicon-chevron-right"></i></a>
                     </div>
                 </div>
             </div>

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

         //选全
         $(".btnAll").click(function () {
             //$("input:checkbox")选中type=checkbox的元素
             //prop("checked","checked")操作checked属性把值赋为checked
             $("input:checkbox").prop("checked","checked");
         });

         //反选
         $(".btnRever").click(function () {
             var checkboxs=$("input:checkbox");
             $(checkboxs).each(function () {//遍历所有的checkbox元素
                 //获取当前checkbox元素的checked属性原本的值
                 var temp=$(this).prop("checked");
                 //再把当前checkbox元素的checked属的值改为与原本相反的值
                 $(this).prop("checked",!temp);
             });
         });


         //点击单个删除
         $('.btndel').click(function () {
             //获取被点击的删除的按钮的id
             var id=$(this).prop("id");

             swal({
                 title: "您确定要删除这条信息吗",
                 text: "删除后将无法恢复，请谨慎操作！",
                 type: "warning",
                 showCancelButton: true,
                 cancelButtonText: "取消",
                 confirmButtonColor: "#DD6B55",
                 confirmButtonText: "删除",
                 closeOnConfirm: false
             }, function () {//此函数是点击删除执行的函数
                 //执行删除
                 doRemove(id);
             });
         });
         //点击批量删除
         $(".btnRemove").click(function () {
             //选取被选中的checkbox元素
             var checkeds=$("input:checked");
             var ids="";
             //遍历
             $(checkeds).each(function () {
                 var id=$(this).val();
                 ids+=","+id;//拼接id ,拼接后为,1,2,3,4
             });
             //我们所需要的格式1,2,3,4，所以ids前面多了一个, 我们要去掉第一个,
             ids=ids.substr(1);
             //执行删除
             doRemove(ids);
         });

         //批量删除时有几种情况id
         //1.全部删除成功   2.全部了删除失败   3.部分删除成功 response返回的是删除失败的
         function doRemove(ids){
             $.post("/projectManager/task/remove",{"ids":ids},function (response) {
                 if(response=="true"){//1.全部删除成功
                     swal({title:"删除成功",
                             text:"数据全部删除成功",
                             type:"success",
                             confirmButtonText: "确定"},
                         function(){//这个函数是点击确定（ok）按钮时执行的
                             //刷新数据
                             location.href="/projectManager/task/list";
                         });
                 }else{//2.全部了删除失败
                     swal("删除失败","数据删除失败,请稍后再试！","error");
                 }
             },"text");
         }

     });
 </script>

 </body>


 </html>
