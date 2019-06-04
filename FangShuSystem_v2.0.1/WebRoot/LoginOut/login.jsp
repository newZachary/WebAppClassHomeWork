<%@ page language="java" import="java.util.*" pageEncoding="utf-8" errorPage="Error/error.jsp"%>
<%@ page language="java" import="cn.sdcet.project.service.UsersService" %>
<%@ page language="java" import="cn.sdcet.project.domain.Users" %>
<!DOCTYPE html>
<html class="no-js">
	<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>登陆</title>
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
	   <%
   String parMsg=request.getParameter("msg");
   String parname=request.getParameter("username");
   String msg=parMsg==null?"":"账号或密码错误";
   String username=parname==null?"":parname;
   %>
    <script type="text/javascript">

		function checkname(){
			var userid=document.getElementById("txtuserid").value;
			if(!(/^1[34578]\d{9}$/.test(userid))){
				document.getElementById("hiduserid").style.display="block";
				}
			else{
				document.getElementById("hiduserid").style.display="none";
				}
		
			}
		function clickpointbtn(){
			
				document.getElementById("hiduserid").style.display="none";
				document.getElementById("hidpasswd").style.display="none";
				/***********登陆成功后跳转************/
				//window.location.href="../CheckLogin";
				 formT.submit();
				
			}
    </script>
    
    
	</head>
	<body>

		<div class="container">
			<div class="row">
				<div class="col-md-4 col-md-offset-4">
					

					<!-- Start Sign In Form -->
					<form name="formT" action="../CheckLogin" class="fh5co-form animate-box" data-animate-effect="fadeIn" method="post">
						<h2 style="font-family:'幼圆';">我要登陆</h2>
						<div class="form-group">
							<label for="username" class="sr-only">用户名/电话：</label>
							<input value="<%=username%>" type="text" class="form-control" id="txtuserid" placeholder="手机号码" autocomplete="off"  id="username" name="username" >
                            <div id="hiduserid" class="hiddenword">*电话号码不合法</div>
						</div>
						<div class="form-group">
							<label for="password" class="sr-only">密码</label>
							<input type="password" class="form-control" id="password" placeholder="密码" autocomplete="off" name="password">
                            
                            <div id="hidpasswd" class="hiddenword">*密码错误</div>
						</div>
						<div class="form-group">
							<label for="remember"><input type="checkbox" id="remember">记住我？</label>
						</div>
						<div class="form-group">
							<p>我去你还没注册？ <a href="sign-up.jsp">点我</a> | <a href="forgot.jsp">呃，密码忘了？</a></p>
						</div>
						<div class="form-group">
							<input type="button" value="登陆" class="btn btn-primary" onclick="clickpointbtn()">
							<span style="color: red" id="msgError"  ><%=msg %></span>
						</div>
						<input type="hidden" name="returnUrl" value="<%=request.getParameter("returnUrl")%>"/>
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

