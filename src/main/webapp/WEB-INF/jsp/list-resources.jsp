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
    	<link href="${pageContext.request.contextPath}/css/font-awesome.min93e3.css?v=4.4.0" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/plugins/sweetalert/sweetalert.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/animate.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/style.min862f.css?v=4.1.0" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/plugins/select/bootstrap-select.min.css" rel="stylesheet">
    <link rel="stylesheet" href="/css/plugins/zTreeStyle/zTreeStyle.css" />

</head>

<body class="gray-bg">
	<div class="wrapper2 wrapper-content2 animated fadeInRight">
	    <div class="row">
	    		<div class="col-sm-6">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h5>资源管理</h5>
                    </div>
                    <div class="ibox-content">
                        <div class="zTreeDemoBackground left" style="font-size: 16px">
							<ul id="treeDemo" class="ztree"></ul>
						</div>
                    </div>
                </div>
            </div>
	    		<div class="col-sm-6">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h5 class="formTitle">添加资源</h5>
                    </div>
                    <div class="ibox-content">
                        <form id="saveForm" class="form-horizontal">
                            <input type="hidden" name="methodName" value="save">
                            <input type="hidden" name="id" value="0">
                            <div class="form-group">
                                <label class="col-sm-4 control-label">菜单资源名称：</label>

                                <div class="col-sm-7">
                                    <input name="name" type="text" class="form-control">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-4 control-label">父菜单：</label>

                                <div class="col-sm-7">
                                    <select id="sources" name="parentid" class="selectpicker form-control">
										<option value="0">---选择父菜单--</option>
									</select>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-4 control-label">菜单资源路径：</label>

                                <div class="col-sm-7">
                                    <input name="url" type="text" class="form-control">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-4 control-label">备注：</label>
                                <div class="col-sm-7">
                                    <textarea name="remark" class="form-control"></textarea>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-sm-offset-3 col-sm-8">
                                    <button class="btn btn-sm btn-white btnSave" type="button"><i class="fa fa-save"></i> 保存</button>
                                    <button class="btn btn-sm btn-white btnReset" type="button"><i class="fa fa-undo"></i> 重置添加操作</button>
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
     <script src="${pageContext.request.contextPath}/js/plugins/select/bootstrap-select.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/plugins/sweetalert/sweetalert.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/plugins/ztree/jquery.ztree.core.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/plugins/ztree/jquery.ztree.exedit.js"></script>
   <script>
	$(document).ready(function() {
		// 设置按钮的样式
		$('.selectpicker').selectpicker('setStyle', 'btn-white').selectpicker('setStyle', 'btn-sm');


        //加载下拉菜单
        loadSources();
        function loadSources(){
            $.getJSON("/system/sources/listSimple",function (response) {
                $(response).each(function () {
                    var option="<option value='"+this.id+"'>"+this.name+"</option>";
                    $("#sources").append(option).selectpicker('refresh');
                });
            })
        }

        //重置
        $(".btnReset").click(function(){
            setForm(0,"","","",0,"save","添加资源");
        });

        //实现保存
        $(".btnSave").click(function(){
            //这个决定是修改还是新增操作
            var methodName=$("input[name=methodName]").val();
            var data=$("#saveForm").serialize();
            $.post("/system/sources/"+methodName,data,function(response){
                if(response=="true"){
                    swal("保存成功","","success");
                    reflashZtree();
                    setForm(0,"","","",0,"save","添加资源");
                }else{
                    swal("保存失败","","error");
                }

            },"text");
        });



	});


	var setting = {

        async: {
            enable: true,
            url:"/system/sources/listStandard"
        },
         view: {
                addHoverDom: function(treeId, treeNode){
                    var aObj = $("#" + treeNode.tId + "_a"); // tId = permissionTree_1, ==> $("#permissionTree_1_a")
                    aObj.attr("href", "javascript:;").removeAttr("target");
                    if (treeNode.editNameFlag || $("#btnGroup"+treeNode.tId).length>0) return;
                    var s ='<span id="btnGroup'+treeNode.tId+'">';
                    if ( treeNode.level == 1 ) {
                        s += '<span class="button edit" onclick="editNode('+treeNode.id+')"></span>';
                        if (treeNode.children.length == 0) {
                            s += '<span class="button remove" onclick="deleteNode('+treeNode.id+')"></span>';
                        }
                    } else if ( treeNode.level == 2 ) {
                        s += '<span class="button edit" onclick="editNode('+treeNode.id+')" ></span>';
                        s += '<span class="button remove" onclick="deleteNode('+treeNode.id+')" ></span>';
                    }
                    s += '</span>';
                    aObj.append(s);
                },
                removeHoverDom: function(treeId, treeNode){
                    $("#btnGroup"+treeNode.tId).remove();
                }
            }
			 
	  };

	function reflashZtree() {
        // 刷新数据树形菜——ztree提供的方法
        var treeObj = $.fn.zTree.getZTreeObj("treeDemo");
        treeObj.reAsyncChildNodes(null, "refresh");
    }

    function setForm(id,name,url,remark,parentid,methodName,formTitle) {
        $("input[name=name]").val(name);
        $("input[name=id]").val(id);
        $("input[name=url]").val(url);
        $("textarea[name=remark]").val(remark);
        $("#sources").selectpicker('val',parentid);
        $("input[name=methodName]").val(methodName);
        $(".formTitle").html(formTitle);
    }
		
	//编辑
	function editNode(id){
		$.getJSON("/system/sources/getById",{"id":id},function (response) {
            setForm(response.id,response.name,response.url,response.remark,response.parentid,"update","修改资源")
        });
	}

	//删除
	function deleteNode(id){
        swal({
            title: "您确定要改修该角色状态吗？",
            text: "改修后将将，请谨慎操作！",
            type: "warning",
            showCancelButton: true,
            confirmButtonColor: "#DD6B55",
            confirmButtonText: "删除",
            closeOnConfirm: false
        }, function () {//此函数是点击删除执行的函数
            //这里写ajax代码
            //ajax请求台
            $.post("/system/sources/remove","id="+id,function(response){

                if(response=="true"){
                    reflashZtree();
                    // 以下是成功的提示框，请在ajax回调函数中执行
                    swal("删除成功！","", "success");
                }else{
                    // 以下是成功的提示框，请在ajax回调函数中执行
                    swal("删除失败！", "", "success");
                }

            },"text");

        });

	}


	
	
	$(document).ready(function(){
		$.fn.zTree.init($("#treeDemo"),setting);
	});
	</SCRIPT>
</body>


</html>
