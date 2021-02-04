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
    <link href="${pageContext.request.contextPath}/css/customer.css" rel="stylesheet">
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
                        <h5>附件管理<small>>添加附件信息</small></h5>
                    </div>
                    <div class="ibox-content">
                        <form id="dataForm" class="form-horizontal">
                       	
                        <div class="row">
                            <div class="form-group">
                                <label class="col-sm-2 control-label">选择项目</label>
                                <div class="col-sm-3">
                                    <select id="project" name="projectFk" class="selectpicker form-control">
										<option value="0">---选择项目---</option>
									</select>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="form-group">
                            		<label class="col-sm-2  control-label">附件名称</label>
                                <div class="col-sm-3">
                                    <input name="name" type="text" class="form-control input-sm">
                                </div>
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
                            <div class="form-group">
                                <label class="col-sm-2 control-label">附件信息描述</label>
                                <div class="col-sm-9">
                                    <textarea name="description" class="form-control"></textarea>
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
                            <div class="form-group">
                                <label class="col-sm-2 control-label">标签</label>
                                <div class="col-sm-9 tips">
                                    <input name="tag" value="1"  type="checkbox" >需求分析
                                    <input name="tag" value="2"   type="checkbox" >用例图
                                    <input name="tag" value="3"   type="checkbox" >数据库
                                    <input name="tag" value="4"   type="checkbox" >UI原型
                                    <input name="tag" value="5"  type="checkbox" >任务概况
                                    <input name="tag" value="6"   type="checkbox" >其它资料
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
	<script src="${pageContext.request.contextPath}/js/inputfile.js"></script>
	
   <script>
	$(document).ready(function() {
		
		// 设置按钮的样式
		$('.selectpicker').selectpicker('setStyle', 'btn-white');

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

        $(".btnSave").click(function () {
            $.ajax({
                url: "/programmer/attachment/save",
                type: 'POST',
                dataType:"text",
                cache: false,//布尔值，表示浏览器是否缓存被请求页面。默认是 true。
                data: new FormData($("#dataForm")[0]),//创建表单对象
                processData: false,//	布尔值，规定通过请求发送的数据是否转换为查询字符串。默认是 true。
                contentType: false,//发送数据到服务器时所使用的内容类型  multipart/form-data
                success:function(response) {
                    if(response=="fileError"){
                        swal("文件上传失败！","文件上传失败,注意文件大小不能超过4M!","error");
                    }else if(response=="false"){
                        swal("添加失败","添加失败，请检查数据有效性","error");
                    }else{
                        swal({title:"添加成功",
                                text:"数据已经成功添加，为您返回列表页！",
                                type:"success",
                                confirmButtonText: "确定"},
                            function(){//这个函数是点击确定（ok）按钮时执行的
                                //修改成功返回列表页
                                location.href="/programmer/attachment/list";
                            });
                    }
                }
            });
        });
		
	});
   </script>
</body>


</html>
