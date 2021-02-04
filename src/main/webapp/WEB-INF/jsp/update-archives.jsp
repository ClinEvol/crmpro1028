 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
    <style type="text/css">
        .picbox{ width: 165px; height: 165px; position: relative; }
        .picbox img{width: 165px; height: 165px; padding: 2px; border: 1px solid #e2e2e2; position: absolute; left: 0; right: 0; z-index: 2;}
        .piclogo{ opacity: 0; width: 200px; height: 200px; position: absolute; left: 0; right: 0; z-index: 9;}
        .pictips{ width: 165px; height: 40px; position: absolute; left: 0; top: 125px; background-color: rgba(0,0,0,0.5); color: white; text-align: center; line-height: 40px; z-index: 6; }
    </style>

</head>

<body class="gray-bg">
    <div class="wrapper wrapper-content animated fadeInRight">
        
      <div class="row">
            <div class="col-sm-12">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h5>档案管理<small>>添加档案</small></h5>
                    </div>
                    <div class="ibox-content">
                        <form id="saveForm" class="form-horizontal">
                        <input type="hidden" name="no" value="${archives.no}">
                        <div class="row">
                            <div class="col-sm-4 col-md-offset-1">
                                <div class="picbox">
                                    <c:if test="${archives.path==null or archives.path.equals('')}">
                                        <img id="imgLogo" src="/images/default.jpg"/>
                                    </c:if>
                                    <c:if test="${archives.path!=null and !archives.path.equals('')}">
                                        <img id="imgLogo" src="${archives.path}"/>
                                    </c:if>
                                    <!--用于保存头像图的路径-->
                                    <input type="hidden" name="path" id="path" value="${archives.path}" />
                                    <input class="piclogo" type="file" name="logo" value="选择头像" />
                                    <div class="pictips">点击上传头像</div>

                                </div>

                            </div>

                            <div class="col-sm-6">
                                <div class="row">
                                    <div class="form-group">
                                        <label class="col-sm-6 control-label">姓名</label>
                                        <div class="col-sm-6">
                                            <input name="name" value="${archives.employee.name}" readonly type="text" class="form-control input-sm">
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="form-group">
                                        <label class="col-sm-6 control-label">毕业院校</label>
                                        <div class="col-sm-6">
                                            <input name="school" value="${archives.school}" type="text" class="form-control input-sm">
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="form-group">
                                        <label class="col-sm-6 control-label">专业</label>
                                        <div class="col-sm-6">
                                            <input name="major" value="${archives.major}" type="text" class="form-control input-sm">
                                        </div>

                                    </div>
                                </div>
                                <div class="row">
                                    <div class="form-group">

                                        <label class="col-sm-6 control-label">毕业时间</label>
                                        <div class="col-sm-6">
                                            <input name="graduate" value='<fmt:formatDate value="${archives.graduate}" />' id="graduate" class="laydate-icon form-control layer-date">
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="form-group">
                                <label class="col-sm-2 control-label">学历</label>
                                <div class="col-sm-3">
                                    <select id="education" name="education" class="selectpicker form-control">
                                        <option value="0">---选择学历----</option>
                                        <option value="高中">高中</option>
                                        <option value="中专">中专</option>
                                        <option value="大专">大专</option>
                                        <option value="本科">本科</option>
                                        <option value="研究生">研究生</option>
                                        <option value="博士">博士</option>
                                    </select>

                                </div>
                                <label class="col-sm-2 col-sm-offset-1 control-label">政治面貌</label>
                                <div class="col-sm-3">
                                    <select id="politics" name="politics" class="selectpicker form-control">
                                        <option value="0">---选择政治面貌----</option>
                                        <option value="群众">群众</option>
                                        <option value="团员">团员</option>
                                        <option value="预备党员">预备党员</option>
                                        <option value="党员">党员</option>
                                        <option value="其它党派">其它党派</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="form-group">
                                <label class="col-sm-2 control-label">民族</label>
                                <div class="col-sm-3">
                                    <select id="nation" name="nation" class="selectpicker form-control">
                                        <option value="0">---选择民族----</option>
                                        <option value="汉族">汉族</option>
                                        <option value="满族">满族</option>
                                        <option value="蒙古族">蒙古族</option>
                                        <option value="回族">回族</option>
                                        <option value="藏族">藏族</option>
                                        <option value="维吾尔族">维吾尔族</option>
                                        <option value="苗族">苗族</option>
                                        <option value="彝族">彝族</option>
                                        <option value="壮族">壮族</option>
                                        <option value="布依族">布依族</option>
                                        <option value="侗族">侗族</option>
                                        <option value="瑶族">瑶族</option>
                                        <option value="白族">白族</option>
                                        <option value="土家族">土家族</option>
                                        <option value="哈尼族">哈尼族</option>
                                        <option value="哈萨克族">哈萨克族</option>
                                        <option value="傣族">傣族</option>
                                        <option value="黎族">黎族</option>
                                        <option value="傈僳族">傈僳族</option>
                                        <option value="佤族">佤族</option>
                                        <option value="畲族">畲族</option>
                                        <option value="高山族">高山族</option>
                                        <option value="拉祜族">拉祜族</option>
                                        <option value="水族">水族</option>
                                        <option value="东乡族">东乡族</option>
                                        <option value="纳西族">纳西族</option>
                                        <option value="景颇族">景颇族</option>
                                        <option value="柯尔克孜族">柯尔克孜族</option>
                                        <option value="土族">土族</option>
                                        <option value="达斡尔族">达斡尔族</option>
                                        <option value="仫佬族">仫佬族</option>
                                        <option value="羌族">羌族</option>
                                        <option value="布朗族">布朗族</option>
                                        <option value="撒拉族">撒拉族</option>
                                        <option value="毛南族">毛南族</option>
                                        <option value="仡佬族">仡佬族</option>
                                        <option value="锡伯族">锡伯族</option>
                                        <option value="阿昌族">阿昌族</option>
                                        <option value="普米族">普米族</option>
                                        <option value="朝鲜族">朝鲜族</option>
                                        <option value="塔吉克族">塔吉克族</option>
                                        <option value="怒族">怒族</option>
                                        <option value="乌孜别克族">乌孜别克族</option>
                                        <option value="俄罗斯族">俄罗斯族</option>
                                        <option value="鄂温克族">鄂温克族</option>
                                        <option value="德昂族">德昂族</option>
                                        <option value="保安族">保安族</option>
                                        <option value="裕固族">裕固族</option>
                                        <option value="京族">京族</option>
                                        <option value="塔塔尔族">塔塔尔族</option>
                                        <option value="独龙族">独龙族</option>
                                        <option value="鄂伦春族">鄂伦春族</option>
                                        <option value="赫哲族">赫哲族</option>
                                        <option value="门巴族">门巴族</option>
                                        <option value="珞巴族">珞巴族</option>
                                        <option value="基诺族">基诺族</option>
                                    </select>
                                </div>
                                <label class="col-sm-2 col-sm-offset-1 control-label">紧急联系人</label>
                                <div class="col-sm-3">
                                    <input name="contact" value="${archives.contact}" type="text" class="form-control input-sm">
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="form-group">
                                <label class="col-sm-2 control-label">邮箱</label>
                                <div class="col-sm-3">
                                    <input name="email" value="${archives.email}" type="text" class="form-control input-sm">
                                </div>
                                <label class="col-sm-2 col-sm-offset-1 control-label">固话</label>
                                <div class="col-sm-3">
                                    <input name="telephone" value="${archives.telephone}" type="text" class="form-control input-sm">
                                </div>
                            </div>
                        </div>
                        
                        <div class="row">
                            <div class="form-group">

                                <label class="col-sm-2 control-label">授权码</label>
                                <div class="col-sm-3">
                                    <input name="code" value="${archives.code}"  type="text" class="form-control input-sm">
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="form-group">
                                <label class="col-sm-2 control-label">备注</label>
                                <div class="col-sm-9">
                                    <textarea name="remark" class="form-control">${archives.remark}</textarea>
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
                                	<a href="list-project.jsp" class="btn btn-white"><i class="fa fa-reply"></i> 返回</a>
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
	<script src="${pageContext.request.contextPath}/js/plugins/layer/laydate/laydate.js"></script>
   <script>
	$(document).ready(function() {
		// 设置按钮的样式
		$('.selectpicker').selectpicker('setStyle', 'btn-white');
		//初始化日期控件
		laydate({elem: "#graduate"});

        initSelect();
        function initSelect(){
            var sysEducation="${archives.education}";
            var sysPolitics="${archives.politics}";
            var sysNation="${archives.nation}";

            //val指value属性,选中value属性＝thisVal的选项
            $('#education').selectpicker('val',sysEducation);
            $('#politics').selectpicker('val',sysPolitics);
            $('#nation').selectpicker('val',sysNation);
        }
		
		
		//实现头像上传并回显
        $(".piclogo").change(function(){
            $.ajax({
                url: "/archives/upload",
                type: 'POST',
                dataType:"text",
                cache: false,//布尔值，表示浏览器是否缓存被请求页面。默认是 true。
                data: new FormData($("#saveForm")[0]),//创建表单对象
                processData: false,//	布尔值，规定通过请求发送的数据是否转换为查询字符串。默认是 true。
                contentType: false,//发送数据到服务器时所使用的内容类型  multipart/form-data
                success:function(result) {
                    //上传成功把图片路径赋给图片的src属性，实现回显
                    $("#imgLogo").attr("src",result);
                    //把图片路径保存到隐藏表单域中，用于把路径提交到数据库
                    $("#path").val(result);
                }
            });
        });

        //实现内容保存
        $(".btnSave").click(function () {
            var data=$("#saveForm").serialize();
           $.post("/archives/update",data,function (response) {
               if(response=="true"){
                  swal("保存成功","","success");
               }else{
                   swal("保存失败","请检查数据有效性","error");
               }
           },"text");
        });

		

		
	});
   </script>
   <!-- 修复日期控件长度-->
   <link href="${pageContext.request.contextPath}/css/customer.css" rel="stylesheet">
</body>


</html>
