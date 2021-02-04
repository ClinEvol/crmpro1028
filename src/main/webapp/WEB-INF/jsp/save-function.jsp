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
 </head>

 <body class="gray-bg">
 <div class="wrapper wrapper-content animated fadeInRight">

     <div class="row">
         <div class="col-sm-12">
             <div class="ibox float-e-margins">
                 <div class="ibox-title">
                     <h5>功能管理<small>>添加功能信息</small></h5>
                 </div>
                 <div class="ibox-content">
                     <form id="saveForm" class="form-horizontal">

                         <div class="row">
                             <div class="form-group">
                                 <label class="col-sm-2 control-label">选择项目</label>
                                 <div class="col-sm-3">
                                     <select id="project" name="proFk" class="selectpicker form-control">
                                         <option value="0">---选择项目----</option>
                                     </select>
                                 </div>
                                 <label class="col-sm-2 col-sm-offset-1 control-label">选择需求</label>
                                 <div class="col-sm-3">
                                     <input type="hidden" name="analysisFk" id="analysisFk">
                                     <input readonly id="analysisName" type="text" class="form-control input-sm">
                                 </div>
                             </div>
                         </div>
                         <div class="row">
                             <div class="form-group">
                                 <label class="col-sm-2 control-label">选择模块</label>
                                 <div class="col-sm-3">
                                     <select id="module" name="moduleFk" class="selectpicker form-control">
                                         <option value="0">---选择模块----</option>
                                     </select>
                                 </div>
                                 <label class="col-sm-2 col-sm-offset-1 control-label">优先级</label>
                                 <div class="col-sm-3">
                                     <select name="level" class="selectpicker form-control">
                                         <option value="0">---选择级别---</option>
                                         <option value="低">低</option>
                                         <option value="中">中</option>
                                         <option value="高">高</option>
                                     </select>
                                 </div>
                             </div>
                         </div>
                         <div class="row">
                             <div class="form-group">
                                 <label class="col-sm-2 control-label">功能名称</label>
                                 <div class="col-sm-3">
                                     <input name="functionname" type="text" class="form-control input-sm">
                                 </div>

                             </div>
                         </div>
                         <div class="row">
                             <div class="form-group">
                                 <label class="col-sm-2 control-label">简单描述</label>
                                 <div class="col-sm-9">
                                     <textarea name="simpledis" class="form-control"></textarea>
                                 </div>
                             </div>
                         </div>
                         <div class="row">
                             <div class="form-group">
                                 <label class="col-sm-2 control-label">详细描述</label>
                                 <div class="col-sm-9">
                                     <textarea name="detaileddis" class="form-control"></textarea>
                                 </div>
                             </div>
                         </div>
                         <div class="row">
                             <div class="form-group">
                                 <label class="col-sm-2 control-label">备注</label>
                                 <div class="col-sm-9">
                                     <textarea name="remark" class="form-control"></textarea>
                                 </div>
                             </div>
                         </div>

                         <div class="row">
                             <div class="hr-line-dashed"></div>
                         </div>

                         <div class="row">
                             <div class="form-group">
                                 <div class="col-sm-3 col-sm-offset-3 text-right">
                                     <button type="button" class="btn btn-primary btnSave"><i class="fa fa-save"></i> 保存内容</button>
                                 </div>
                                 <div class="col-sm-3">
                                     <a href="/function/list" class="btn btn-white"><i class="fa fa-reply"></i> 返回</a>
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
 <script src="/js/plugins/layer/laydate/laydate.js"></script>
 <script>
     $(document).ready(function() {
         // 设置按钮的样式
         $('.selectpicker').selectpicker('setStyle','btn-white');


         //加载项目
         loadProject();
         function loadProject(){
             $.getJSON("/programmer/project/listJSON",function (response) {
                 $(response).each(function () {
                     var option="<option value='"+this.id+"'>"+this.name+"</option>"
                     $("#project").append(option).selectpicker('refresh');
                 });
             })
         }
         //选择项目时把当前项目的id赋给隐藏表单域
         $("#project").change(function () {
             var projectid=$(this).val();
             $("#projectid").val(projectid);
             //去需求表查一下捍这个项目是否已经有了需求
             $.post("/programmer/analysis/isAnalysis",{"id":projectid},function (response) {
                 if(response==null){//项目没有需求，必须先添加需求才能添加模块
                     noDataMessage("该项目没有添加需求","/programmer/analysis/tosave");
                 }else{//有需求
                     //把需求名称显示
                     $("#analysisFk").val(response.id);
                     $("#analysisName").val(response.title);
                     //解除按钮的禁用状态
                     $(".btnSave").removeAttr("disabled");
                     //接着该需求下的模块加载出来
                     loadModule(response.id);
                 }
             },"json");
         });

         //通过需求id反该需求下的模块加载出来
         function loadModule(analysis_fk) {
             $.getJSON("/programmer/module/listByAnalysisFk",{"analysis_fk":analysis_fk},function (response) {
                if(response.length==0){//长度为0说明没有模块
                    noDataMessage("该项目没有添加模块","/programmer/module/tosave");
                }else{//有模块
                    var option="<option value='0'>---选择模块----</option>";
                    $("#module").html("").append(option).selectpicker('refresh');
                    $(response).each(function(){
                        option="<option value='"+this.id+"'>"+this.modulename+"</option>"
                        $("#module").append(option).selectpicker('refresh');
                    });
                }
             });
         }

         function noDataMessage(message,url){
             swal({
                 title: message,
                 text: message+"，是否前往添加？",
                 type: "warning",
                 showCancelButton: true,
                 cancelButtonText: "取消",
                 confirmButtonColor: "#DD6B55",
                 confirmButtonText: "是",
                 closeOnConfirm: false
             }, function () {//此函数是点击删除执行的函数
                 location.href=url;//跳转到添加需求项面
             });
             $(".btnSave").attr("disabled","disabled");//禁用提交按钮
         }

         //实现保存
         $(".btnSave").click(function () {
             //序列化表单
             var data = $("#saveForm").serialize();
             $.post("/programmer/function/save",data,function (response) {
                 if(response=="true"){
                     //使用甜心弹框提示
                     swal({title:"添加成功",
                             text:"数据已经成功添加，为您返回列表页！",
                             type:"success",
                             confirmButtonText: "确定"},
                         function(){//这个函数是点击确定（ok）按钮时执行的
                             //修改成功返回列表页
                             location.href="/programmer/function/list";
                         });
                 }else{
                     swal("添加失败","添加失败，请检查数据有效性","error");
                 }
             },"text");

         });

     });
 </script>

 </body>


 </html>
