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
    <link href="${pageContext.request.contextPath}/css/bootstrap.css" rel="stylesheet">
    <link href="/css/plugins/sweetalert/sweetalert.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/animate.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/style.min862f.css?v=4.1.0" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/customer.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/css/font-awesome.min93e3.css?v=4.4.0" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/plugins/select/bootstrap-select.min.css" rel="stylesheet">
</head>

<body class="gray-bg">
    <div class="wrapper wrapper-content animated fadeInRight">
        
      <div class="row">
            <div class="col-sm-12">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h5>帖子管理<small>>发布帖子</small></h5>
                    </div>
                    <div class="ibox-content">
                        <form id="saveForm" class="form-horizontal">

                        <div class="row">
                            <div class="form-group">
                                <label class="col-sm-2 control-label">版块</label>
                                <div class="col-sm-4">
                                    <select id="forumsort" name="forumsortFk" class="selectpicker form-control">
                                        <option value="0">---选择版块---</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="form-group">
                                <label class="col-sm-2 control-label">标题</label>
                                <div class="col-sm-7">
                                    <input name="title" type="text" class="form-control input-sm">
                                </div>
                                <div class="col-sm-2 title-tips">
                                    <i class="fa fa-check-circle"></i>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="form-group">
                                <label class="col-sm-2 control-label">摘要</label>
                                <div class="col-sm-9">
                                    <textarea name="discript" class="form-control"></textarea>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="form-group">
                                <label class="col-sm-2 control-label">内容</label>
                                <div class="col-sm-9">
                                    <input type="hidden" name="content" id="content">
                                    <script id="editor" type="text/plain"></script>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="form-group">
                                <label class="col-sm-2 control-label">标签</label>
                                <div class="col-sm-9 tips">
                                    <input name="label" value="1"  type="checkbox" >文件
                                    <input name="label" value="2"  type="checkbox" >资源
                                    <input name="label" value="3"  type="checkbox" >分享
                                    <input name="label" value="4"  type="checkbox" >技术
                                    <input name="label" value="5"  type="checkbox" >问答
                                    <input name="label" value="6"  type="checkbox" >讨论
                                    <input name="label" value="7"  type="checkbox" >其它
                                </div>
                            </div>
                        </div>
                        
                        
                     	<div class="row">
                     		<div class="hr-line-dashed"></div>
                     	</div>
                          
                         <div class="row">
                            <div class="form-group">
                                <div class="col-sm-3 col-sm-offset-3 text-right">
                                    <button type="button" class="btn btn-primary btnsave"><i class="fa fa-save"></i> 保存内容</button>
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
	
<script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/ueditor/ueditor.config.js"></script>
    <script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/ueditor/ueditor.all.js"> </script>
    <script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/ueditor/lang/zh-cn/zh-cn.js"></script>
   <script>
	$(document).ready(function() {
		//实例化编辑器
		var ue = UE.getEditor('editor');
		
		// 设置按钮的样式
		$('.selectpicker').selectpicker('setStyle', 'btn-white');


		//加版块
        loadForumsort();
        function loadForumsort(){
          $.getJSON("/forumsort/listJSON",function (response) {
              $(response).each(function () {
                  var type="——【主版块】";
                  if(this.type==1){
                      type="——【副版块】";
                  }
                  var option="<option value='"+this.id+"'>"+this.title+type+"</option>";
                  $("#forumsort").append(option).selectpicker('refresh');;
              });
          });
        }

        //实现保存
        $(".btnsave").click(function(){
            var content = ue.getContent();
            $("#content").val(content);
            var data = $("#saveForm").serialize();
            $.post("/forumpost/save",data,function(response){
                if(response=="true"){
                    swal("发布成功","","success");
                    $("#saveForm")[0].reset();
                    ue.setContent("",false);
                }else{
                    swal("发布失败","发布失败,请检查数据有效性！","error");
                }
            },"text");
        });

        //当标题失焦时判断
        $("input[name='title']").blur(function () {
            var title=$(this).val();
            $.post("/forumpost/isExistsByTitle",{"title":title},function(response){
                if(response=="true"){//标题已经存了，不能用
                    $(".title-tips").html('<i class="fa fa-close"></i>标题已存在').css("color","red");
                    $(".btnsave").attr("disabled","disabled");
                }else{
                    $(".title-tips").html('<i class="fa fa-check-circle"></i>标题可用').css("color","green");
                    //解除按钮的禁用状态
                    $(".btnsave").removeAttr("disabled");
                }
            },"text");
        });


		

		
	});
   </script>
  
</body>


</html>
