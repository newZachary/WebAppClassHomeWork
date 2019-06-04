<%@ page language="java" import="java.util.*" pageEncoding="utf-8" %>
<%@ page language="java" import="cn.sdcet.project.service.HouseInfoService"%>
<%@ page language="java" import="cn.sdcet.project.domain.House"%>
<%@ page language="java" import="javax.servlet.http.HttpSession"%>
<!DOCTYPE HTML>
<html>
	<head>
	
	<style type="text/css">
	body{
		
	}
	
	.n{
		width:1200px;
		background-color:#FFFFFF;
		height:200px;
		text-align:center;
		margin:0 auto;
	}
	
	.Siz{
		font-size:20px;
		color:#666666;
	}
	
	.table-upd-del{
		width:75%;
		
	}
	
	.a-top-size{
		color:#5B5B5B;
	}
	
	.span-title{
		font-family:'微软雅黑';
		color:#F69D9D;
		font-weight:lighter;
		font-size:50px;
	}
	
	</style>
	
	
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	
	
	
	<title>查看房子信息</title>
	<link rel="shortcut icon" href="images/iconvilla.png" type="image/x-icon">
	
	
	
	
	<link href="https://fonts.googleapis.com/css?family=Josefin+Slab:400,600,700" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css?family=Sacramento" rel="stylesheet">
	
	<!-- Animate.css -->
	<link rel="stylesheet" href="css/animate.css">
	<!-- Icomoon Icon Fonts-->
	<link rel="stylesheet" href="css/icomoon.css">
	<!-- Bootstrap  -->
	<link rel="stylesheet" href="css/bootstrap.css">

	<!-- Magnific Popup -->
	<link rel="stylesheet" href="css/magnific-popup.css">

	<!-- Flexslider  -->
	<link rel="stylesheet" href="css/flexslider.css">

	<!-- Theme style  -->
	<link rel="stylesheet" href="css/style.css">

	<!-- Modernizr JS -->
	<script src="js/modernizr-2.6.2.min.js"></script>
    <!-- jQuery -->
	<script src="js/jquery.min.js"></script>
	<!-- jQuery Easing -->
	<script src="js/jquery.easing.1.3.js"></script>
	<!-- Bootstrap -->
	<script src="js/bootstrap.min.js"></script>
	<!-- Waypoints -->
	<script src="js/jquery.waypoints.min.js"></script>
	<!-- Flexslider -->
	<script src="js/jquery.flexslider-min.js"></script>
	<!-- Magnific Popup -->
	<script src="js/jquery.magnific-popup.min.js"></script>
	<script src="js/magnific-popup-options.js"></script>
	<!-- Main -->
	<script src="js/main.js"></script>
	
	
	
	
	
	
	<script type="text/javascript">
		function updateinfo(){
			alert("主人，这个你还没写呐！");
		}
		
		function deleteinfo(){
			if(confirm('您确定要删除这条信息吗？')){
				updhouse.submit();	
			}
			
		}
		
	</script>
	
	
	
	

	</head>
	<body>
	
	
	<%
		List<House> listHouse = new ArrayList<House>();
		HouseInfoService houseService = new HouseInfoService();
		listHouse = houseService.getHouseInfoIdName();
	%>
	
	<nav class="fh5co-nav" role="navigation">
		<div class="container-fluid">
			<div class="row">
				<div class="top-menu">
					<div class="container">
						<div class="row">
							<div class="col-sm-7 text-left menu-1">
								<ul>
                                	<li><a href="#" style="padding-top:0px;padding-bottom:20px;"><img src="images/fangzicolor.png" style="width:25px;height:25px;"></a></li>
									<li><a href="#">欢迎进入后台管理系统</a></li>
                                    <li><a href="index.jsp">首页</a></li>
								</ul>
							</div>
							<div class="col-sm-5">
								<ul class="fh5co-social-icons">
									<li><a href="#">退出</a></li>
								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>
			
		</div>
	</nav>

			<div class="row animate-box" style="margin:auto;margin-top:100px;">
				<div class="col-md-6 col-md-offset-3 text-center fh5co-heading">
					<span class="span-title">查看房屋信息</span>
				</div>
			</div>
			
			<div style="margin-top:10px;margin-bottom:100px;">					
			<form action="#" id="updhouse" method="post">	
				<table class="table-upd-del" border="1" cellpadding="2"	cellspacing="1"	bgcolor="#FBF2EB" align="center" >			
					<tr align="center" bgcolor="#FAFAF1" height="22">
						<td width="70%" width="50px"><span class="Siz">房源名称</span></td>
						<td width="30%"  width="50px"><span class=Siz></span></td>
					</tr>
					
					<%for(House house:listHouse){ %>
					<tr align="center" bgcolor="#FAFAF1" height="22">
						<td width="70%" height="50px"><%=house.getName() %></td>
						<td width="30%" height="50px">
							<a id="update" class="btn btn-primary" href="changehouse.jsp?houseid=<%=house.getId() %>">修改</a>
							<!-- <input type="button" id="delete" class="btn btn-primary" value="删除" onClick="deleteinfo()"> -->
							<a id="delhouseinfo"  class="btn btn-primary" href="../DelHouseInfo?houseid=<%=house.getId() %>">删除</a>  
						<%
						if(!"1".equals(house.getFlag())){
							%>
							<a href="../UpdHouseInfo?action=shoucang&houseid=<%=house.getId()%>"><img alt="收藏" src="images/shoucang.png">
						</a>
						<%}%>
						
						</td>
					</tr>
					<%} %>
				</table>
			</form>
			</div>
	
	
	<div id="fh5co-instagram" style="margin-top:200px;">
		<div class="container">
			<div class="row animate-box">
				<div class="col-md-12 col-md-offset-0 text-center fh5co-heading">
					<span class="span-title">Instagram Posts</span>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-md-3 nopadding animate-box">
				<div class="insta" style="background-image: url(images/insta-1.jpg);"></div>
			</div>
			<div class="col-md-3 nopadding animate-box">
				<div class="insta" style="background-image: url(images/insta-2.jpg);"></div>
			</div>
			<div class="col-md-3 nopadding animate-box">
				<div class="insta" style="background-image: url(images/insta-3.jpg);"></div>
			</div>
			<div class="col-md-3 nopadding animate-box">
				<div class="insta" style="background-image: url(images/insta-4.jpg);"></div>
			</div>
		</div>
	</div>		
					
							

	<div id="fh5co-instagram">
		<div class="container">
			<div class="row animate-box">
				<div class="col-md-12 col-md-offset-0 text-center fh5co-heading">
					
				</div>
			</div>
		</div>
	</div>

	<footer id="fh5co-footer" role="contentinfo">
		<div class="container">
			<div class="row row-pb-md">
				<div class="col-md-4 fh5co-widget">
					<h4>Paper</h4>
					<p>Facilis ipsum reprehenderit nemo molestias. Aut cum mollitia reprehenderit. Eos cumque dicta adipisci architecto culpa amet.</p>
				</div>
				<div class="col-md-4 col-md-push-1">
					<h4>Links</h4>
					<ul class="fh5co-footer-links">
						<li><a href="#">Home</a></li>
						<li><a href="#">Blog</a></li>
						<li><a href="#">Lifestyle</a></li>
						<li><a href="#">About</a></li>
						<li><a href="#">Contact</a></li>
					</ul>
				</div>

				<div class="col-md-4 col-md-push-1">
					<h4>Contact Information</h4>
					<ul class="fh5co-footer-links">
						<li>198 West 21th Street, <br> Suite 721 New York NY 10016</li>
						<li><a href="tel://1234567920">+ 1235 2355 98</a></li>
						<li><a href="mailto:info@yoursite.com">info@yoursite.com</a></li>
						<li><a href="http://freehtml5.co">FreeHTML5.co</a></li>
					</ul>
				</div>

			</div>

			<div class="row copyright">
				<div class="col-md-12 text-center">
					<p>
						<small class="block">&copy; 2017 ZhangFang&YinZichen All Rights Reserved</small>
					</p>
					<p>
						<ul class="fh5co-social-icons">
							<li><a href="#"><i class="icon-twitter"></i></a></li>
							<li><a href="#"><i class="icon-facebook"></i></a></li>
							<li><a href="#"><i class="icon-linkedin"></i></a></li>
							<li><a href="#"><i class="icon-dribbble"></i></a></li>
						</ul>
					</p>
				</div>
			</div>

		</div>
	</footer>
	</div>

	<div class="gototop js-top">
		<a href="#" class="js-gotop"><i class="icon-arrow-up"></i></a>
	</div>
	
	

	</body>
</html>

