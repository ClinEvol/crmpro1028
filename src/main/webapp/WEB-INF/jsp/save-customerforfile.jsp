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
                        <h5>对标管理<small>>采集客户信息</small></h5>
                    </div>
                    <div class="ibox-content">
                        <form id="saveForm" class="form-horizontal">
                       	
                        
                        <div class="row">
                            <div class="form-group">
	                                <div id="file-pretty">
	                                <label class="col-sm-3 control-label">采集信息附件</label>
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
                                    <button type="button" class="btn btn-primary btnSave"><i class="fa fa-save"></i> 保存内容</button>
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




        $(".btnSave").click(function () {
            $.ajax({
                url: "/programmer/customer/upload",
                type: 'POST',
                dataType:"text",
                cache: false,//布尔值，表示浏览器是否缓存被请求页面。默认是 true。
                data: new FormData($("#saveForm")[0]),//创建表单对象
                processData: false,//	布尔值，规定通过请求发送的数据是否转换为查询字符串。默认是 true。
                contentType: false,//发送数据到服务器时所使用的内容类型  multipart/form-data
                success:function(response) {
                    if(response=="error"){
                        swal("文件上传失败！","文件上传失败,注意文件大小不能超过4M!","error");
                    }else if(response=="false"){
                        swal("采集失败","采集失败，请检查数据有效性","error");
                    }else{
                        swal("采集成功","","success");
                        $("#saveForm")[0].reset();
                    }
                }
            });
        });
		
	});
   </script>
</body>


</html>
