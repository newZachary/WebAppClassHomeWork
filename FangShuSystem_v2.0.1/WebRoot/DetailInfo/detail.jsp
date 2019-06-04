<%@ page language="java" import="java.util.*" pageEncoding="utf-8" %>
<%@ page language="java"
	import="cn.sdcet.project.domain.HouseDetailInfo"%>
<%@ page language="java"
	import="cn.sdcet.project.service.HouseDetailInfoService"%>
<%@ page language="java"
	import="cn.sdcet.project.service.PictureService"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<base href="<%=basePath%>">
<title>详细信息</title>
<link rel="shortcut icon" href="images/iconvilla.png"
	type="image/x-icon">

<%
	int houseid = Integer.valueOf(request.getParameter("houseid"));
	HouseDetailInfo houseinfo = new HouseDetailInfo();
	HouseDetailInfoService houserInfoService = new HouseDetailInfoService();
	houseinfo = houserInfoService.getHouseInfoDetail(houseid);
	List<String> listPic = new ArrayList<String>();
	PictureService picService = new PictureService();
	listPic = picService.selectPictures(houseid);
%>


<!-- Animate.css -->
<link rel="stylesheet" href="DetailInfo/css/animate.css">
<!-- Icomoon Icon Fonts-->
<link rel="stylesheet" href="DetailInfo/css/icomoon.css">
<!-- Bootstrap  -->
<link rel="stylesheet" href="DetailInfo/css/bootstrap.css">

<!-- Magnific Popup -->
<link rel="stylesheet" href="DetailInfo/css/magnific-popup.css">

<!-- Flexslider  -->
<link rel="stylesheet" href="DetailInfo/css/flexslider.css">

<!-- Theme style  -->
<link rel="stylesheet" href="DetailInfo/css/style.css">

<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css" 
integrity="sha384-oS3vJWv+0UjzBfQzYUhtDYW+Pj2yciDJxpsK1OYPAYjqT085Qq/1cq5FLXAZQ7Ay" 
crossorigin="anonymous">

<!-- Modernizr JS -->
<script src="DetailInfo/js/modernizr-2.6.2.min.js"></script>
<!-- FOR IE9 below -->
<!--[if lt IE 9]>
	<script src="DetailInfo/js/respond.min.js"></script>
	<![endif]-->
<!-- 这是头部需要引用的东西 -->
<!-- Bootstrap  -->
<link rel="stylesheet" href="Merry/css/bootstrap.css">
<!-- Superfish -->
<link rel="stylesheet" href="Merry/css/superfish.css">
<link rel="stylesheet" href="Merry/css/style.css">
<style>
.fontAll{
	font-family:"微软雅黑";
}
h3,h4,a{
	font-family: courier;
}
span{
	font-family: "Trebuchet MS", Helvetica, sans-serif;
}
p,button{
	font-family:"Comic Sans MS","微软雅黑";
}

</style>

</head>
<body style="font-family: 'Comic Sans MS', cursive, sans-serif,courier">
	<jsp:include page="../Merry/index.jsp" flush="false"></jsp:include>
	<div class="fh5co-loader"></div>

	<div id="page">
	<% 
	if(request.getAttribute("msg")!=null)
	{
	%>
	<div class="alert alert-warning">
	<a href="#" class="close" data-dismiss="alert">
		&times;
	</a>
	<strong>提示：</strong><%=request.getAttribute("msg").toString() %>
</div>
	
<%}%>

		<div class="row">
			<div class="row animate-box" style="margin-top:60px">
				<div class="col-md-12 col-md-offset-0 text-center fh5co-heading">
					<h2>
						<span style="font-family:'幼圆';">外景展示</span>
					</h2>
				</div>
			</div>
		</div>
	</div>
	</div>
	</nav>

	<aside id="fh5co-hero">
		<div class="container">
			<div class="row">
				<div class="col-md-8">
					<div class="flexslider animate-box">
						<ul class="slides">
							<li style="background-image: url(../<%=listPic.get(0)%>);">
								<div class="overlay-gradient"></div>
								<div class="container-fluid">
									<div class="row">
										<div class="col-md-10 col-md-offset-1 slider-text">
											<div class="slider-text-inner">
												<h1 style="font-family:'微软雅黑';"><%=houseinfo.getHouse().getName()%></h1>
												<h2 style="lenght:lenght:200px"></h2>
												<p class="ct"></p>
											</div>
										</div>
									</div>
								</div>
							</li>
							<li style="background-image: url(../<%=listPic.get(2)%>);">
								<div class="overlay-gradient"></div>
								<div class="container-fluid">
									<div class="row">
										<div class="col-md-10 col-md-offset-1 slider-text">
											<div class="slider-text-inner">
												<h1 style="font-family:'微软雅黑';">附近中小学众多，7-11、华润万家、京东便利店等超市云集</h1>

												<p class="ct fontAll">
													您不必为了孩子的教育发愁，各种商品一应俱全
												</p>
											</div>
										</div>
									</div>
								</div>
							</li>
							<li style="background-image: url(../<%=listPic.get(3)%>);">
								<div class="overlay-gradient"></div>
								<div class="container-fluid">
									<div class="row">
										<div class="col-md-10 col-md-offset-1 slider-text">
											<div class="slider-text-inner">
												<h1 style="font-family:'微软雅黑';">交通发达，基础生活配套设施完善。</h1>

												<p class="ct fontAll">
													公交K301、302从门口经过，地铁R1线大学城站尽在咫尺，靠近主干道，却不曾喧嚣
												</p>
											</div>
										</div>
									</div>
								</div>
							</li>
						</ul>
					</div>
				</div>
				<div class="col-md-4">
					<div class="featured text-center animate-box"
						style="background-image: url(../<%=listPic.get(4)%>);">
						<div class="desc">
							<span class="date fontAll"><%=houseinfo.getTime()%> 建成</span>
							<h3 class="fontAll"><%=houseinfo.getDescribe()%></h3>
							<span class="category fontAll" ><%=houseinfo.getCorepoint()%></span>
						</div>
					</div> <div class="featured text-center animate-box"
						style="background-image: url(../<%=listPic.get(5)%>);">
						<div class="desc">
							<h3 class="fontAll">首付仅需<%=houseinfo.getFristpay()%></h3>
							<span class="category fontAll">即可领包入住</span>
						</div>
					</div>
				</div>
			</div>
		</div>
	</aside>


	<!--------------------------- ----------------------------------------------------------------细节展示---------------->
	<div id="fh5co-blog-popular">
		<div class="container">
			<div class="row animate-box">
				<div class="col-md-12 col-md-offset-0 text-center fh5co-heading">
					<h2>
						<span style="font-family:'幼圆';">细节展示</span>
					</h2>
				</div>
			</div>
			<div class="row">
				<div class="col-md-3">
					<div class="fh5co-blog animate-box">
						<img class="img-responsive"
							src="../<%=listPic.get(6)%>" alt="">
						<div class="blog-text">
							<h3>书房展示</h3>
						</div>
					</div>
				</div>
				<div class="col-md-3">
					<div class="fh5co-blog animate-box">
						<img class="img-responsive"
							src="../<%=listPic.get(7)%>" alt="">
						<div class="blog-text">
							<h3>卧室展示</h3>
						</div>
					</div>
				</div>
				<div class="col-md-3">
					<div class="fh5co-blog animate-box">
						<img class="img-responsive"
							src="../<%=listPic.get(8)%>" alt="">
						<div class="blog-text">
							<h3>厨房展示</h3>
						</div>
					</div>
				</div>
				<div class="col-md-3">
					<div class="fh5co-blog animate-box">
						<img class="img-responsive"
							src="../<%=listPic.get(9)%>" alt="">
						<div class="blog-text">
							<h3>客厅展示</h3>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!--------------------------- ----------------------------------------------------------------室内装修---------------->

	<div id="fh5co-blog-popular">
		<div class="container">
			<div class="row animate-box">
				<div class="col-md-12 col-md-offset-0 text-center fh5co-heading">
					<h2>
						<span style="font-family:'幼圆';">室内装修</span>
					</h2>
				</div>
			</div>
			<div class="row">
				<div class="col-md-3">
					<div class="fh5co-blog animate-box">
						<img class="img-responsive"
							src="../<%=listPic.get(10)%>" alt="">
						<div class="blog-text">
							<h3>室内装修</h3>
						</div>
					</div>
				</div>
				<div class="col-md-3">
					<div class="fh5co-blog animate-box">
						<img class="img-responsive"
							src="../<%=listPic.get(11)%>" alt="">
						<div class="blog-text">
							<h3>室内装修</h3>
						</div>
					</div>
				</div>
				<div class="col-md-3">
					<div class="fh5co-blog animate-box">
						<img class="img-responsive"
							src="../<%=listPic.get(12)%>" alt="">
						<div class="blog-text">
							<h3>室内装修</h3>
						</div>
					</div>
				</div>
				<div class="col-md-3">
					<div class="fh5co-blog animate-box">
						<img class="img-responsive"
							src="../<%=listPic.get(13)%>" alt="">
						<div class="blog-text">
							<h3>室内装修</h3>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>



	<!----------------------------------------------------------------------------------------- 详情简介---------------------- -->


	<div id="fh5co-content">
		<div class="container">
			<div class="row">
				<div class="col-md-9 col-padded-right">
					<div class="row">
						<div class="col-md-12">
							<div class="fh5co-blog animate-box">
								<div class="title title-pin text-center">
									<h3 class="fontAll">详情简介</h3>
									<p class="category">Details are introduced</p>
								</div>

								<div class="blog-text text-center fontAll">
									<p>
										名称：<%=houseinfo.getHouse().getName()%></p>
									<p>
										地址：<%=houseinfo.getH_addressdel()%></p>
									<p>
										建成时间：<%=houseinfo.getTime()%></p>
									<p>
										房型：<%=houseinfo.getHouse().getHousetype()%></p>
									<p>
										面积：<%=houseinfo.getHouse().getArea()%></p>
									<p>
										首付：<%=houseinfo.getFristpay() %></p>
									<p>
										装修程度：<%=houseinfo.getDecdeg()%></p>
								</div>
							</div>
						</div>
						<div class="col-md-6">
							<div class="fh5co-blog animate-box">
								<div class="title text-center">
									<h3>简单描述</h3>
									<span class="category">Simple Description</span>
								</div>

								<div class="blog-text text-center">
									<p><%=houseinfo.getDescribe() %></p>

								</div>
							</div>
						</div>
						<div class="col-md-6">
							<div class="fh5co-blog animate-box">
								<div class="title text-center">
									<h3>小区设施</h3>
									<span class="category">Facility</span>
								</div>

								<div class="blog-text text-center">
									<p><%=houseinfo.getResfac()%></p>

								</div>
							</div>
						</div>
						<div class="col-md-6">
							<div class="fh5co-blog animate-box">
								<div class="title text-center">
									<h3>服务介绍</h3>
									<span class="category">Service Introduction</span>
								</div>

								<div class="blog-text text-center">
									<p><%=houseinfo.getServiceintro() %></p>

								</div>
							</div>
						</div>
						<div class="col-md-6">
							<div class="fh5co-blog animate-box">
								<div class="title text-center">
									<h3>核心卖点</h3>
									<span class="category">Core selling point</span>
								</div>

								<div class="blog-text text-center">
									<p><%=houseinfo.getCorepoint() %></p>

								</div>
							</div>
						</div>
					</div>
					
					
					<div class="row">
					<div id="containerImg"  style=" width: 100%; height: 600px; margin:auto; " ></div>
				</div>
				</div>
				
				
<!-- -----------------------------------------------------------代理人-------------------------------------------------- -->
				<aside id="sidebar">
					<div class="col-md-3">
						<div class="side animate-box">
							<div
								class="col-md-12 col-md-offset-0 text-center fh5co-heading fh5co-heading-sidebar">
								<h2>
									<span style="font-family:'幼圆';">代理人</span>
								</h2>
							</div>
							<div class="fh5co-staff">
								<img src="../<%=houseinfo.getAgent().getHead() %>"
									alt="我的脸呐？">
								<h3><%=houseinfo.getAgent().getName()%></h3>
								<strong class="role"><%=houseinfo.getAgent().getEmail()%></strong>
								<strong class="role"><%=houseinfo.getAgent().getContact()%></strong>
								<button id="ThumbButton" class="btn btn-primary fontAll" onclick="getThumb(<%=houseinfo.getAgent().getId()%>)">
									<i class="fa fa-heart" aria-hidden="true"></i> 为我点赞
								</button>
								<!-- 提示：只有为您服务过的代理人才可以被点赞。
											点赞之后不可取消，是否继续 -->
							</div>
						</div>
						<div class="side animate-box">
							<div
								class="col-md-12 col-md-offset-0 text-center fh5co-heading fh5co-heading-sidebar">
								<h2>
									<span style="font-family:'幼圆';">近期热点</span>
								</h2>
							</div>
							<div class="blog-entry">
								 <img src="DetailInfo/images/blog-1.jpg"
									class="img-responsive" alt="">
									<div class="desc">
										<span class="date">2019 五月 30</span>
										<h3>香樟园别墅</h3>
									</div>
							</div>
							<div class="blog-entry"> <img src="DetailInfo/images/blog-2.jpg"
									class="img-responsive" alt="">
									<div class="desc">
										<span class="date">2019 五月 30</span>
										<h3>恒大绿洲</h3>
									</div>
							</div>
							<div class="blog-entry">
								<img src="DetailInfo/images/blog-1.jpg"
									class="img-responsive" alt="">
									<div class="desc">
										<span class="date">2019 五月 30</span>
										<h3>百草园</h3>
									</div>
								
							</div>

							<div class="blog-entry">
								 <img src="DetailInfo/images/blog-1.jpg"
									class="img-responsive" alt="">
									<div class="desc">
										<span class="date">2019 五月 30</span>
										<h3>世纪豪庭</h3>
									</div>
							</div>
							<div class="blog-entry">
								 <img src="DetailInfo/images/blog-1.jpg"
									class="img-responsive" alt="">
									<div class="desc">
										<span class="date">2019 五月 30</span>
										<h3>蟠龙湾</h3>
									</div>
							</div>
							
						</div>
					</div>
				</aside>
<!-- -----------------------------------------------------------代理人结束-------------------------------------------------- -->

			</div>
		</div>
	</div>

	<div id="fh5co-instagram">

		<div class="row">
			<div class="col-md-3 nopadding animate-box"
				data-animate-effect="fadeIn">
				<div class="insta"
					style="background-image: url(../<%=listPic.get(14)%>);"></div>
			</div>
			<div class="col-md-3 nopadding animate-box"
				data-animate-effect="fadeIn">
				<div class="insta"
					style="background-image: url(../<%=listPic.get(15)%>);"></div>
			</div>
			<div class="col-md-3 nopadding animate-box"
				data-animate-effect="fadeIn">
				<div class="insta"
					style="background-image: url(../<%=listPic.get(01)%>);"></div>
			</div>
			<div class="col-md-3 nopadding animate-box"
				data-animate-effect="fadeIn">
				<div class="insta"
					style="background-image: url(../<%=listPic.get(02)%>);"></div>
			</div>
		</div>
	</div>

	<!-- footer -->
	<jsp:include page="footer.jsp" flush="false"></jsp:include>
	<!-- end footer -->
	
	
	
	</div>

	<div class="gototop js-top">
		<div id="retop">
			<a href="#" title="返回顶部" class="js-gotop">
			<i class="fa fa-arrow-up" aria-hidden="true"></i></a>
		</div>
		<div id="addcar" title="预约" class="ordericon"
			style="margin-top:10px;width:50px;height:50px;">
			<a href="OrderHouse?houseid=<%=request.getParameter("houseid")%>" class="bottoma"></a>
		</div>
		
	</div>

	<!-- jQuery -->
	<script src="DetailInfo/js/jquery.min.js"></script>
	<!-- jQuery Easing -->
	<script src="DetailInfo/js/jquery.easing.1.3.js"></script>
	<!-- Bootstrap -->
	<script src="DetailInfo/js/bootstrap.min.js"></script>
	<!-- Waypoints -->
	<script src="DetailInfo/js/jquery.waypoints.min.js"></script>
	<!-- Flexslider -->
	<script src="DetailInfo/js/jquery.flexslider-min.js"></script>
	<!-- Magnific Popup -->
	<script src="DetailInfo/js/jquery.magnific-popup.min.js"></script>
	<script src="DetailInfo/js/magnific-popup-options.js"></script>
	<!-- Main -->
	<script src="DetailInfo/js/main.js"></script>
	<script src="DetailInfo/js/three.min.js"></script>
	<script src="DetailInfo/js/photo-sphere-viewer.min.js"></script>
	<script type="text/javascript">
	function getThumb(id)
	{
		//alert("");
		$.ajax({
				url : '${pageContext.request.contextPath}/AddAgent',
				type : 'post',//请求类型get或者post
				data : {"action":"getThumb","agentid":id},
				success : function(data) {//customer_dialog
					alert(data);
					//成功 
					//成功以后修改点赞链接的样式
					//location.reload(true);
				},
				error : function() {
					alert('失败');
				}
			});
	 }
	
	
	
	
	
	
	$(function () { $("#alipay").tooltip({html : true });});
	$(function () { $("#wechatpay").tooltip({html : true });});
	var div = document.getElementById('containerImg');
	var PSV = new PhotoSphereViewer({
			panorama: 'DetailInfo/images/allPic.jpg',
			container: div,
			time_anim: 3000,
			navbar: true,
			navbar_style: {
				backgroundColor: 'rgba(58, 67, 77, 0.7)'
			},
		});
	
	
	</script>

</body>
</html>

