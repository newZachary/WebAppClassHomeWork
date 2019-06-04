<%@ page language="java" import="java.util.*" pageEncoding="utf-8" %>
<%@ page language="java" import="cn.sdcet.project.web.Listener"%>
<%@ page language="java" import="cn.sdcet.project.service.HouseInfoService"%>
<%@ page language="java" import="cn.sdcet.project.domain.House"%>
<%@ page language="java" import="cn.sdcet.project.service.ConfService"%>

<html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Villa &mdash; 尽你所想</title>
    <link rel="shortcut icon" href="images/iconvilla.png" type="image/x-icon">
	<link rel="shortcut icon" href="favicon.ico">
	<link href="https://fonts.googleapis.com/css?family=Inconsolata:400,700" rel="stylesheet">
	<link rel="stylesheet" href="css/animate.css">
	<link rel="stylesheet" href="css/icomoon.css">
	<link rel="stylesheet" href="css/simple-line-icons.css">
	<link rel="stylesheet" href="css/bootstrap.css">
	<link rel="stylesheet" href="css/style.css">
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css" integrity="sha384-oS3vJWv+0UjzBfQzYUhtDYW+Pj2yciDJxpsK1OYPAYjqT085Qq/1cq5FLXAZQ7Ay" crossorigin="anonymous">
	<script src="js/modernizr-2.6.2.min.js"></script>
	<script src="js/jquery.min.js"></script>
	<script src="js/jquery.easing.1.3.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/jquery.waypoints.min.js"></script>
	<script src="js/jquery.stellar.min.js"></script>
	<script src="js/jquery.countTo.js"></script>
	<script src="js/main.js"></script>
	</head>
	<body>
	
	

	<section id="fh5co-home" data-section="home" style="background-image: url(images/full_image_1.jpg);" data-stellar-background-ratio="0.5">
		<div class="gradient"></div>
		<div class="container">
			<div class="text-wrap">
				<div class="text-inner">
					<div class="row">
						<div class="col-md-8 col-md-offset-2 text-center">
							<h1 class="to-animate">挑选一套别墅</h1>
							<h2 class="to-animate">
								开启您的精致生活<br> 
								100%&nbsp;&nbsp;让您满意&nbsp;&nbsp;&nbsp;准备好开始新的生活了吗？<br><br>
								<a href="../MapSearch/map.jsp" >进去逛逛</a>
								<a href="../LoginOut/login.jsp" >登录</a>
							</h2>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

	<section id="fh5co-services" data-section="services">
		<div class="fh5co-services">
			<div class="container">
				<div class="row">
					<div class="col-md-12 section-heading text-center">
						<h2 class="to-animate">与其等待未来，不如坐享繁华</h2>
						<div class="row">
							<div class="col-md-8 col-md-offset-2 subtext">
								<h3 class="to-animate">城市的岸泊，生活的小镇&nbsp;生活之美不缺少，在于发现&nbsp;情趣不在于奢华，在于精彩&nbsp;生活有了美感才值得思考</h3>
							</div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="core-features">
						<div class="grid2 to-animate" style="background-image: url(images/full_image_2.jpg);">
						</div>
						<div class="grid2">
							<div class="core-f">
								<div class="row">
									<div class="col-md-12">
										<div class="core">
											<i class="icon-cloud-download to-animate-2"></i>
											<div class="fh5co-post to-animate">
												<h3>种类充足</h3>
												<p>我们通过云端查找，为您精心挑选精品现房、二手房，无论是公寓还是别墅，我们都为您选择最适合的</p>
											</div>
										</div>
										<div class="core">
											<i class="icon-laptop to-animate-2"></i>
											<div class="fh5co-post to-animate">
												<h3>选择方便</h3>
												<p>通过PC端、手机移动端访问我们的网页，或者使用手机APP、微信公众号、微博查找到我们。我们竭诚为您服务</p>
											</div>
										</div>
										<div class="core">
											<i class="icon-gear to-animate-2"></i>
											<div class="fh5co-post to-animate">
												<h3>如何选择？</h3>
												<p>通过您选择的房源位置、房源类型、房源户型以及房源的价格为您找到满意的居所</p>
											</div>
										</div>
										<div class="core">
											<i class="icon-columns to-animate-2"></i>
											<div class="fh5co-post to-animate">
												<h3>专业</h3>
												<p>我们一直在做，正因为有您的肯定，我们不断前行，扎根20年只愿为您找到优质的房源</p>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div id="fh5co-counter-section" class="fh5co-counters">
					<div class="container">
						<div class="row to-animate">
							<div class="col-md-3 text-center">
							<%
							ConfService conf=new ConfService();
							int visitCount=conf.getVisitCountOfToday();
							
							%>
								<span class="fh5co-counter js-counter" data-from="0" data-to="<%=visitCount %>" data-speed="5000" data-refresh-interval="50"></span>
								<span class="fh5co-counter-label">访问人数</span>
							</div>
							<div class="col-md-3 text-center">
								<span class="fh5co-counter js-counter" data-from="0" data-to="234" data-speed="5000" data-refresh-interval="50"></span>
								<span class="fh5co-counter-label">今日预约</span>
							</div>
							<div class="col-md-3 text-center">
								<span class="fh5co-counter js-counter" data-from="0" data-to="6542" data-speed="5000" data-refresh-interval="50"></span>
								<span class="fh5co-counter-label">预约数量</span>
							</div>
							<div class="col-md-3 text-center">
							<%
							HouseInfoService houseService=new HouseInfoService();
							int housecount =houseService.getHouseCount();
							
							%>
								<span class="fh5co-counter js-counter" data-from="0" data-to="<%=housecount %>" data-speed="5000" data-refresh-interval="50"></span>
								<span class="fh5co-counter-label">房源数量</span>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
<!-----------------------------------------精品别墅展示--------------------------------------- -->
<%

List<House> fineHouseList= houseService.getFineHouse();

%>


	<section id="fh5co-explore" data-section="explore">
		<div class="container">
			<div class="row">
				<div class="col-md-12 section-heading text-center">
					<h2 class="to-animate">要么别买，要么别墅</h2>
					<div class="row">
						<div class="col-md-8 col-md-offset-2 subtext to-animate">
							<h3>以下是我们的诚挚推荐&nbsp;优质房源&nbsp;精品户型&nbsp;奢华不失优雅&nbsp;简单不失时尚&nbsp;一房入手&nbsp;天下尽为公园</h3>
						</div>
					</div>
				</div>
			</div>
		</div>
		
		<div class="fh5co-project">
			<div class="container">
				<div class="row">
				<%
				if(fineHouseList.size()>0){
				for(House house:fineHouseList){
				%>
					<div class="col-md-12 text-center">
						<div class="project-grid to-animate-2" style="background-image:  url(../<%=house.getOnePicAdd()%>);">
							<div class="desc">
								<h3><a href="../DetailInfo/detail.jsp?houseid=<%=house.getId()%>"><%=house.getName()%></a></h3>
								<span><%=house.getH_address()%></span>
							</div>
						</div>
					</div>
					<%}} %>
				</div>
			</div>	
		</div>
		
	</section>
	
    
   <!-----------------------------------------精品别墅展示结束--------------------------------------- --> 
    	
    

	<section id="fh5co-team" data-section="team">
		<div class="fh5co-team">
			<div class="container">
				<div class="row">
					<div class="col-md-12 section-heading text-center">
						<h2 class="to-animate">我们的开发团队</h2>
						
					</div>
				</div>
				<div class="row">
					<div class="col-md-2">
						
					</div>
					<div class="col-md-4">
						<div class="team-box text-center to-animate-2">
							<div class="user">
                            	<img class="img-reponsive" src="images/head_panda3.png" style="background:white" alt="呵">
                            </div>
							<h3>尹子琛 同学</h3>
							<span class="position">方墅系统开发人，柚子皮团队成员</span>
							<p><a href="../Resume/ygs.html">详情请点击</a></p>
							<p>山东师范大学信息科学与工程学院学生，从事软件开发:html,css,js,java,sql server等</p>
							<p>喜欢请打赏 ↓</p>
							<ul class="social-media">
								<li id="yzc1" data-toggle="tooltip" title="<img class='img-reponsive' src='images/payali_y.jpg' style='width:200px;'>">
									<i class="fab fa-alipay"></i>
								</li>
								
								<li id="yzc2" data-toggle="tooltip" title="<img class='img-reponsive' src='images/paywechat_y.png' style='width:200px;'>">
									<i class="fab fa-weixin"></i>
								</li>
							</ul>
						</div>
					</div>
					

					<div class="col-md-4">
						<div class="team-box text-center to-animate-2">
							<div class="user"><img class="img-reponsive" src="images/head.jpeg" alt="Roger Garfield"></div>
							<h3>方静熙 同学</h3>
							<span class="position">方墅系统开发人，柚子皮团队成员</span>
							<p><a href="../Resume/fjx.html">详情请点击</a></p>
							<p>山东师范大学信息科学与工程学院学生，从事软件开发:html,C#,java,数据库 等</p>
							<p>喜欢请打赏 ↓</p>
							<ul class="social-media">
								<li id="fjx1" data-toggle="tooltip" title="<img class='img-reponsive' src='images/payali_f.jpg' style='width:200px;'>">
									<i class="fab fa-alipay"></i>
								</li>
								
								<li id="fjx2" data-toggle="tooltip" title="<img class='img-reponsive' src='images/paywechat_f.jpg' style='width:200px;'>">
									<i class="fab fa-weixin"></i>
								</li>
							</ul>
						</div>
					</div>
					
					<div class="col-md-2">
						
					</div>
					
				</div>
			</div>
		</div>
	</section>

	<div class="getting-started getting-started-1">
		<div class="getting-grid" style="background-image:  url(images/full_image_1.jpg);">
			<div class="desc text-center">
				<h2>Beginning 开启...</h2>
				<p>在这里您可以选到最好的别墅, 我们也将为您提供最好的服务。这里有优质的别墅供您选择，选择别墅就来方墅 </p>
				<p><a href="../MapSearch/map.jsp" class="btn btn-primary">Let's Go !</a></p>
				<p><a href="../LoginOut/login.jsp" >Login </a></p>
			</div>
		</div>
	</div>

	<div id="fh5co-footer" role="contentinfo">
		<div class="container">
			<div class="row">
				<div class="col-md-4 to-animate">
					<h3 class="section-title">关于方墅</h3>
					<p>方墅一站式别墅服务平台后台采用JAVA编码，前台应用HTML+CSS+JS实现，实现了交互效果，符合需求。数据库采用微软SQL SERVER 2012作为开发工具，该系统能够实现在线查找房源信息，查看房源详细信息，预约购买房源，用户登录注册以及用户信息的修改等功能，还可以在后台管理，进行房屋添加，房屋信息修改，添加代理人等功能。</p>
					<p class="copy-right"> 2019   &copy; 版权归属   柚子皮  <br>
						 <br>&nbsp;&nbsp;&nbsp;开发者 : 方静熙 & 尹子琛
					</p>
				</div>
                

				<div class="col-md-4 to-animate">
					<h3 class="section-title">联系方式</h3>
					<ul class="contact-info">
						<li><i class="fa fa-map-marker"></i>山东师范大学长清湖校区<br>---山东省济南市长清区崮云湖街道大学路1号</li>
						<li><i class="fa fa-phone"></i>方静熙 : +86 123 4567 8901</li>
						<li><i class="fa fa-phone"></i>尹子琛 : +86 123 4567 8901</li>
						<li><i class="fab fa-github"></i><a href="#">www.ZFandYZC.com.cn</a></li>
					</ul>
					<h3 class="section-title">打赏方式</h3>
					<ul class="social-media">
						<li><p>见上 ↑</p></li>
					</ul>
				</div>
				<div class="col-md-4 to-animate">
					<h3 class="section-title">留言</h3>
					<form class="contact-form" name="msgform" id="msgform">
						<div class="form-group">
							<label for="name" class="sr-only">姓名</label>
							<input type="text" class="form-control" id="name" name="name" placeholder="您的姓名">
						</div>
						<div class="form-group">
							<label for="email" class="sr-only">邮箱</label>
							<input type="email" class="form-control" id="email" name="email" placeholder="您的邮箱">
						</div>
						<div class="form-group">
							<label for="message" class="sr-only">内容</label>
							<textarea class="form-control" id="message" name="message" rows="7" placeholder="写点啥？"></textarea>
						</div>
						<div class="form-group">
							<input type="button" id="btn-submit" class="btn btn-send-message btn-md" value="发送" onclick="send();">
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	
	<script>
		$(function () { $("#yzc1").tooltip({html : true });});
		$(function () { $("#yzc2").tooltip({html : true });});
		$(function () { $("#fjx1").tooltip({html : true });});
		$(function () { $("#fjx2").tooltip({html : true });});
		function send(){
			alert(123);
			var name=document.getElementById("name").value;
			var email=document.getElementById("email").value;
			var msg=document.getElementById("message").value;
			//alert(name,email,msg);
			
		}
		function submitajax(){
			
			$.ajax({
				url : '${pageContext.request.contextPath}/MsgServlet',
				type : 'post',//请求类型get或者post
				data :$('#msgform').serialize(),
				success : function(data) {//customer_dialog
					alert('发送成功');
					//location.reload(true);
				},
				error : function() {
					alert('ajax请求失败');
				}
			});
			
		}
	</script>

	</body>
</html>

