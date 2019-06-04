<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<%@ page language="java"
	import="cn.sdcet.project.service.HouseInfoService"%>
<%@ page language="java" import="cn.sdcet.project.domain.House"%>
<%@ page language="java" import="cn.sdcet.project.service.ShopCarService"%>
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
			<div class="row animate-box"  >
				<div class="col-md-12 col-md-offset-0 text-center fh5co-heading">
					<h2><span style="font-family:'幼圆';font-weight:lighter;">预&nbsp;约</span></h2>
				</div>
			</div>
				<div class="row">


			<%
			Object id=session.getAttribute("username");
			int userid;
			List<House> houseList = new ArrayList<House>();
				if(id==null){
					response.sendRedirect("../LoginOut/login.jsp?returnUrl="+request.getRequestURI());
				}else{
			ShopCarService shopcarService=new ShopCarService();
				//HttpSession session=new HttpSession();
				 userid=Integer.parseInt( session.getAttribute("userid").toString());
				houseList = shopcarService.getShopCar(userid);
				}
				if(houseList.size()>0){
				for(House house:houseList){
			%>
			
					<div class="col-md-4">
						<div class="fh5co-blog animate-box">
							<a href="detail.jsp?houseid=<%=house.getId()%>"><img class="img-responsive"
								src="../<%=house.getOnePicAdd() %>" alt="">
							<div class="title text-center">
								<span class="posted-on" style="margin-top:5px;margin-bottom:8px;">
									<font style="font-size:20px;font-family:'幼圆'"><%=house.getH_address()%></font>
								</span>
								<h3>
									<%=house.getName() %>
								</h3></a>
								<a href="../delthing?action=u&houseid=<%=house.getId()%>" onclick="return confirm('真的要取消预约吗？')">
									<span class="category" style="font-weight:lighter;">取消预约</span>
								</a>
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

