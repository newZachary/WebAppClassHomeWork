<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page language="java" import="cn.sdcet.project.util.PageHelper"%>
<%@ page language="java"
	import="cn.sdcet.project.service.HouseInfoService"%>
<%@ page language="java" import="cn.sdcet.project.domain.House"%>
<!DOCTYPE HTML>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>查看代理别墅</title>
<link rel="shortcut icon" href="SearchResult/images/iconvilla.png" type="image/x-icon">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description"
	content="Free HTML5 Website Template by freehtml5.co" />
<meta name="keywords"
	content="" />




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
		<div id="fh5co-blog" style="margin-top:10px">
			<div class="container">
			<div class="row animate-box"  >
				<div class="col-md-12 col-md-offset-0 text-center fh5co-heading">
					<h2><span style="font-family:'微软雅黑'">Villa</span></h2>
				</div>
			</div>
				<div class="row">


			<%
			int currentPage=1;
			if(!"".equals(request.getParameter("currentPage"))){
				currentPage	=Integer.parseInt( request.getParameter("currentPage"));
			}
			
			List<House> houseList = new ArrayList<House>();
				HouseInfoService houseService=new HouseInfoService();
				
				//HttpSession session=new HttpSession();
				int agentid=Integer.parseInt( session.getAttribute("userid").toString());
				int recordCount=houseService.getHouseInfoRoughByAgentId(agentid);
				houseList = houseService.getHouseInfoRoughByAgentId(agentid,currentPage);
				for(House house:houseList){
			%>
					<div class="col-md-4">
						<div class="fh5co-blog animate-box">
							<a href="detail.jsp?houseid=<%=house.getId()%>"><img class="img-responsive"
								src="../<%=house.getOnePicAdd() %>" alt=""></a>
							<div class="title text-center">
								<span class="posted-on"><%=house.getH_address()%></span>
								<h3>
									<a href="#"><%=house.getName() %></a>
								</h3>
								<span class="category">villa</span>
								</a></span>
								
							</div>
							
						</div>
					</div>
<%} %>

<%
//HouseInfoService houseService=new HouseInfoService();

PageHelper pagebar=new PageHelper(currentPage,houseService.PAGESIZE,recordCount);
int beginPageIndex=pagebar.getBeginPageIndex();
int endPageIndex=pagebar.getEndPageIndex();
String pageString="";
String action=request.getParameter("action");
for(int i=beginPageIndex;i<=endPageIndex;i++){
	if(i==currentPage)
	{
		pageString+="<a href='AgentHouse.jsp?currentPage="+i+"'><font color='#fb5353'>"+i+"</font></a> &nbsp;";
	}
	else
	{
	pageString+="<a href='AgentHouse.jsp?currentPage="+i+"'>"+i+"</a>";
	}
}
%>
<center><span>共<%=pagebar.getPageCount() %>页 , 当前第<font color="#fb5353"><%=currentPage %></font>页&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>  
<span><%=pageString %></span>
</center>
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

