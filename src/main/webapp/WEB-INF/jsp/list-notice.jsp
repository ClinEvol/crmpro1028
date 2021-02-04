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
    <link href="/css/plugins/sweetalert/sweetalert.css" rel="stylesheet">

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
                    公告列表
                </h2>
                <div class="mail-tools tooltip-demo m-t-md">


                    <div class="btn-group pull-right">
                        <a href="/notice/list?pageNum=${page.pageNum-1}&keyword=${param.keyword}" class="btn btn-sm btn-white <c:if test="${page.pageNum==1}">disabled</c:if> "><i class="glyphicon glyphicon-chevron-left"></i></a>
                        <a href="/notice/list?pageNum=${page.pageNum+1}&keyword=${param.keyword}" class="btn btn-sm btn-white <c:if test="${page.pageNum==page.pages}">disabled</c:if> "><i class="glyphicon glyphicon-chevron-right"></i></a>
                    </div>
                    <button class="btn btn-white btn-sm" data-toggle="tooltip" data-placement="left" title="刷新公告列表"><i class="fa fa-refresh"></i> 刷新</button>
                    <shiro:hasAnyRoles name="system,administration">
                    <button class="btn btn-white btn-sm btnAll" data-toggle="tooltip" data-placement="top" title="全选"><i class="fa fa-check-square-o"></i></button>
                    <button class="btn btn-white btn-sm btnRever" data-toggle="tooltip" data-placement="top" title="反选"><i class="fa fa-square-o"></i></button>
                    <button class="btn btn-white btn-sm btnRemove" data-toggle="tooltip" data-placement="top" title="删除选中的公告"><i class="fa fa-trash-o"></i>
                    </button>
                    </shiro:hasAnyRoles>
                </div>
            </div>
            <div class="mail-box">

                <table class="table table-hover table-mail">
                    <tbody>
                    <c:forEach items="${page.list}" var="notice">
                    <tr class="unread">
                        <shiro:hasAnyRoles name="system,administration">
                        <td class="check-mail">
                            <input type="checkbox" value="${notice.id}">
                        </td>
                        </shiro:hasAnyRoles>
                        <td><a href="/notice/show?id=${notice.id}">
                            ${notice.title}
                        </a>
                            <c:if test="${notice.path!=null and !notice.path.equals('')}">
                                <i class="fa fa-paperclip"></i>
                            </c:if>

                        </td>
                        <td class="text-right mail-date"><fmt:formatDate value="${notice.date}" pattern="yyyy/MM/dd HH:mm" /></td>
                        <shiro:hasAnyRoles name="system,administration">
                        <td class="text-right mail-date">
                            <a href="/administration/notice/toupdate?id=${notice.id}"><i class="glyphicon glyphicon-edit  text-navy"></i></a>
                            <a id="${notice.id}" href="javascript:void(0)" class="btndel"><i class="glyphicon glyphicon-remove  text-navy"></i></a>
                        </td>
                        </shiro:hasAnyRoles>
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
<script src="/js/plugins/sweetalert/sweetalert.min.js"></script>
<shiro:hasAnyRoles name="system,administration">
<script>
    $(function(){
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
            delMessage(id);
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
            delMessage(ids);
        });
        //删的提示语
        function delMessage(ids){
            swal({
                title: "您确定要删除这些信息吗",
                text: "删除后将无法恢复，请谨慎操作！",
                type: "warning",
                showCancelButton: true,
                cancelButtonText: "取消",
                confirmButtonColor: "#DD6B55",
                confirmButtonText: "删除",
                closeOnConfirm: false
            }, function () {//此函数是点击删除执行的函数
                //执行删除
                doRemove(ids);
            });
        }

        function doRemove(ids){
            $.post("/administration/notice/remove",{"ids":ids},function (response) {
                if(response=="true"){//1.全部删除成功
                    swal({title:"删除成功",
                            text:"数据全部删除成功",
                            type:"success",
                            confirmButtonText: "确定"},
                        function(){//这个函数是点击确定（ok）按钮时执行的
                            //刷新数据
                            location.href="/notice/list";
                        });
                }else if(response=="false"){//2.全部了删除失败
                    swal("删除失败","数据删除失败,请检查是否存在关联数据","error");
                }
            },"text");
        }
    })
</script>
</shiro:hasAnyRoles>
</body>


</html>