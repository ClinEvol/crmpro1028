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
                     <h5>项目管理<small>>添加项目信息</small></h5>
                 </div>
                 <div class="ibox-content">
                     <form id="saveForm" class="form-horizontal">
                         <div class="row">
                             <div class="form-group">
                                 <label class="col-sm-2 control-label">项目名称</label>
                                 <div class="col-sm-3">
                                     <input name="name" type="text" class="form-control input-sm">
                                 </div>
                                 <label class="col-sm-2 col-sm-offset-1 control-label">客户公司名称</label>
                                 <div class="col-sm-3">
                                     <select name="companyname" id="company" class="selectpicker form-control">
                                         <option value="0">---客户公司名称---</option>
                                     </select>
                                 </div>
                             </div>
                         </div>
                         <div class="row">
                             <div class="form-group">
                                 <label class="col-sm-2 control-label">客户方负责人</label>
                                 <div class="col-sm-3">
                                     <input type="hidden" id="customerFk" name="customerFk">
                                     <input name="companyperson" id="companyperson" type="text" class="form-control input-sm">
                                 </div>
                                 <label class="col-sm-2 col-sm-offset-1 control-label">项目经理</label>
                                 <div class="col-sm-3">
                                     <select name="employeeFk" id="projectManager" class="selectpicker form-control">
                                         <option value="0">---选择项目经理---</option>
                                     </select>
                                 </div>
                             </div>
                         </div>
                         <div class="row">
                             <div class="form-group">
                                 <label class="col-sm-2 control-label">开发人数</label>
                                 <div class="col-sm-3">
                                     <input name="employeeCount" type="text" class="form-control input-sm">
                                 </div>
                                 <label class="col-sm-2 col-sm-offset-1 control-label">开始时间</label>
                                 <div class="col-sm-3">
                                     <!--时间控件的id都不能改-->
                                     <input name="starttime" id="start" class="laydate-icon form-control layer-date">
                                 </div>
                             </div>
                         </div>
                         <div class="row">
                             <div class="form-group">
                                 <label class="col-sm-2 control-label">立项时间</label>
                                 <div class="col-sm-3">
                                     <input name="buildtime" id="buid" class="laydate-icon form-control layer-date">
                                 </div>
                                 <label class="col-sm-2 col-sm-offset-1 control-label">预估成本</label>
                                 <div class="col-sm-3">
                                     <input name="cost" type="text" class="form-control input-sm">
                                 </div>
                             </div>
                         </div>
                         <div class="row">
                             <div class="form-group">
                                 <label class="col-sm-2 control-label">级别</label>
                                 <div class="col-sm-3">
                                     <select name="level" class="selectpicker form-control">
                                         <option value="0">---选择级别---</option>
                                         <option value="1">暂缓</option>
                                         <option value="2">低</option>
                                         <option value="3">中</option>
                                         <option value="4">高</option>
                                     </select>
                                 </div>
                                 <label class="col-sm-2 col-sm-offset-1 control-label">计划完成时间</label>
                                 <div class="col-sm-3">
                                     <input name="endtime" id="finish" class="laydate-icon form-control layer-date">
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




 <script src="/js/jquery.min.js?v=2.1.4"></script>
 <script src="/js/bootstrap.min.js?v=3.3.6"></script>
 <script src="/js/plugins/sweetalert/sweetalert.min.js"></script>
 <script src="/js/plugins/select/bootstrap-select.min.js"></script>
 <script src="/js/plugins/layer/laydate/laydate.js"></script>
 <script>
     $(document).ready(function() {
         // 设置按钮的样式
         $('.selectpicker').selectpicker('setStyle', 'btn-white');
         //初始化日期控件
         laydate({elem: "#finish"});
         laydate({elem: "#buid"});
         laydate({elem: "#start"});


         //加载项目经理
         loadPM();
         function loadPM(){
             //$.post(url,data,fun,type)  type=json  getJSON指定了反回的数据格式为sjon
             $.getJSON("/employee/PMListJSON",function (response) {
                 $(response).each(function () {
                     var option="<option value='"+this.id+"'>"+this.name+"</option>"
                     //由于这个下拉杠使用了第三方的插件，所以这个追加点节完还要使用第三方插件的函更新一下，否则显示不出来
                     $("#projectManager").append(option).selectpicker('refresh');
                 });
             })
         }
         //加载客户信息
         loadCustomer();
         function loadCustomer(){
             $.getJSON("/programmer/customer/listJSON",function (response) {
                 $(response).each(function () {
                     //这个页面还需要客户方联系与id 先把数据保存到data-属性 中
                     // data-变量名   h5中新增的一个属性，用于存储自定义数据
                     var option="<option data-customerid='"+this.id+"' data-person='"+this.companyperson+"' value='"+this.name+"'>"+this.name+"</option>"
                     $("#company").append(option).selectpicker('refresh');
                 });
             });
         }


         //选择客户方公司名称时，自动出现对应的客户联系人
         $("#company").change(function () {
             //获取被选中的option节点的data-  属性
             var selected=$(this).children(":selected");
             //通过data()方法获取data-属性的值 data-person  对应data(person)
             var person=selected.data("person");
             //把获取到的值显示到客户方联系人
             $("#companyperson").val(person);
             var id=selected.data("customerid");
             $("#customerFk").val(id);//用于提交到后台
         });
         
         //实现保存
         $(".btnSave").click(function () {
             //序列化表单
             var data = $("#saveForm").serialize();
             $.post("/programmer/project/save",data,function (response) {
                 if(response=="true"){
                     //使用甜心弹框提示
                     swal({title:"添加成功",
                             text:"数据已经成功添加，为您返回列表页！",
                             type:"success",
                             confirmButtonText: "确定"},
                         function(){//这个函数是点击确定（ok）按钮时执行的
                             //修改成功返回列表页
                             location.href="/programmer/project/list";
                         });

                 }else{
                     swal("添加失败","添加失败，请检查数据有效性","error");
                 }
             },"text");

         });

     });
 </script>
 <!-- 修复日期控件长度-->
 <link href="/css/customer.css" rel="stylesheet">
 </body>

 </html>
