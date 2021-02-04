<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fun" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>项目管理系统 - 文章页面</title>
    <meta name="keywords" content="项目管理系统">
    <meta name="description" content="项目管理系统">

    <link rel="shortcut icon" href="favicon.ico">
    <link href="${pageContext.request.contextPath}/css/bootstrap.min14ed.css?v=3.3.6" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/font-awesome.min93e3.css?v=4.4.0" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/animate.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/style.min862f.css?v=4.1.0" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/pinglun.css" rel="stylesheet">
    <link href="/css/plugins/sweetalert/sweetalert.css" rel="stylesheet">
</head>

<body class="gray-bg">
    <div class="wrapper wrapper-content  animated fadeInRight article">
        <div class="row">
            <div class="col-lg-10 col-lg-offset-1">
                <div class="ibox">
                    <div class="ibox-content">
                    		<div class="pull-right">
                            <a href="javascript:history.back(-1)" class="btn btn-white btn-sm" ><i class="fa fa-reply"></i>  返回</a>
                        </div>
                        <div class="text-center  article-title">
                            <h2><strong>${forumpost.title}</strong></h2>
                        </div>
                        <div id="">
                            ${forumpost.content}
                        </div>
                        <hr>

                        <div class="row">
                            <div class="col-lg-12">

                                <h2>评论：</h2>
                                <div class="social-feed-box firstSocial">
                                    <div id="qq">
										<p>发表你的看法</p>
										<div class="message" contentEditable='true'></div>
										<div class="But">
											<img src="/images/bba_thumb.gif" class='bq' />
											<span class='submit'>发表</span>
											<!--face begin-->
											<div class="face">
												<ul> 
													<li><img src="/images/smilea_thumb.gif" title="呵呵]"></li>
													<li><img src="/images/tootha_thumb.gif" title="嘻嘻]"></li>
													<li><img src="/images/laugh.gif" title="[哈哈]"></li>
													<li><img src="/images/tza_thumb.gif" title="[可爱]"></li>
													<li><img src="/images/kl_thumb.gif" title="[可怜]"></li>
													<li><img src="/images/kbsa_thumb.gif" title="[挖鼻屎]"></li>
													<li><img src="/images/cj_thumb.gif" title="[吃惊]"></li>
													<li><img src="/images/shamea_thumb.gif" title="[害羞]"></li>
													<li><img src="/images/zy_thumb.gif" title="[挤眼]"></li>
													<li><img src="/images/bz_thumb.gif" title="[闭嘴]"></li>
													<li><img src="/images/bs2_thumb.gif" title="[鄙视]"></li>
													<li><img src="/images/lovea_thumb.gif" title="[爱你]"></li>
													<li><img src="/images/sada_thumb.gif" title="[泪]"></li>
													<li><img src="/images/heia_thumb.gif" title="[偷笑]"></li>
													<li><img src="/images/qq_thumb.gif" title="[亲亲]"></li>
													<li><img src="/images/sb_thumb.gif" title="[生病]"></li>
													<li><img src="/images/mb_thumb.gif" title="[太开心]"></li>
													<li><img src="/images/ldln_thumb.gif" title="[懒得理你]"></li>
													<li><img src="/images/yhh_thumb.gif" title="[右哼哼]"></li>
													<li><img src="/images/zhh_thumb.gif" title="[左哼哼]"></li>
													<li><img src="/images/x_thumb.gif" title="[嘘]"></li>
													<li><img src="/images/cry.gif" title="[衰]"></li>
													<li><img src="/images/wq_thumb.gif" title="[委屈]"></li>
													<li><img src="/images/t_thumb.gif" title="[吐]"></li>
													<li><img src="/images/k_thumb.gif" title="[打哈气]"></li>
													<li><img src="/images/bba_thumb.gif" title="[抱抱]"></li>
													<li><img src="/images/angrya_thumb.gif" title="[怒]"></li>
													<li><img src="/images/yw_thumb.gif" title="[疑问]"></li>
													<li><img src="/images/cza_thumb.gif" title="[馋嘴]"></li>
													<li><img src="/images/88_thumb.gif" title="[拜拜]"></li>
													<li><img src="/images/sk_thumb.gif" title="[思考]"></li>
													<li><img src="/images/sweata_thumb.gif" title="[汗]"></li>
													<li><img src="/images/sleepya_thumb.gif" title="[困]"></li>
													<li><img src="/images/sleepa_thumb.gif" title="[睡觉]"></li>
													<li><img src="/images/money_thumb.gif" title="[钱]"></li>
													<li><img src="/images/sw_thumb.gif" title="[失望]"></li>
													<li><img src="/images/cool_thumb.gif" title="[酷]"></li>
													<li><img src="/images/hsa_thumb.gif" title="[花心]"></li>
													<li><img src="/images/hatea_thumb.gif" title="[哼]"></li>
													<li><img src="/images/gza_thumb.gif" title="[鼓掌]"></li>
													<li><img src="/images/dizzya_thumb.gif" title="[晕]"></li>
													<li><img src="/images/bs_thumb.gif" title="[悲伤]"></li>
													<li><img src="/images/crazya_thumb.gif" title="[抓狂]"></li>
													<li><img src="/images/h_thumb.gif" title="[黑线]"></li>
													<li><img src="/images/yx_thumb.gif" title="[阴险]"></li>
													<li><img src="/images/nm_thumb.gif" title="[怒骂]"></li>
													<li><img src="/images/hearta_thumb.gif" title="[心]"></li>
													<li><img src="/images/unheart.gif" title="[伤心]"></li>
													<li><img src="/images/pig.gif" title="[猪头]"></li>
													<li><img src="/images/ok_thumb.gif" title="[ok]"></li>
													<li><img src="/images/ye_thumb.gif" title="[耶]"></li>
													<li><img src="/images/good_thumb.gif" title="[good]"></li>
													<li><img src="/images/no_thumb.gif" title="[不要]"></li>
													<li><img src="/images/z2_thumb.gif" title="[赞]"></li>
													<li><img src="/images/come_thumb.gif" title="[来]"></li>
													<li><img src="/images/sad_thumb.gif" title="[弱]"></li>
													<li><img src="/images/lazu_thumb.gif" title="[蜡烛]"></li>
													<li><img src="/images/clock_thumb.gif" title="[钟]"></li>
													<li><img src="/images/cake.gif" title="[蛋糕]"></li>
													<li><img src="/images/m_thumb.gif" title="[话筒]"></li>
													<li><img src="/images/weijin_thumb.gif" title="[围脖]"></li>
													<li><img src="/images/lxhzhuanfa_thumb.gif" title="[转发]"></li>
													<li><img src="/images/lxhluguo_thumb.gif" title="[路过这儿]"></li>
													<li><img src="/images/bofubianlian_thumb.gif" title="[bofu变脸]"></li>
													<li><img src="/images/gbzkun_thumb.gif" title="[gbz困]"></li>
													<li><img src="/images/boboshengmenqi_thumb.gif" title="[生闷气]"></li>
													<li><img src="/images/chn_buyaoya_thumb.gif" title="[不要啊]"></li>
													<li><img src="/images/daxiongleibenxiong_thumb.gif" title="[dx泪奔]"></li>
													<li><img src="/images/cat_yunqizhong_thumb.gif" title="[运气中]"></li>
													<li><img src="/images/youqian_thumb.gif" title="[有钱]"></li>
												</ul>
											</div>
											<!--face end-->
										</div>
									</div>
                                    
                                </div>

                                <c:forEach items="${list}" var="evaluate">
                                <div class="social-feed-box">
                                    <div class="social-avatar">
                                        <a href="#" class="pull-left">
											<c:if test="${evaluate.employee.archives.path==null or evaluate.employee.archives.path.equals('')}">
												<img width="40px" height="40px" class="img-circle" id="imgLogo" src="/images/default.jpg"/>
											</c:if>
											<c:if test="${evaluate.employee.archives.path!=null and !evaluate.employee.archives.path.equals('')}">
												<img width="40px" height="40px" class="img-circle" id="imgLogo" src="${evaluate.employee.archives.path}"/>
											</c:if>

                                        </a>
                                        <div class="media-body">
                                            <a href="#">
                                                    ${evaluate.employee.name}
                                                </a>
                                            <small class="text-muted"><fmt:formatDate value="${evaluate.evatime}" pattern="yyyy/MM/dd HH:mm"/></small>
                                        </div>
                                    </div>
                                    <div class="social-body">
                                        <p>
                                            ${evaluate.evacontent}
                                        </p>
                                    </div>
                                </div>
                                </c:forEach>

                                <c:if test="${fun:length(list)==0}">
                                <div class="social-feed-box nomessage">

                                    <div class="social-body">
                                        <p>
                                                还没有任论评论...
                                        </p>
                                    </div>
                                </div>
                                </c:if>


                            </div>
                        </div>
                        <hr> 
                        <div class="row text-center">
                        <a href="javascript:history.back(-1)" class="btn btn-white btn-sm" ><i class="fa fa-reply"></i> 返回</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </div>
    <script src="/js/jquery.min.js?v=2.1.4"></script>
    <script src="/js/bootstrap.min.js?v=3.3.6"></script>
    <script src="/js/content.min.js?v=1.0.0"></script>
    <script src="/js/plugins/sweetalert/sweetalert.min.js"></script>
<script type="text/javascript">
	
	//点击小图片，显示表情
	$(".bq").click(function (e) {
		$(".face").slideDown(); //慢慢向下展开
		e.stopPropagation(); //阻止冒泡事件
	});

	//在桌面任意地方点击，关闭表情框
	$(document).click(function () {
		$(".face").slideUp(); //慢慢向上收
	});

	//点击小图标时，添加功能
	$(".face ul li").click(function () {
		var simg = $(this).find("img").clone();
		$(".message").append(simg); //将表情添加到输入框
	});

	//点击发表按扭，发表内容
	$("span.submit").click(function () {
		var txt = $(".message").html(); //获取输入框内容
		if (!txt) {
			$('.message').focus(); //自动获取焦点
			return;
		}

        evaluate(txt);
	});
    /*
	//new Date()    Tue Mar 10 2020 10:23:18 GMT+0800 (中国标准时间)
    //这样传后台发时间转换时异常，但是数据也可以时间是因为数据设设置默认值：当前时间   CURRENT_TIMESTAMP
	//DateConveter只写了两种格式  yyyy/MM/dd和yyyy-MM-dd

    解决方案：
       1、完善DateConveter
       2、格式化前台时间格式    js

     */
    //把评论的内容txt提效到的后台
    function evaluate(txt){
        var date=new Date();
        var time=date.format("yyyy/MM/dd hh:mm:ss");
        $.post("/evalute/save",
            {
                "evacontent":txt,
                "evatime":time,
                "forumFk":${forumpost.id}
            },
            function (response) {
                if(response=="true"){
                    swal("评论成功","","success");
                    $('.message').html('') // 清空输入框
                    //回显评论内容
                    showEvaluate(txt,date);
                    //去掉没有评论
                    $(".nomessage").remove();
                }else{
                    swal("评论失败","","error");
                }
            },
            "text");
    }
    //var node=`xxx`;报错的话把idea的js编译环改成功最新ES6 file>settting>laguage & framwork>js   `是es6中新增的语法
    //模块字符串
    //在页面中显示评论内容
    function showEvaluate(txt,date){
        var time=date.format("yyyy/MM/dd hh:mm");
        var node=`<div class="social-feed-box">
                        <div class="social-avatar">
                            <a href="#" class="pull-left">
                                <c:if test="${gray.archives.path==null or gray.archives.path.equals('')}">
                                    <img width="40px" height="40px" class="img-circle" id="imgLogo" src="/images/default.jpg"/>
                                </c:if>
                                <c:if test="${gray.archives.path!=null and !gray.archives.path.equals('')}">
                                    <img width="40px" height="40px" class="img-circle" id="imgLogo" src="${gray.archives.path}"/>
                                </c:if>
                            </a>
                            <div class="media-body">
                                <a href="#">
                                        ${gray.name}
                                    </a>
                                <small class="text-muted">`+time+`</small>
                            </div>
                        </div>
                        <div class="social-body">
                            <p>
                                `+txt+`
                            </p>
                    </div>
                    </div>`;//??????
        //在.firstSocial后面追加
        $(".firstSocial").after(node);
    }


    //js的面向对象的语法，只要知道这段代码的功能就可以了  格式化时间
    Date.prototype.format = function (fmt) {
        var o = {
            "M+": this.getMonth() + 1, //月份
            "d+": this.getDate(), //日
            "h+": this.getHours(), //小时
            "m+": this.getMinutes(), //分
            "s+": this.getSeconds(), //秒
            "q+": Math.floor((this.getMonth() + 3) / 3), //季度
            "S": this.getMilliseconds() //毫秒
        };
        if (/(y+)/.test(fmt)) fmt = fmt.replace(RegExp.$1, (this.getFullYear() + "").substr(4 - RegExp.$1.length));
        for (var k in o)
            if (new RegExp("(" + k + ")").test(fmt)) fmt = fmt.replace(RegExp.$1, (RegExp.$1.length == 1) ? (o[k]) : (("00" + o[k]).substr(("" + o[k]).length)));
        return fmt;
    }

</script>
</body>


</html>
