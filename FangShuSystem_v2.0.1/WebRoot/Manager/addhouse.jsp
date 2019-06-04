<%@page import="cn.sdcet.project.domain.AgentInfo" errorPage="../Error/error.jsp"%>
<%@page import="cn.sdcet.project.service.AgentInfoService"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

<!DOCTYPE HTML>
<html>
	<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">




	<title>添加房屋信息</title>
	<link rel="shortcut icon" href="images/iconvilla.png" type="image/x-icon">


	

	

	<link href="https://fonts.googleapis.com/css?family=Josefin+Slab:400,600,700" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css?family=Sacramento" rel="stylesheet">
	
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
		function checknull(id,hidid){
			var values=document.getElementById(id).value.toString();
			if(values==""){
				document.getElementById(hidid).style.display="block";
				return false;
				}
			else{
				document.getElementById(hidid).style.display="none";
				return true;
				}
			}
		
		function checknum(id,hidid,hididnum){
			var check=checknull(id,hidid);
			if(check){
				var values=document.getElementById(id).value.toString();
				if(!(/^[0-9]*$/.test(values))){
					document.getElementById(hididnum).style.display="block";
					return false;
				}
				else{
					document.getElementById(hididnum).style.display="none";
					return true;
				}
			}
			
			
		}
		
	
		function clickpointbtn(){
			var check1=checknull("housename","hidhousename");
			var check2=checknull("addressdet","hidaddressdet");
			var check3=checknum("price","hidprice","hidpricenum");
			var check4=checknum("area","hidarea","hidareanum");
			var check5=checknum("firstpay","hidfp","hidfpnum");
			if(check1&&check2&&check3&&check4&&check5){
				addhouse.submit();
			}else{
				alert("输入结果不对");
			}
			
		}
	
    </script>
	
	
	
	
	
	<%
		List<AgentInfo> listAgent = new ArrayList<AgentInfo>();
		AgentInfoService agentService = new AgentInfoService();
		listAgent = agentService.selectAgentId();
	%>
	
	

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
				<div class="col-md-6 col-md-offset-3 text-center fh5co-heading">
					<h2><span>添加房屋信息</span></h2>
				</div>
			</div>
			
			
			
			<div class="row" style="margin:auto;">
				<div class="col-md-6 col-md-offset-3">
					<div class="fh5co-staff">
					
					<%
					String msg=request.getParameter("info");
					if("2".equals(msg)){
					%>
					<div class="alert alert-danger" style="width:550px;">添加房屋信息成功！</div>
					<%}%>
					
					
					<form action="../AddHouseInfo" id="addhouse" method="post">
                    
                    
                    
						<div class="form-group row">
							<div class="col-md-6 field">
								<div class="divtitlename">房屋名称：</div>
								<span>
									<input type="text" name="housename" id="housename" class="form-control input-infowidth" onblur="checknull('housename','hidhousename')">
								</span>
								<div id="hidhousename" class="hiddenword">*房屋名称不能为空</div>
							</div>
						</div>
                        <div class="form-group row">
							<div class="col-md-6 field">
								<div class="divtitlename">房屋所在地：</div>
                                <select id="address" name="address" class="selectpicker show-tick form-control input-infowidth" >
                                	<option value="北京">北京</option>
                                    <option value="上海">上海</option>
			                        <option value="天津">天津</option>
			                        <option value="重庆 ">重庆</option>
			                        <option value="黑龙江">黑龙江</option>
			                        <option value="吉林">吉林</option>
			                        <option value="辽宁">辽宁</option>
			                        <option value="河北">河北</option>
			                        <option value="河南">河南</option>
			                        <option value="山东">山东</option>
			                        
			                        <option value="山西">山西</option>
			                        <option value="湖南">湖南</option>
			                        <option value="湖北">湖北</option>
			                        <option value="安徽">安徽</option>
			                        <option value="江苏">江苏</option>
			                        <option value="浙江">浙江</option>
			                        
			                        <option value="福建">福建</option>
			                        <option value="江西">江西</option>
			                        <option value="广东">广东</option>
			                        <option value="海南">海南</option>
			                        <option value="贵州">贵州</option>
			                        <option value="云南">云南</option>
			                        
			                        <option value="四川">四川</option>
			                        <option value="陕西">陕西</option>
			                        <option value="青海">青海</option>
			                        <option value="甘肃">甘肃</option>
			                        <option value="台湾">台湾</option>
			                        <option value="香港">香港特别行政区</option>
			                        <option value="澳门">澳门特别行政区</option>
			                    </select>
							</div>
						</div>
						<div class="form-group row">
							<div class="col-md-6 field">
								<div class="divtitlename">详细地址：</div>
								<input type="text" name="addressdet" id="addressdet" class="form-control input-infowidth" onblur="checknull('addressdet','hidaddressdet')">
								<div id="hidaddressdet" class="hiddenword">*详细地址不能为空</div>
							</div>
						</div>
                        <div class="form-group row">
							<div class="col-md-6 field">
								<div class="divtitlename">价格：</div>
								<input type="text" name="price" id="price" class="form-control input-infowidth" onblur="checknum('price','hidprice','hidpricenum')">
								<div id="hidprice" class="hiddenword">*价格不能为空</div>
								<div id="hidpricenum" class="hiddenword">*价格必须为数字</div>
							</div>
						</div>
                        <div class="form-group row">
							<div class="col-md-6 field">
								<div class="divtitlename">户型：</div>
								<input type="text" name="housetype" id="housetype" class="form-control input-infowidth">
							</div>
						</div>
                        <div class="form-group row">
							<div class="col-md-6 field">
								<div class="divtitlename">面积：</div>
								<input type="text" name="area" id="area" class="form-control input-infowidth" onblur="checknum('area','hidarea','hidareanum')">
								<div id="hidarea" class="hiddenword">*房屋面积不能为空</div>
								<div id="hidareanum" class="hiddenword">*房屋面积必须为数字</div>
							</div>
						</div>
						<div class="form-group row">
							<div class="col-md-6 field">
								<div class="divtitlename">首付：</div>
								<input type="text" name="firstpay" id="firstpay" class="form-control input-infowidth" onblur="checknum('firstpay','hidfp','hidfpnum')">
								<div id="hidfp" class="hiddenword">*首付不能为空</div>
								<div id="hidfpnum" class="hiddenword">*首付必须为数字</div>
							</div>
						</div>
						
						
						
                        <div class="form-group row">
							<div class="col-md-6 field">
								<div class="divtitlename">代理人编号：</div>
								<select id="agentid" name="agentid" class="selectpicker show-tick form-control input-infowidth" >
                                	<%for(AgentInfo agent:listAgent){ %>
                                	<option value="<%=agent.getId()%>"><%=agent.getAgentId().getId()%></option>
                                	<%} %>
			                    </select>
							</div>
						</div>
						
						<div class="form-group row">
							<div class="col-md-6 field">
								<div class="divtitlename">图片上传：</div>
								<input type="text" name="uploadimg" id="uploadimg" class="form-control input-infowidth">
							</div>
						</div>
                        <div class="form-group row">
							<div class="col-md-6 field">
								<div class="divtitlename">建成时间：</div>
								<input type="text" name="time" id="time" class="form-control input-infowidth">
							</div>
						</div>
                        <div class="form-group row">
							<div class="col-md-6 field">
								<div class="divtitlename">小区设施：</div>
								<input type="text" name="resfac" id="resfac" class="form-control input-infowidth">
							</div>
						</div>
                        <div class="form-group row">
							<div class="col-md-6 field">
								<div class="divtitlename">装修程度：</div>
								<input type="text" name="decdeg" id="decdeg" class="form-control input-infowidth">
							</div>
						</div>
                        <div class="form-group row">
							<div class="col-md-6 field">
								<div class="divtitlename">服务介绍：</div>
								<input type="text" name="serviceintro" id="serviceintro" class="form-control input-infowidth">
							</div>
						</div>
                        <div class="form-group row">
							<div class="col-md-6 field">
								<div class="divtitlename">核心卖点：</div>
								<input type="text" name="corepoint" id="corepoint" class="form-control input-infowidth">
							</div>
						</div>
                        <div class="form-group row">
							<div class="col-md-6 field">
								<div class="divtitlename">描述：</div>
								<textarea rows="3" cols="20" name="describe" id="describe" class="form-control input-infowidth"></textarea>
							</div>
						</div>
						<div class="form-group row">
							<div class="col-md-12 field">
								<input type="button" id="subadd" class="btn btn-primary" value="添加" onclick="clickpointbtn()">
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
						<small class="block">&copy; 2019 FangJingxi&amp;YinZichen All Rights Reserved</small>
					</p>
				</div>
			</div>

		</div>
	</footer>
	</div>

	<div class="gototop js-top">
		<a href="#" class="js-gotop"><i class="icon-arrow-up"></i></a>
	</div>
	
	

	</body>
</html>
