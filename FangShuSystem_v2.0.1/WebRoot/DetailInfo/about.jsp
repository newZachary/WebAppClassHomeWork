<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<%@ page language="java"
	import="cn.sdcet.project.service.UserInfoService"%>
<%@ page language="java" import="cn.sdcet.project.domain.UserInfo"%>
<%@ page language="java" import="cn.sdcet.project.domain.House"%>
<%@ page language="java"
	import="cn.sdcet.project.service.HouseInfoService"%>
<!DOCTYPE HTML>
<html>
<head>
<meta charset="utf-8">
<title>我的信息</title>
<link rel="shortcut icon" href="images/iconvilla.png" type="image/x-icon">


<link
	href="https://fonts.googleapis.com/css?family=Josefin+Slab:400,600,700"
	rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Sacramento"
	rel="stylesheet">
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
<style type="text/css">
body {
	list-style: none;
	
}

.row {
	margin: 5px;
}

.span3 {
	width: 30%;
	float: left;
}

.span7 {
	width: 70%;
	float: left;
}

fieldset {
	width: 100px;
	margin: 0px;
	padding: 0px;
}

.progress {
	height: 20px;
	overflow: hidden;
	background-color: #f5f5f5;
	border-radius: 4px;
}

.progress-bar {
	float: left;
	width: 0;
	height: 100%;
	font-size: 12px;
	line-height: 20px;
	color: #fff;
	text-align: center;
	background-color: #5cb85c;
}

#progress {
	width: 100px;
	display: none;
}
</style>

<script type="text/javascript">
	function updinfo() {
		var subval = document.getElementById("updatebtn").value;
		var judge;
		if (subval == "确认修改") {
			document.getElementById("updatebtn").value = "修改";
			judge = true;
			subupdateinfo.submit();
		} else {
			document.getElementById("updatebtn").value = "确认修改";
			judge = false;

		}
		document.getElementById("name").disabled = judge;
		document.getElementById("genderman").disabled = judge;
		document.getElementById("genderwoman").disabled = judge;
		document.getElementById("email").disabled = judge;
		document.getElementById("idcard").disabled = judge;

	}

	function updheaderblock() {
		document.getElementById("updateheader").style.display = "block";
	}
	function updheadernone() {
		///alert("I love you!");
		location.replace(location);
		
	}
</script>
<!-- 这是头部需要引用的东西 -->
<!-- Bootstrap  -->
<link rel="stylesheet" href="Merry/css/bootstrap.css">
<!-- Superfish -->
<link rel="stylesheet" href="Merry/css/superfish.css">
<link rel="stylesheet" href="Merry/css/style.css">
<script src="Merry/dist/scripts.min.js"></script>
</head>
<body>
	<%
	
		UserInfo userinfo = new UserInfo();
		//HttpSession session=request.getSession();
		Object objname = session.getAttribute("username");
		if (objname == null) {
			response.sendRedirect("../LoginOut/login.jsp");
		} else {
			String loginid = objname.toString();
			UserInfoService userinfoService = new UserInfoService();
			userinfo = userinfoService.getUserInfo(loginid);

		}
	%>
	<jsp:include page="../Merry/indexxx.jsp" flush="false"></jsp:include>

	<div class="fh5co-loader"></div>
	<div id="page">
		<!-- ------------------------------------代理别墅------------------------------------------------------------- -->
		
		<div id="fh5co-instagram" style="margin-top:50px">
			
			<%
			Object isagent=session.getAttribute("isagent");
			if(isagent!=null&&Boolean.parseBoolean(isagent.toString())){
				//代理人
				List<House> houseList = new ArrayList<House>();
				HouseInfoService houseService = new HouseInfoService();
				//HttpSession session=new HttpSession();
				//if((boolean)session.getAttribute("isagent"))
				int agentid = 0;
				
				if (session.getAttribute("userid") != null) {
					agentid = Integer.parseInt(session.getAttribute("userid")
							.toString());
				}
				houseList = houseService.getHouseInfoRoughTop4ByAgentId(agentid);
				%>
				<div class="container">
				<div class="row animate-box">
					<div class="col-md-12 col-md-offset-0 text-center fh5co-heading">
						<h2>
							<span style="font-family:'幼圆';">代理别墅</span>
						</h2>
						<span style="float:right"> <a href="AgentHouse.jsp?currentPage=1">查看更多</a></span>
					</div>
				</div>
			</div>
			<div class="row">
				<%
				for (House house : houseList) {
					%>
					<div class="col-md-3">
						<div class="fh5co-blog animate-box">
							<a href="detail.jsp?houseid=<%=house.getId()%>"><img
								class="img-responsive" src="../<%=house.getOnePicAdd()%>" alt=""></a>
							<div class="title text-center">
								<span class="posted-on" style="margin-top:5px;">
									<font style="font-size:20px;font-family:'幼圆';"><%=house.getH_address()%></font>
								</span>
								<h3>
									<a href="#"><%=house.getName()%></a>
								</h3>
								<span class="category" style="font-weight:lighter;">villa</span>
								</div>
						</div>
					</div>

					<%
				}
			}else{
				//普通用户
			}
				%>


			</div>
		</div>
		<!-- ------------------------------------代理别墅结束------------------------------------------------------------- -->

		<div id="fh5co-content">

			<div class="container" style="margin:auto;">

				<div class="row animate-box" style="margin:auto;">
					<div class="col-md-6 col-md-offset-3 text-center fh5co-heading">
						<h2>
							<span style="font-family:'幼圆';">我的信息</span>
						</h2>
					</div>
				</div>

				<div class="row" style="margin:auto;">
					<div class="col-md-6 col-md-offset-3">
						<div class="fh5co-staff">
							<!------------------------------------------------ 头像 ---------------------------------------->

							<img src="../<%=userinfo.getHead()%>"
								alt="我的脸呐?">
							<div class="form-group row">
								<div class="col-md-12 field">
									<input type="button" id="updatebtn" class="btn btn-primary"
										value="修改头像" onclick="updheaderblock()">
								</div>
							</div>
							<div name="updateheader" id="updateheader"
								style="display:none;margin:0">
								<div class="form-group row">
									<div class="col-md-6 field">
										<!-- 防止上传文件过程中页面跳转 -->
										<iframe id="uploadFrame" name="uploadFrame" width="0"
											height="0"></iframe>
										<form action="../UploadPic" method="post" id="uploadForm"
											enctype="multipart/form-data" target="uploadFrame" >
											<fieldset>

												<input enctype="multipart/form-data"  type="file" name="upload">

											</fieldset>
											<div>
												<input type="submit" value="确定修改" id="uploadBtn" onclick="updheadernone()">
											</div>
										</form>
									</div>
									<div id="message"></div>
									<div class="progress" id="progress">
										<div class="progress-bar" id="progressBar">
											<span>0</span>
										</div>
									</div>
								</div>
							</div>
							<!------------------------------------------------ 头像结束 ---------------------------------------->

							<span color="red">
								<%
									String msg = request.getParameter("msg");
									if (msg == null) {
										msg = "";
									} else if ("0".equals(msg)) {
										msg = "修改失败，请稍后重试";
									}
								%>
							</span>
							<div class="" style="margin-top:30px;">
								<!-- --------------------------------------------------------修改信息-------------------------------- -->
								<form name="subupdateinfo" id="subupdateinfo"
									action="../UpdUserInfo" method="post">
									<div class="form-group row">
										<div class="col-md-6 field">
											<div class="divtitlename">姓名：</div>
											<span> <input type="text" name="name" id="name"
												disabled="disabled" class="form-control"
												style="width:600px;" value="<%=userinfo.getName()%>">
											</span>
										</div>
									</div>
									<div class="form-group row">
										<div class="col-md-6 field">
											<div class="divtitlename">性别：</div>
											<div>
												<label style="font-weight:normal;"> <input
													type="radio" name="gender" id="genderman"
													class="radiogender" value="1"
													<%if (userinfo.getGender() == 1)%> checked <%%>
													disabled="disabled">男
												</label> <label style="font-weight:normal;"> <input
													type="radio" name="gender" id="genderwoman"
													class="radiogender" value="2"
													<%if (userinfo.getGender() == 2)%> checked <%%>
													disabled="disabled">女
												</label>
											</div>
										</div>
									</div>
									<div class="form-group row">
										<div class="col-md-6 field">
											<div class="divtitlename">邮箱：</div>
											<input type="text" name="email" id="email"
												class="form-control" style="width:600px;"
												disabled="disabled" value="<%=userinfo.getEmail()%>">
										</div>
									</div>
									<div class="form-group row">
										<div class="col-md-6 field">
											<div class="divtitlename">身份证号：</div>
											<input type="text" name="idcard" id="idcard"
												class="form-control" style="width:600px;"
												disabled="disabled" value="<%=userinfo.getCardid()%>">
										</div>
									</div>
									<div class="form-group row">
										<div class="col-md-12 field">
											<input type="button" id="updatebtn" class="btn btn-primary"
												value="修改" onclick="updinfo()">
										</div>
									</div>
									<input type="hidden" name="action" value="1">
								</form>
								<!-- --------------------------------------------------------修改信息结束------------------------------------------------------ -->

							</div>
						</div>
					</div>
				</div>
			</div>
		</div>



		<!-- footer -->
	<jsp:include page="footer.jsp" flush="false"></jsp:include>
	<!-- end footer -->
	
	
	
	</div>

	<div class="gototop js-top">
		<a href="#" class="js-gotop"><i class="icon-arrow-up"></i></a>
	</div>



</body>
</html>

