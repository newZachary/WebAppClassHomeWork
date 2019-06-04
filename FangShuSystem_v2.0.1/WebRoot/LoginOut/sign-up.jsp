<%@ page language="java" import="java.util.*" pageEncoding="utf-8" errorPage="Error/error.jsp"%>
<% request.setCharacterEncoding("UTF-8"); %>

<!DOCTYPE html>
<html class="no-js">
	<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">

    <title>用户注册</title>
	<link rel="shortcut icon" href="images/iconvilla.png" type="image/x-icon">
	<!-- Place favicon.ico and apple-touch-icon.png in the root directory -->
	<link rel="shortcut icon" href="favicon.ico">
	<link href='https://fonts.googleapis.com/css?family=Open+Sans:400,700,300' rel='stylesheet' type='text/css'>
	<link rel="stylesheet" href="css/bootstrap.min.css">
	<link rel="stylesheet" href="css/animate.css">
	<link rel="stylesheet" href="css/style.css">
	<!-- Modernizr JS -->
	<script src="js/modernizr-2.6.2.min.js"></script>
	<!-- FOR IE9 below -->

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
		
		function checkrepwd(){
			var password=document.getElementById("password").value.toString();
			var repassword=document.getElementById("repassword").value.toString();
			if(password!=repassword){
				document.getElementById("hidrepasswd").style.display="block";
				return false;
				}
			else{
				document.getElementById("hidrepasswd").style.display="none";
				return true;
				}
			}
	
		function clickpointbtn(){
			if(checkphone()&&checkpwd()&&checkrepwd()){
				formsignup.submit();
			}else{
				checkphone();
				checkpwd();
				checkrepwd();
				
			}
			
		}

		
		
		
		
		function reload() {
   		   var img = document.getElementById("verifyImg");
   		   img.src="../verify?t=" + new Date().getTime();
   		   document.getElementById("verifyhidden").value='<%=session.getAttribute("verifyCode")%>';
   	    }
		
		function checkcode(){
			var verifyCode=document.getElementById("verifyhidden").value;
			alert(verifyCode);
			var verify=document.getElementById("verifycode").value.toString();
			if(verifyCode!=verify){
				document.getElementById("hidverify").style.display="block";
				return false;
				}
			else{
				document.getElementById("hidverify").style.display="none";
				return true;
				}
		}
		  
	
    </script>
    

	</head>
	<body>

		<div class="container">
			
			<div class="row">
				<div class="col-md-4 col-md-offset-4">
					

					<!-- Start Sign In Form -->
					<form action="../SignUpServlet" id="formsignup" class="fh5co-form animate-box" data-animate-effect="fadeIn">
						<h2>我要注册</h2>
						<div class="form-group">
						<%
							String info=request.getParameter("info");
							if("1".equals(info)){
						%>
							<div id="hidunsucces" class="alert alert-success" role="alert">您的电话已被占用.</div>
						<%  }
							else if("2".equals(info))
							{%>
							<div id="hidunsucces" class="alert alert-success" role="alert">验证码错误.</div>
								<%}%>
						</div>
						<div class="form-group">
							<label for="name" class="sr-only">手机号码</label>
							<%
						String phone=request.getParameter("phonenum");
								phone=(	phone==null)?"":phone;
							%>
							<input type="text" class="form-control" id="phonenum" name="phonenum" placeholder="手机号码" autocomplete="off" onblur="checkphone()" value="<%=phone%>">
                            <div id="hiduserid" class="hiddenword">*您输入的电话号码不合法</div>
						</div>
						<div class="form-group">
							<label for="password" class="sr-only">密码</label>
							<input type="password" class="form-control" id="password" name="password" placeholder="密码 请输入6-12位之间" autocomplete="off" onblur="checkpwd()">
                            <div id="hidpasswderror" class="hiddenword">*密码输入错误</div>
						</div>
						<div class="form-group">
							<label for="re-password" class="sr-only">再次输入密码</label>
							<input type="password" class="form-control" id="repassword" placeholder="再次输入密码" autocomplete="off" onblur="checkrepwd()">
                            <div id="hidrepasswd" class="hiddenword">*密码不一致</div>
						</div>
                        
                        <div class="form-group">
							<label for="verifycode" class="sr-only">验证码</label>
							<input type="text" class="form-control" id="verifycode" name="verifycode" placeholder="验证码" autocomplete="off" >
                            <img src="../verify" id="verifyImg">
    						<a href="javascript:reload()">看不清，换一张</a>
                            <div id="hidverify" class="hiddenword">*验证码错误</div>
						</div>
                        
                        <!--
						<div class="form-group">
							<label for="remember"><input type="checkbox" id="remember">记住我</label>
						</div>
                        -->
                        
                        
						<div class="form-group">
							<p>已经注册? <a href="login.jsp">转到登陆</a></p>
						</div>
						<div class="form-group">
							<input type="button" value="注册" class="btn btn-primary" onclick="clickpointbtn()">
						</div>
					</form>
					<!-- END Sign In Form -->

				</div>
			</div>
			<div class="row" style="padding-top: 60px; clear: both;">
				<div class="col-md-12 text-center"><p><small>&copy; All Rights Reserved.</small></p></div>
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

