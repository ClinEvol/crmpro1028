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
                 <form method="post" action="/programmer/customer/list">
                     <div class="col-sm-3 col-sm-offset-4 text-right">
                         <h3><small>搜索条件:</small></h3>
                     </div>
                     <div class="col-sm-2">
                         <select name="type" class="selectpicker form-control">
                             <option value="0">选择类型</option>

                             <option value="1" <c:if test="${param.type==1}">selected</c:if>>联系人</option>
                             <option value="2" <c:if test="${param.type==2}">selected</c:if>>公司名称</option>
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
                 </form>
             </div>
             <div class="hr-line-dashed2"></div>
             <div class="table-responsive">
                 <table class="table table-striped list-table">
                     <thead>
                     <tr>

                         <th>选择</th>
                         <th>序号</th>
                         <th>联系人</th>
                         <th>公司名称</th>
                         <th>添加时间</th>
                         <th>联系电话</th>
                         <th class="text-center">操作</th>

                     </tr>
                     </thead>
                     <tbody>

                     <c:forEach items="${page.list}" var="customer">
                     <tr>
                         <td><input   type="checkbox" value="${customer.id}"></td>
                         <td>${customer.id}</td>
                         <td>${customer.companyperson}</td>
                         <td>${customer.name}</td>
                         <td><fmt:formatDate value="${customer.addtime}" pattern="yyyy-MM-dd" /></td>
                         <td>${customer.phone}</td>
                         <td class="text-right">
                             <a href="/programmer/customer/show?id=${customer.id}" class="btn btn-primary btn-xs"><i class="fa fa-eye"></i>查看</a>
                             <a href="/programmer/customer/toupdate?id=${customer.id}" class="btn btn-primary btn-xs"><i class="fa fa-edit"></i>编辑</a>
                             <button id="${customer.id}" class="btn btn-danger btn-xs btndel"><i class="fa fa-close"></i>删除</button>
                         </td>
                     </tr>
                     </c:forEach>


                    <c:if test="${fun:length(page.list)==0}">
                        <tr>
                            <td class="text-center" colspan="7">
                                没有相关的数据
                            </td>
                        </tr>
                    </c:if>

                     </tbody>
                 </table>
             </div>
            <%--      fun:length()获取集合长度          --%>
             <c:if test="${fun:length(page.list)>0}">
             <div class="row">
                 <div class="col-sm-5">
                     <button class="btn btn-sm btn-primary btnAll" type="button"><i class="fa fa-check-square-o"></i> 全选</button>
                     <button class="btn btn-sm btn-primary btnRever" type="button"><i class="fa fa-square-o"></i> 反选</button>
                     <button class="btn btn-sm btn-primary btnRemove" type="button"><i class="fa fa-times-circle-o"></i> 删除</button>
                     <a href="/programmer/customer/download?pageNum=${page.pageNum}" class="btn btn-sm btn-primary" type="button"><i class="fa fa-table"></i> 导出Excel</a>
                 </div>
                 <div class="col-sm-7 text-right">
                     <div class="btn-group">

                         <a href="/programmer/customer/list?pageNum=${page.pageNum-1}&type=${param.type}&keyword=${param.keyword}" class="btn btn-sm btn-white  <c:if test="${page.pageNum==1}">disabled</c:if>"><i class="glyphicon glyphicon-chevron-left"></i></a>
                         <c:forEach begin="1" end="${page.pages}" varStatus="index">
                         <a href="/programmer/customer/list?pageNum=${index.index}&type=${param.type}&keyword=${param.keyword}" class="btn btn-sm btn-white <c:if test="${index.index==page.pageNum}">active</c:if> ">${index.index}</a>
                         </c:forEach>
                         <a href="/programmer/customer/list?pageNum=${page.pageNum+1}&type=${param.type}&keyword=${param.keyword}" class="btn btn-sm btn-white  <c:if test="${page.pageNum==page.pages}">disabled</c:if>"><i class="glyphicon glyphicon-chevron-right"></i></a>
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
            $.post("/programmer/customer/remove",{"ids":ids},function (response) {
                if(response=="true"){//1.全部删除成功
                    swal({title:"删除成功",
                        text:"数据全部删除成功",
                        type:"success",
                        confirmButtonText: "确定"},
                    function(){//这个函数是点击确定（ok）按钮时执行的
                        //刷新数据
                        location.href="/programmer/customer/list";
                    });
                }else if(response=="false"){//2.全部了删除失败
                    swal("删除失败","数据删除失败,请检查是否存在关联数据","error");
                }else{//3.部分删除成功 response返回的是删除失败的
                    swal({title:"部分删除成功",
                        text:"序号为"+response+"的客户信息存在关联数据，删除失败！",
                        type:"warning",
                        confirmButtonText: "确定"},
                    function(){//这个函数是点击确定（ok）按钮时执行的
                        //刷新数据
                        location.href="/programmer/customer/list";
                    });
                }
            },"text");
        }


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




         



     });
 </script>

 </body>


 </html>
