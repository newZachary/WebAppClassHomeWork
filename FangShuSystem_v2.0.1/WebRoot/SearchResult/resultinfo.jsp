<%@ page language="java" import="java.util.*" pageEncoding="utf-8" %>
<!-- errorPage="Error/error.jsp" -->
<%@ page language="java" import="cn.sdcet.project.util.PageHelper"%>
<%@ page language="java" import="cn.sdcet.project.service.HouseInfoService"%>
<%@ page language="java" import="cn.sdcet.project.domain.House"%>
<%@ page contentType="text/html; charset=utf8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML>
<html>
<head>
  <base href="<%=basePath%>">
    
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1" />
<meta charset="utf-8">
<!-- Description, Keywords and Author -->
<meta name="description" content="">
<meta name="author" content="">
<title>搜索结果页面</title>
<link rel="shortcut icon" href="SearchResult/images/iconvilla.png" type="image/x-icon">
<!-- style -->
<link href="SearchResult/css/style.css" rel="stylesheet" type="text/css">
<!-- style -->
<!-- bootstrap -->
<link href="SearchResult/css/bootstrap.min.css" rel="stylesheet" type="text/css">
<link rel="stylesheet"
	href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
<!-- responsive -->
<link href="SearchResult/css/responsive.css" rel="stylesheet" type="text/css">
<!-- font-awesome -->
<link href="SearchResult/css/font-awesome.min.css" rel="stylesheet" type="text/css">
<!-- font-awesome -->
<link href="SearchResult/css/effects/set2.css" rel="stylesheet" type="text/css">
<link href="SearchResult/css/effects/normalize.css" rel="stylesheet" type="text/css">
<link href="SearchResult/css/effects/component.css" rel="stylesheet" type="text/css">
<!-- 这是头部需要引用的东西 -->
<!-- Bootstrap  -->
<link rel="stylesheet" href="Merry/css/bootstrap.css">
<!-- Superfish -->
<link rel="stylesheet" href="Merry/css/superfish.css">
<link rel="stylesheet" href="Merry/css/style.css">
<script src="Merry/dist/scripts.min.js"></script>

<!-- 这是向上的箭头需要引用的东西 -->
<!-- Icomoon Icon Fonts-->
<link rel="stylesheet" href="DetailInfo/css/icomoon.css">
<!-- Theme style  -->
<link rel="stylesheet" href="DetailInfo/css/style.css">
<!-- jQuery -->
<script src="DetailInfo/js/jquery.min.js"></script>
<!-- jQuery Easing -->
<script src="DetailInfo/js/jquery.easing.1.3.js"></script>
<!-- Waypoints -->
<script src="DetailInfo/js/jquery.waypoints.min.js"></script>
<!-- Flexslider -->
<script src="DetailInfo/js/jquery.flexslider-min.js"></script>
<!-- Main -->
<script src="DetailInfo/js/main.js"></script>
<script
	src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
<script
	src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<script type="text/javascript">
	function subFunc(action){
		var question=document.getElementById("question").value;
		var address=document.getElementById("address").value;
		window.location.href="SearchHouse?action="+action+"&question="+question+"&address="+address+"&currentpage=1";
	}
	function subFuncPage(action,currentPage){
	
		var address=document.getElementById("address").value;
		
		var question=document.getElementById("questionHidden").value;
	
		window.location.href="SearchHouse?action="+action+"&question="+question+"&address="+address+"&currentpage="+currentPage;
	}
	</script>
</head>



<body>
	<!------------------------------------------------获取房源信息开始--------------------------------------------------------------->
	<%
							List<House> houseList = new ArrayList<House>();
							houseList = (List<House>) request.getAttribute("houseList");%>
	<!------------------------------------------------获取房源信息结束--------------------------------------------------------------->
<jsp:include page="../Merry/index.jsp" flush="false"></jsp:include>


	<div id="fh5co-wrapper">
		<div id="fh5co-page">
			
			
			
			
			<!-- main -->
			<main role="main-home-wrapper" class="container">
		
			<div class="row">
			
				<%
							if (houseList.size() == 0) {
						%>
						<section class="col-xs-12 col-sm-6 col-md-6 col-lg-6 "
					style="margin-bottom:50px;">
					<article role="pge-title-content">
						<header style="padding-top:20px;padding-bottom:0px;">
							<h2 style="height:50px;">
							<span>还没有符合条件的别墅呢~</span>
						</header>

					</article>

				</section>
								
	
	<%
							}else{
								
								%>
								
								<section class="col-xs-12 col-sm-6 col-md-6 col-lg-6 "
					style="margin-bottom:50px;">
					<article role="pge-title-content">
						<header style="padding-top:20px;padding-bottom:0px;">
							<h2 style="height:50px;">
								<span>嗖~为您查到<%=houseList.size() %>条数据</span>
						</header>

					</article>

				</section>
								
								<%
							}
						%>
			
				


				<!------------------------------------------------查询--------------------------------------------------------------->


				<form class="bs-example bs-example-form" role="form"
					action="SearchHouse">
					<input type="hidden" id="address" name="address" value="<%=request.getParameter("address")%>">
					<div class="row">
						<div class="col-lg-6">
							<div class="input-group"
								style="float:right;width:330px;margin-top:50px">
								<input id="question" name="question" type="text" class="form-control"
									style="height:40px; width:300px">
								<div class="input-group-btn">
									<button type="button" class="btn btn-default dropdown-toggle"
										data-toggle="dropdown">
										查找 <span class="caret"></span>
									</button>
									<ul class="dropdown-menu pull-right">
										<li><a href="javascript:subFunc(2)">按照名称查找</a></li>
										<li><a href="javascript:subFunc(3)">按照面积查找</a></li>
										<li><a href="javascript:subFunc(4)">按照地址查找</a></li>
										<li class="divider"></li>
										<li><a href="javascript:subFunc(5)">按照代理人查找</a></li>
									</ul>
								</div>
								<!-- /btn-group -->
							</div>
							<!-- /input-group -->
						</div>
					</div>
				</form>



				<!------------------------------------------------查询结束--------------------------------------------------------------->

<!--------------------------------------------------显示房源信息---------------------------------------------------------------->
<%if(houseList.size() !=0){ %>
				<!------------------------左边列-------------------------->

				<section class="col-xs-12 col-sm-6 col-md-6 col-lg-6 grid">
					<ul class="grid-lod effect-2" id="grid">
					
						<%
						
							for (int i=0; i <=(int) Math.floor((double)houseList.size() / 2) ; i++) {
						%>
						<li>
							<figure class="effect-oscar">
								<img src="<%=houseList.get(i).getOnePicAdd()%>" alt=""
									class="img-responsive" />
								<figcaption>
									<h2><%=houseList.get(i).getName()%></h2>
									<p>
									价格：<%=houseList.get(i).getPrice()%></p>
									<span><%=houseList.get(i).getArea()%></span>平方米 <br> <span><%=houseList.get(i).getHousetype()%></span>
									<a
										href="DetailInfo/detail.jsp?houseid=<%=houseList.get(i).getId()%>">View
										more</a>
								</figcaption>
							</figure>
						</li>
						<%
							}
						%>





					</ul>

				</section>
			



				<!------------------------右边列-------------------------->
				<section class="col-xs-12 col-sm-6 col-md-6 col-lg-6 grid">

					<ul class="grid-lod effect-2" id="grid">


						<%  
							for (int i =(int) Math.ceil((double)houseList.size() / 2) ; i < houseList.size(); i++) {
						%>
						<li>
							<figure class="effect-oscar">
								<img src="<%=houseList.get(i).getOnePicAdd()%>" alt=""
									class="img-responsive" />
								<figcaption>
								<h2><%=houseList.get(i).getName()%></h2>
									<p>
									价格：<%=houseList.get(i).getPrice()%></p>
									<span><%=houseList.get(i).getArea()%></span>平方米 <br> <span><%=houseList.get(i).getHousetype()%></span>
									<a
										href="DetailInfo/detail.jsp?houseid=<%=houseList.get(i).getId()%>">View
										more</a>
								</figcaption>
							</figure>
						</li>
						<%
							}
						%>





					</ul>

				</section>
			


				
				
				<%} %>
			
<input type="hidden" name="questionHidden" id="questionHidden" value="<%=request.getAttribute("question")%>">


				<!--------------------------------------------------显示房源信息终止-------------------------------------------------------------->
<%
HouseInfoService houseService=new HouseInfoService();
int currentPage=Integer.parseInt(request.getParameter("currentpage"));
int recordCount=Integer.parseInt(request.getAttribute("recordCount").toString());
PageHelper pagebar=new PageHelper(currentPage,houseService.PAGESIZE,recordCount);
int beginPageIndex=pagebar.getBeginPageIndex();
int endPageIndex=pagebar.getEndPageIndex();
String pageString="";
String action=request.getParameter("action");
for(int i=beginPageIndex;i<=endPageIndex;i++){
	if(i==currentPage)
	{
		pageString+="<a href='javascript:subFuncPage("+action+","+i+")'><font color='#fb5353'>"+i+"</font></a> &nbsp;";
	}
	else
	{
	pageString+="<a href='javascript:subFuncPage("+action+","+i+")'>"+i+"</a>  ";
	}
}
%>
<center><span>共<%=pagebar.getPageCount() %>页 , 当前第<font color=""><%=currentPage %></font>页&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>  
<span><%=pageString %></span>
</center>

<!-- ---------------------------------显示页码 ----------------------------------------->






<!-- ---------------------------------显示页码 结束----------------------------------------->


				

			</div>

			</main>

			<!-- main -->

			<!-- footer -->
			<footer role="footer">

				<!-- logo -->

				<h1>

					<a href="index.html"
						style="width:200px;text-decoration:none;text-align:center;"
						title="Villa-尽你所想"> <span
						style="font-size:36px;color:#666">Villa</span>
					</a>

				</h1>

				<!-- logo -->

				<!-- nav -->

				<nav role="footer-nav">

					<ul>


						<!-----------------------------------------------------修改网页链接--------------------------------------------------------------->



						
						
						<li><a href="FirstFront/index.jsp">关于我们(首页查找)</a></li>

						<li><a href="MapSearch/map.jsp" >返回地图</a></li>

						<li><a href="FirstFront/index.jsp">返回首页</a></li>


						<!----------------------------------------------------修改网页链接结束------------------------------------------------------------->


					</ul>

				</nav>

				

				<p class="copy-right">&copy; 2019 FangshuProject Design. All rights Resved.</p>
				<p class="copy-right">&mdash; Design from FangJingxi & YinZichen</p>

			</footer>

			<!-- footer -->
			<jsp:include page="../DetailInfo/bottom.jsp"></jsp:include>

		</div>
	</div>
	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->

	<script src="SearchResult/js/jquery.min.js" type="text/javascript"></script>

	<!-- custom -->

	<script src="SearchResult/js/nav.js" type="text/javascript"></script>

	<script src="SearchResult/js/custom.js" type="text/javascript"></script>

	<!-- Include all compiled plugins (below), or include individual files as needed -->

	<script src="SearchResult/js/bootstrap.min.js" type="text/javascript"></script>

	<script src="SearchResult/js/effects/masonry.pkgd.min.js" type="text/javascript"></script>

	<script src="SearchResult/js/effects/imagesloaded.js" type="text/javascript"></script>

	<script src="SearchResult/js/effects/classie.js" type="text/javascript"></script>

	<script src="SearchResult/js/effects/AnimOnScroll.js" type="text/javascript"></script>

	<script src="SearchResult/js/effects/modernizr.custom.js"></script>

	<!-- jquery.countdown -->

	<script src="SearchResult/js/html5shiv.js" type="text/javascript"></script>

</body>

</html>