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
                        <h5>需求管理<small>>添加需求信息</small></h5>
                    </div>
                    <div class="ibox-content">
                        <form id="saveForm" class="form-horizontal">
                       	<input name="id" id="projectid" type="hidden">
                        <div class="row">
                            <div class="form-group">
                                <label class="col-sm-2 control-label">选择项目</label>
                                <div class="col-sm-3">
                                    <select name="projectname" id="project" class="selectpicker form-control">
                                        <option value="0">---选择项目---</option>
									</select>
                                </div>
                                <label class="col-sm-2 control-label">标题</label>
                                <div class="col-sm-4">
                                    <input name="title" type="text" class="form-control input-sm">
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
	
   <script>
	$(document).ready(function() {
		// 设置按钮的样式
		$('.selectpicker').selectpicker('setStyle', 'btn-white');

        // 如果没有时间控件，初始化日期控代码会报错，直接影下面的代码无法执行

        //加载项目
        loadProject();
        function loadProject(){
            $.getJSON("/programmer/project/listJSON",function (response) {
                $(response).each(function () {
                    var option="<option data-projectid='"+this.id+"' value='"+this.name+"'>"+this.name+"</option>"
                    $("#project").append(option).selectpicker('refresh');
                });
            })
        }
        //选择项目时把当前项目的id赋给隐藏表单域
        $("#project").change(function () {
            var projectid=$(this).children(":selected").data("projectid");
            $("#projectid").val(projectid);
            //去需求表查一下捍这个项目是否已经有了需求
            $.post("/programmer/analysis/isAnalysis",{"id":projectid},function (response) {
                if(response!=null){
                   swal("该项目已经存需求","","warning");
                }
            },"json");
        });

        //实现保存
        $(".btnSave").click(function () {
            //序列化表单
            var data = $("#saveForm").serialize();
            $.post("/programmer/analysis/save",data,function (response) {
                if(response=="true"){
                    //使用甜心弹框提示
                    swal({title:"添加成功",
                            text:"数据已经成功添加，为您返回列表页！",
                            type:"success",
                            confirmButtonText: "确定"},
                        function(){//这个函数是点击确定（ok）按钮时执行的
                            //修改成功返回列表页
                            location.href="/programmer/analysis/list";
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
