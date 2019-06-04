<%@ page language="java" import="java.util.*" pageEncoding="utf-8" errorPage="../Error/error.jsp"%>
<% request.setCharacterEncoding("UTF-8"); %>

<!DOCTYPE HTML>
<html>
	<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">




	<title>添加代理人信息</title>
	<link rel="shortcut icon" href="images/iconvilla.png" type="image/x-icon">


	

	

	
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
		function checkphone(){
			var userid=document.getElementById("phonenum").value.toString();
			if(!(/^1[34578]\d{9}$/.test(userid))){
				document.getElementById("hiduserid").style.display="block";
				return false;
				}
			else{
				document.getElementById("hiduserid").style.display="none";
				return true;
				}
			}
		
		
		
		
		
		
		function clickpointbtn(){
			if(checkphone()){
				form-agent.submit();
			}else{
				checkphone();
			}
			
		}
	
	
    </script>
    
    
    
    
    
    

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
    
    
    

	<div id="fh5co-content" >
		<div class="container" style="margin:auto;">
			<div class="row animate-box" style="margin:auto;">
				<div class="col-md-6 col-md-offset-3 text-center fh5co-heading" style="margin-bottom:30px;">
					<h2><span>添加代理人信息</span></h2>
				</div>
			</div>
			<div class="row" style="margin:auto;">
				<div class="col-md-6 col-md-offset-3">
					<div class="fh5co-staff">
					<form action="../AddAgent" method="post" id="form-agent">
                        <div class="form-group row">
							<div class="col-md-6 field">
								<%
								String register=request.getParameter("info");
								if("1".equals(register)){
								%>
								<div class="alert alert-danger" style="width:550px;">没有找到您想要的用户.</div>
								<%}else if("2".equals(register)){ %>
								<div class="alert alert-danger" style="width:550px;">添加成功！</div>
								<%} %>
							</div>
						</div>
                        
                        <div class="form-group row">
							<div class="col-md-6 field">
								<div class="divtitlename">用户手机号码：</div>
								<input type="text" name="phonenum" id="phonenum" class="form-control" style="width:550px;" onBlur="checkphone()">
                                <div id="hiduserid" class="hiddenword">*您输入的电话号码不合法</div>
							</div>
						</div>
                        
                        
						<div class="form-group row">
							<div class="col-md-12 field">
								<input type="submit" id="subadd" class="btn btn-primary" value="添加" onClick="clickpointbtn()">
							</div>
						</div>
					</form>
				</div>
					</div>
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

	
	

	</body>
</html>
