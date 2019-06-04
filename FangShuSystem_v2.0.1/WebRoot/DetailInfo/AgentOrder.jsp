<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<%@ page language="java"
	import="cn.sdcet.project.service.HouseInfoService"%>
<%@ page language="java" import="cn.sdcet.project.domain.House"%>
<%@ page language="java" import="cn.sdcet.project.domain.HouseDetailInfo"%>
<%@ page language="java" import="cn.sdcet.project.domain.UserInfo"%>
<%@ page language="java" import="cn.sdcet.project.domain.ShopCar"%>
<%@ page language="java" import="cn.sdcet.project.service.ShopCarService"%>
<%@ page language="java" import="java.util.List" %>
<%@ page language="java" import="java.util.ArrayList" %>
<!DOCTYPE HTML>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>我的预约</title>
<link rel="shortcut icon" href="images/iconvilla.png"
	type="image/x-icon">

<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description"
	content="Free HTML5 Website Template by freehtml5.co" />
<meta name="keywords"
	content="free website templates, free html5, free template, free bootstrap, free website template, html5, css3, mobile first, responsive" />

<!-- Facebook and Twitter integration -->
<meta property="og:title" content="" />
<meta property="og:image" content="" />
<meta property="og:url" content="" />
<meta property="og:site_name" content="" />
<meta property="og:description" content="" />
<meta name="twitter:title" content="" />
<meta name="twitter:image" content="" />
<meta name="twitter:url" content="" />
<meta name="twitter:card" content="" />

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
<!-- FOR IE9 below -->
<!--[if lt IE 9]>
	<script src="js/respond.min.js"></script>
	<![endif]-->
<!-- 这是头部需要引用的东西 -->
<!-- Bootstrap  -->
<link rel="stylesheet" href="../Merry/css/bootstrap.css">
<!-- Superfish -->
<link rel="stylesheet" href="../Merry/css/superfish.css">
<link rel="stylesheet" href="../Merry/css/style.css">
<script src="../Merry/dist/scripts.min.js"></script>
</head>
<body>
	<jsp:include page="../Merry/indexx.jsp" flush="false"></jsp:include>
	<div class="fh5co-loader"></div>
	<div id="page">
		<div id="fh5co-blog">
			<div class="container">
			未完成订单
				<div class="row">


			<%
			List<Map<String,Object>> listt = new ArrayList<Map<String,Object>>();
			List<Map<String,Object>> listOver = new ArrayList<Map<String,Object>>();
			Object id=session.getAttribute("userid");
			int userid;
			if(id==null){
				response.sendRedirect("../LoginOut/login.jsp?returnUrl="+request.getRequestURI());
			}else{
				ShopCarService shopcarService=new ShopCarService();
				userid=Integer.parseInt(id.toString());
				
				listt = shopcarService.getHouseInfoOfOrdered(userid,0);
				listOver = shopcarService.getHouseInfoOfOrdered(userid,1);
			}
				if(listt.size()>0){
					ShopCar sc=new ShopCar();
					UserInfo ui=new UserInfo();
					HouseDetailInfo hdi=new HouseDetailInfo();
					for(Map<String, Object> map:listt){
						sc=(ShopCar)map.get("ShopCar");
						ui=(UserInfo)map.get("UserInfo");
						hdi=(HouseDetailInfo)map.get("HouseDetailInfo");
			%>
			
			
								<div class="col-md-3">
							<div class="fh5co-blog animate-box">
								<div class=""><a href="DetailInfo/detail.jsp?houseid=<%=hdi.getHouse().getId() %>"><img class="img-responsive" src="../<%=map.get("pic").toString()%>" alt=""></a></div>
								<div class="blog-text text-center">
									<div class="text-center">
										<span class="posted-on">预约时间:<%=sc.getOrderTime() %></span>
									</div>
										
									
									<div class="text-left">
									<h4>房屋编号:<%=hdi.getHouse().getId() %></h4>
									<h4>房屋地址:<%=hdi.getH_addressdel()%></h4>
										<h4>客户姓名:<%=ui.getName() %> &nbsp;&nbsp;<%=ui.getGender() %>士</h4>
										<h4>电话:<%=ui.getContact() %></h4>
									</div>
								</div> 
							</div>
						</div>
						
<%} }%>
				</div>
				
		已完成订单		
				<div class="row">

				<% if(listOver.size()>0){
					ShopCar sc=new ShopCar();
					UserInfo ui=new UserInfo();
					HouseDetailInfo hdi=new HouseDetailInfo();
					for(Map<String, Object> map:listOver){
						sc=(ShopCar)map.get("ShopCar");
						ui=(UserInfo)map.get("UserInfo");
						hdi=(HouseDetailInfo)map.get("HouseDetailInfo");
			%>
			
			
								<div class="col-md-3">
							<div class="fh5co-blog animate-box">
								<div class=""><a href="DetailInfo/detail.jsp?houseid=<%=hdi.getHouse().getId() %>"><img class="img-responsive" src="../<%=map.get("pic").toString()%>" alt=""></a></div>
								<div class="blog-text text-center">
									<div class="text-center">
										<span class="posted-on">预约时间:<%=sc.getOrderTime() %></span>
									</div>
										
									
									<div class="text-left">
									<h4>房屋编号:<%=hdi.getHouse().getId() %></h4>
									<h4>房屋地址:<%=hdi.getH_addressdel()%></h4>
										<h4>客户姓名:<%=ui.getName() %> &nbsp;&nbsp;<%=ui.getGender() %>士</h4>
										<h4>电话:<%=ui.getContact() %></h4>
									</div>
								</div> 
							</div>
						</div>
						
<%} }%>
				</div>
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
			</div>
		</div>



		<!-- footer -->
		<jsp:include page="footer.jsp" flush="false"></jsp:include>
		<!-- end footer -->
		
		
		
	</div>


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

</body>
</html>

