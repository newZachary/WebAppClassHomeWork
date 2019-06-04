<%@ page language="java" import="java.util.*" pageEncoding="utf-8" %>
<% request.setCharacterEncoding("UTF-8"); %>

<!DOCTYPE HTML>
<html>
	<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">




	<title>欢迎进入后台管理系统</title>
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

	</head>
	<body>
		
	<div class="fh5co-loader"></div>
	
	<div id="page">
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

	<div id="fh5co-content" >
        
        
        <div class="container" style="margin:auto;">
			<div class="row animate-box" style="margin:auto;">
				<div class="col-md-6 col-md-offset-3 text-center fh5co-heading">
					<h2><span style="font-family:'微软雅黑'">管理信息</span></h2>
				</div>
			</div>
            
            
		</div>
        
        
        <div class="divchoose">
        	<div class="row animate-box divinchoose">
				<div class="col-md-12 col-md-offset-0">
                   	<a href="addhouse.jsp">
                    	<div class="a_choose">添加房子信息</div>
                    </a>
				</div>
                
                <div class="col-md-12 col-md-offset-0">

                   	<a href="lookhouse.jsp">
						<div class="a_choose">查看房屋列表</div>
                    </a>
				</div>
			</div>
            
            <div class="row animate-box divinchoose">
				<div class="col-md-12 col-md-offset-0">
                    <a href="addagent.jsp">
                    	<div class="a_choose">设置代理人</div>
                    </a>
				</div>
			</div>
            
        </div>
        
	</div>
	

















	<footer id="fh5co-footer" role="contentinfo">
		<div class="container">
			

			<div class="row copyright">
				<div class="col-md-12 text-center">
					<p>
						<small class="block">&copy; 2017 ZhangFang&amp;YinZichen All Rights Reserved</small>
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

