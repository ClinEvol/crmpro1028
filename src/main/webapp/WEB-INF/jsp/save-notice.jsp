 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
     <link href="/css/animate.min.css" rel="stylesheet">
     <link href="/css/style.min862f.css?v=4.1.0" rel="stylesheet">
     <link href="/css/plugins/select/bootstrap-select.min.css" rel="stylesheet">
     <link href="/css/font-awesome.min93e3.css?v=4.4.0" rel="stylesheet">
     <link href="/css/customer.css" rel="stylesheet">
 </head>

 <body class="gray-bg">
 <div class="wrapper wrapper-content animated fadeInRight">

     <div class="row">
         <div class="col-sm-12">
             <div class="ibox float-e-margins">
                 <div class="ibox-title">
                     <h5>消息管理<small>>发布公告</small></h5>
                 </div>
                 <div class="ibox-content">
                     <form id="saveForm" class="form-horizontal">

                         <div class="row">
                             <div class="form-group">
                                 <label class="col-sm-2 control-label">标题</label>
                                 <div class="col-sm-9">
                                     <input name="title" type="text" class="form-control" >
                                 </div>
                             </div>
                         </div>

                         <div class="row">
                             <div class="form-group">
                                 <label class="col-sm-2 control-label">内容</label>
                                 <div class="col-sm-9">
                                     <input type="hidden" name="content" id="content" value="" >
                                     <script id="editor" type="text/plain"></script>
                                 </div>
                             </div>
                         </div>

                         <div class="row">
                             <div class="form-group">
                                 <div id="file-pretty">
                                     <label class="col-sm-2 control-label">附件</label>
                                     <div class="col-sm-4">
                                         <!---->
                                         <input name="myfile" type="file" class="form-control" >
                                     </div>
                                 </div>
                             </div>
                         </div>





                         <div class="row">
                             <div class="hr-line-dashed"></div>
                         </div>

                         <div class="row">
                             <div class="form-group">
                                 <div class="col-sm-3 col-sm-offset-3 text-right">
                                     <button  type="button" id="btnSend" class="btn btn-primary"><i class="fa fa-paper-plane"></i> 发送</button>
                                 </div>

                             </div>
                         </div>
                     </form>
                 </div>
             </div>
         </div>
     </div>
 </div>




 <script src="/js/jquery.min.js?v=2.1.4"></script>
 <script src="/js/bootstrap.min.js?v=3.3.6"></script>
 <script src="/js/plugins/sweetalert/sweetalert.min.js"></script>
 <script src="/js/plugins/select/bootstrap-select.min.js"></script>
 <script src="/js/plugins/prettyfile/bootstrap-prettyfile.js"></script>
 <script src="/js/inputfile.js"></script>

 <script type="text/javascript" charset="utf-8" src="/ueditor/ueditor.config.js"></script>
 <script type="text/javascript" charset="utf-8" src="/ueditor/ueditor.all.js"> </script>
 <script type="text/javascript" charset="utf-8" src="/ueditor/lang/zh-cn/zh-cn.js"></script>
 <script>
     $(document).ready(function() {

         //实例化编辑器
         var ue = UE.getEditor('editor');

         // 设置按钮的样式
         $('.selectpicker').selectpicker('setStyle', 'btn-white');



         $("#btnSend").click(function () {
             //获取UEditor内容赋给隐藏表单域
             var content=UE.getEditor('editor').getContent();
             $("#content").val(content);
             //序列化表单
             var data=$("#formData").serialize();

             $.ajax({
                 url: "/administration/notice/save",
                 type: 'POST',
                 dataType:"text",
                 cache: false,//布尔值，表示浏览器是否缓存被请求页面。默认是 true。
                 data: new FormData($("#saveForm")[0]),//创建表单对象
                 processData: false,//	布尔值，规定通过请求发送的数据是否转换为查询字符串。默认是 true。
                 contentType: false,//发送数据到服务器时所使用的内容类型  multipart/form-data
                 success:function(response) {
                     if(response=="true"){
                         //使用甜心弹框提示
                         swal("发布成功","数据已经成功添加到数据库","success");
                         $("#saveForm")[0].reset();//重置表单
                         //清空UEditor的内容
                         UE.getEditor('editor').setContent(" ",false);
                     }else{
                         swal("添加失败","添加失败，请检查数据有效性","error");
                     }
                 }
             });


         });



     });
 </script>
 </body>


 </html>
