 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    
</head>

<body class="gray-bg">
	<div class="wrapper2 wrapper-content2 animated fadeInRight">
    		<div class="row">
            <div class="col-sm-12">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h5>折线图</h5>
                        <div class="ibox-tools">
                            <a class="collapse-link">
                                <i class="fa fa-chevron-up"></i>
                            </a>
                            <a class="dropdown-toggle" data-toggle="dropdown" href="graph_flot.jsp#">
                                <i class="fa fa-wrench"></i>
                            </a>
                            <ul class="dropdown-menu dropdown-user">
                                <li><a href="graph_flot.jsp#">选项1</a>
                                </li>
                                <li><a href="graph_flot.jsp#">选项2</a>
                                </li>
                            </ul>
                            <a class="close-link">
                                <i class="fa fa-times"></i>
                            </a>
                        </div>
                    </div>
                    <div class="ibox-content">
                        <div  class="echarts" id="echarts-line-chart"></div>
                    </div>
                </div>
            </div>
            <div class="col-sm-12">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h5>柱状图</h5>
                        <div class="ibox-tools">
                            <a class="collapse-link">
                                <i class="fa fa-chevron-up"></i>
                            </a>
                            <a class="dropdown-toggle" data-toggle="dropdown" href="graph_flot.jsp#">
                                <i class="fa fa-wrench"></i>
                            </a>
                            <ul class="dropdown-menu dropdown-user">
                                <li><a href="graph_flot.jsp#">选项1</a>
                                </li>
                                <li><a href="graph_flot.jsp#">选项2</a>
                                </li>
                            </ul>
                            <a class="close-link">
                                <i class="fa fa-times"></i>
                            </a>
                        </div>
                    </div>
                    <div class="ibox-content">

                        <div class="echarts" id="echarts-bar-chart"></div>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">

            <div class="col-sm-7 text-right">
                <div class="btn-group">

                    <button  class="btn btn-sm btn-white  <c:if test="${page.pageNum==1}">disabled</c:if>"><i class="glyphicon glyphicon-chevron-left"></i></button>
                    <c:forEach begin="1" end="${page.pages}" varStatus="index">
                        <button  class="btn btn-sm btn-white <c:if test="${index.index==page.pageNum}">active</c:if> ">${index.index}</button>
                    </c:forEach>
                    <button  class="btn btn-sm btn-white  <c:if test="${page.pageNum==page.pages}">disabled</c:if>"><i class="glyphicon glyphicon-chevron-right"></i></button>
                </div>
            </div>
        </div>
	</div>       
    <script src="${pageContext.request.contextPath}/js/jquery.min.js?v=2.1.4"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js?v=3.3.6"></script>
     <script src="${pageContext.request.contextPath}/js/plugins/select/bootstrap-select.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/plugins/sweetalert/sweetalert.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/plugins/echarts/echarts-all.js"></script>

   <script>
	$(document).ready(function() {
		// 设置按钮的样式
		$('.selectpicker').selectpicker('setStyle', 'btn-white').selectpicker('setStyle', 'btn-sm');
        //折线图显营业额
		var lineChart=echarts.init(document.getElementById('echarts-line-chart'));
        //柱状图显示员工数量
		var barChart=echarts.init(document.getElementById('echarts-bar-chart'));

        var cname = [];//公司名称
        var turnover = [];//营业额
        var employeecount = [];//员工数量



        var lineOption={
            title: {text: "对标公司营业额"},
            tooltip: {trigger: "axis"},
            legend: {data: ["最高营业额", "最低营业额"]},
            grid: {x: 40, x2: 40, y2: 24},
            calculable: !0,
            xAxis: [{type: "category", boundaryGap: !1, data:cname}],
            yAxis: {
                type: 'value',
                name: '营业额（亿）'
            },
            series: [{
                name: "最高营业额",
                type: "line",
                data: turnover,
                markPoint: {data: [{type: "max", name: "最大值"}, {type: "min", name: "最小值"}]},
                markLine: {data: [{type: "average", name: "平均值"}]}
            }]
        };

        var barOption={
            title: {text: "对标公司员工数量"},
            tooltip: {trigger: "axis"},
            legend: {data: ["员工数量"]},
            grid: {x: 30, x2: 40, y2: 24},
            calculable: !0,
            xAxis: [{type: "category", data:cname}],
            yAxis: {
                type: 'value',
                name: '员工数量（亿）'
            },
            series: [{
                name: "员工数量",
                type: "bar",
                data: employeecount,
                markPoint: {data: [{type: "max", name: "最大值"}, {type: "min", name: "最小值"}]},
                markLine: {data: [{type: "average", name: "平均值"}]}
            }]
        };

        loadDataCollect();//获取数据，去请后台，去了，
        //如果没按单线程来讲先执完loadDataCollect()，再来执行lineChart.setOption(lineOption);
        //理解为loadDataCollect()线程1   lineChart.setOption(lineOption)两个线程同时执行
        //loadDataCollect()这个请求需要时间
        //lineChart.setOption(lineOption);这个不能这里，写这里的就是两个线程，应该写线程1中


		//请求后台获取数据
        function loadDataCollect() {
            //异步
            $.getJSON("/programmer/datacollect/listJSON",{"pageNum":1},function (response) {
                $(response).each(function () {
                    cname.push(this.cname.replace("有限公司","").replace("集团","").replace("股份",""));
                    turnover.push(this.turnover);
                    employeecount.push(this.employeecount);
                });
                lineChart.setOption(lineOption);//请求成功时才设置图表
                barChart.setOption(barOption);
            });
        }




	});
    </script>
    
</body>


</html>
