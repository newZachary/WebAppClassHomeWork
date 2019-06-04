<%@ page language="java" import="java.util.*" pageEncoding="utf-8" errorPage="Error/error.jsp"%>
<!DOCTYPE html>
<html class="no-js">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">



<title>忘记密码</title>






<!-- Place favicon.ico and apple-touch-icon.png in the root directory -->
<link rel="shortcut icon" href="favicon.ico">

<link
	href='https://fonts.googleapis.com/css?family=Open+Sans:400,700,300'
	rel='stylesheet' type='text/css'>

<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/animate.css">
<link rel="stylesheet" href="css/style.css">

<!-- Modernizr JS -->
<script src="js/modernizr-2.6.2.min.js"></script>
<!-- FOR IE9 below -->





<script type="text/javascript">
    function clickrenum(){
    	var renum=document.getElementById("renum").value;
		if(renum.length==0){
			document.getElementById("hidrenum").style.display="block";
			document.getElementById("hidrenum2").style.display="none";
			return false;
		}
		else if(renum!="1234")
			{
			document.getElementById("hidrenum").style.display="none";
			document.getElementById("hidrenum2").style.display="block";
			return false;
			}
		else
			{
			document.getElementById("hidrenum").style.display="none";
			document.getElementById("hidrenum2").style.display="none";
			}
		return true;
	}
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
			
		function checkpwd(){
			var password=document.getElementById("password").value.toString();
			if(password.length<6||password==""){
				document.getElementById("hidpasswderror").style.display="block";
				return false;
				}
			else{
				document.getElementById("hidpasswderror").style.display="none";
				return true;
				}
			
			}
		
		function clickpointbtn(){
			if(checkphone()&&checkpwd()&&clickrenum()){
				formforget.submit();
			}else{
				checkphone();
				checkpwd();
				clickrenum();
			}
			
		}
    </script>







</head>
<body>


		<!--  背景视频 -->
		<div id="div_backvideo">
			<div style="z-index:-1;position: fixed;width: 100%;min-width: 1100px">
				<video autoplay loop muted style=" width: 100%;z-index:9999;position: relative;visibility: visible">
				  <source src="video/homevilla2.mp4" type="video/mp4"  />
				</video>

   			</div>
		</div>

	<div class="container">
		<div class="row">
			<div class="col-md-4 col-md-offset-4">


				<!-- Start Sign In Form -->
				<form id="formforget" name="formforget" action="../UpdUserInfo" class="fh5co-form animate-box"
					data-animate-effect="fadeIn">
					<h2>忘记密码？</h2>
					<div class="form-group">
						<div class="alert alert-success" role="alert">请使用手机号码验证</div>
					</div>


					<div class="form-group">
						<label for="email" class="sr-only">手机号码</label> <input type="text"
							class="form-control" id="phonenum" name="phonenum"
							placeholder="您的手机号码" autocomplete="off" onblur="checkphone()">
						<div id="hiduserid" class="hiddenword">*您输入的电话号码不合法</div>
					</div>

					<div class="form-group">
						<input type="button" value="发送验证码" class="btn btn-primary"
							onclick="clickrenum()">
					</div>

					<div class="form-group">
						<div id="hidrenum" class="hiddenwords">请输入验证码信息</div>
						<div id="hidrenum2" class="hiddenwords">验证码信息错误</div>
						<label for="email" class="sr-only">手机验证码</label>
						 <input type="text" class="form-control" name="renum" id="renum"
							placeholder="手机验证码" autocomplete="off">
					</div>

					<div class="form-group">
						<label for="password" class="sr-only">新密码</label> <input
							type="password" class="form-control" id="password"
							name="password" placeholder="密码 请输入6-12位之间" autocomplete="off"
							onblur="checkpwd()">
						<div id="hidpasswderror" class="hiddenword">*密码输入错误</div>
					</div>
					<div class="form-group">
						<p>
							<a href="login.jsp">返回登陆</a> 或 <a href="sign-up.jsp">前往注册</a>
						</p>
					</div>
					<div class="form-group">
						<input type="button" value="修改" class="btn btn-primary"
							onclick="clickpointbtn()">
					</div>
					<input type="hidden" name="action" value="2">
				</form>
				<!-- END Sign In Form -->


			</div>
		</div>
		<div class="row" style="padding-top: 60px; clear: both;">
			<div class="col-md-12 text-center">
				<p>
					<small>&copy; All Rights Reserved.</small>
				</p>
			</div>
		</div>
	</div>

	<!-- jQuery -->
	<script src="js/jquery.min.js"></script>
	<!-- Bootstrap -->
	<script src="js/bootstrap.min.js"></script>
	<!-- Placeholder -->
	<script src="js/jquery.placeholder.min.js"></script>
	<!-- Waypoints -->
	<script src="js/jquery.waypoints.min.js"></script>
	<!-- Main JS -->
	<script src="js/main.js"></script>

</body>
</html>

