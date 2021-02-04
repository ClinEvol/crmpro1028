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
	<link href="${pageContext.request.contextPath}/css/customer.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/css/font-awesome.min93e3.css?v=4.4.0" rel="stylesheet">
</head>

<body class="gray-bg">
    <div class="wrapper wrapper-content animated fadeInRight">
        
      <div class="row">
            <div class="col-sm-12">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h5>需求管理<small>>查看详情</small></h5>
                    </div>
                    <div class="ibox-content">
                        <form method="get" action="#" class="form-horizontal">
                       	
                        <div class="row">
                            <div class="form-group">
                                <label class="col-sm-2 control-label">项目：</label>
                                <div class="col-sm-9 show-text">
                                     在制程工艺上
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="form-group">
                                <label class="col-sm-2 control-label">标题：</label>
                                <div class="col-sm-9 show-text">
                                     大白菜系统开发
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="form-group">
                                <label class="col-sm-2 control-label">简单描述：</label>
                                <div class="col-sm-9 show-text">
                                     在制程工艺上，Intel从2015年到现在一直在魔改14nm工艺，10nm工艺说是今年6月份量产了，但在时间进度上确实要比台积电等公司落后了，AMD今年都出7nm的CPU和显卡了。今年5月份的投资会议上，Intel宣布了新一代制程工艺路线图，14nm工艺(对标台积电10nm)会继续充实产能，10nm工艺(对标台积电7nm)消费级产品今年年底购物季上架，服务器端明年上半年。
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="form-group">
                                <label class="col-sm-2 control-label">详细描述：</label>
                                <div class="col-sm-9 show-text">
                                     在制程工艺上，Intel从2015年到现在一直在魔改14nm工艺，10nm工艺说是今年6月份量产了，但在时间进度上确实要比台积电等公司落后了，AMD今年都出7nm的CPU和显卡了。今年5月份的投资会议上，Intel宣布了新一代制程工艺路线图，14nm工艺(对标台积电10nm)会继续充实产能，10nm工艺(对标台积电7nm)消费级产品今年年底购物季上架，服务器端明年上半年。
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="form-group">
                                <label class="col-sm-2 control-label">备注：</label>
                                <div class="col-sm-9 show-text">
                                     在制程工艺上，Intel从2015年到现在一直在魔改14nm工艺，10nm工艺说是今年6月份量产了，但在时间进度上确实要比台积电等公司落后了，AMD今年都出7nm的CPU和显卡了。今年5月份的投资会议上，Intel宣布了新一代制程工艺路线图，14nm工艺(对标台积电10nm)会继续充实产能，10nm工艺(对标台积电7nm)消费级产品今年年底购物季上架，服务器端明年上半年。
                                </div>
                            </div>
                        </div>
                        
                     	<div class="row">
                     		<div class="hr-line-dashed"></div>
                     	</div>
                          
                         <div class="row">
                            <div class="form-group">
                                
                                <div class="col-sm-2 col-sm-offset-5 ">
                                	<a href="list-analysis.jsp" class="btn btn-white"><i class="fa fa-reply"></i> 返回</a>
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
		//初始化日期控件
		laydate({elem: "#start"});
		laydate({elem: "#end"});


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
		//--------------------下面是常用代码模版---------------------------------------

		//下拉列表使用ajax加载说明例子
		function loadSelect(){
			var option='<option value="0">-------请选择------</option><option value="4">用友软件</option><option selected value="5">浪潮软件</option>';
			$("#company").jsp(option);
			//ajax填充数据后需调用下面的方法来刷新下拉列表
			$("#company").selectpicker('refresh');
		}
		loadSelect();

		//点击按钮，消息提示框
		$("#demo1").click(function() {
			//基本消息框－留着备用
			swal({
				title: "恭喜，添加成功",
				text: "数据添加成功，为您返回列表页！"
			})
		});

		// 选择客户公司名称时自动选对应的客户方负责人
		$("#company").change(function(){
			var thisVal=$(this).val();
			//val指value属性,选中value属性＝thisVal的选项
			$('#customer').selectpicker('val',thisVal);
		});
		
	});
   </script>
  
</body>


</html>
