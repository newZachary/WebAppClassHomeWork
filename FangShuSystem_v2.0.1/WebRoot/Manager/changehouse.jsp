<%@page import="cn.sdcet.project.service.HouseDetailInfoService"%>
<%@page import="cn.sdcet.project.domain.HouseDetailInfo"%>
<%@page import="cn.sdcet.project.domain.House"%>
<%@page import="cn.sdcet.project.service.HouseInfoService"%>
<%@page import="cn.sdcet.project.domain.AgentInfo"%>
<%@page import="cn.sdcet.project.service.AgentInfoService"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8" errorPage="../Error/error.jsp"%>

<!DOCTYPE HTML>
<html>
	<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">




	<title>修改房屋信息</title>
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
			var subval = document.getElementById("updateinfo").value;
			var check1=checknull("housename","hidhousename");
			var check3=checknum("price","hidprice","hidpricenum");
			var judge;
			if(subval=="确认修改"){
				if(check1&&check3){
					document.getElementById("updateinfo").value="修改";
					document.getElementById("noupdateinfo").style.display="none";
					
					judge=true;
					updhouseinfo.submit();
				}
			}else{
				document.getElementById("updateinfo").value="确认修改";
				document.getElementById("noupdateinfo").style.display="block";
				judge=false;
				
			}
			document.getElementById("housename").disabled=judge;
			document.getElementById("housetype").disabled=judge;
			document.getElementById("price").disabled=judge;
			document.getElementById("resfac").disabled=judge;
			document.getElementById("decdeg").disabled=judge;
			document.getElementById("describe").disabled=judge;
		}
		
		function clickpointnobtn(){
			alert("主人这个地方你还没写呐");
		}
		
		
	
    </script>
	
	
	
	
	
	
	

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
    
    
    
    
    <%
    	HouseDetailInfo houseDet=new HouseDetailInfo();
    
    	String ids=request.getParameter("houseid");
    	int id=Integer.parseInt(ids);
    	HouseDetailInfoService userinfoService=new HouseDetailInfoService();
    	houseDet=userinfoService.getHouseInfoDetail(id);
    	
    %>
    
    

	<div id="fh5co-content" >
		<div class="container" style="margin:auto;">
			<div class="row animate-box" style="margin:auto;">
				<div class="col-md-6 col-md-offset-3 text-center fh5co-heading">
					<h2><span>修改房屋信息</span></h2>
				</div>
			</div>
			<div class="row" style="margin:auto;">
				<div class="col-md-6 col-md-offset-3">
					<div class="fh5co-staff">
					<form action="../UpdHouseInfo" id="updhouseinfo" method="post">
                  <input type="hidden" name="hiddenId" value="<%=id%>">
						<div class="form-group row">
							<div class="col-md-6 field">
								<div class="divtitlename">房屋名称：</div>
								<span>
									<input type="text" name="housename" id="housename" 
									class="form-control input-infowidth input-display" disabled="disabled"  
									onBlur="checknull('housename','hidhousename')" value="<%=houseDet.getHouse().getName()%>">
								</span>
								<div id="hidhousename" class="hiddenword">*房屋名称不能为空</div>
							</div>
						</div>
						 <div class="form-group row">
							<div class="col-md-6 field">
								<div class="divtitlename">户型：</div>
								<input type="text" name="housetype" id="housetype" 
								class="form-control input-infowidth" disabled="disabled" 
								value="<%=houseDet.getHouse().getHousetype()%>">
							</div>
						</div>
						  <div class="form-group row">
							<div class="col-md-6 field">
								<div class="divtitlename">价格：</div>
								<input type="text" name="price" id="price" 
								class="form-control input-infowidth" disabled="disabled" 
								onBlur="checknum('price','hidprice','hidpricenum')" value="<%=houseDet.getHouse().getPrice()%>">
								<div id="hidprice" class="hiddenword">*价格不能为空</div>
								<div id="hidpricenum" class="hiddenword">*价格必须为数字</div>
							</div>
						</div>
						 <div class="form-group row">
							<div class="col-md-6 field">
								<div class="divtitlename">小区设施：</div>
								<input type="text" name="resfac" id="resfac" 
								class="form-control input-infowidth" disabled="disabled" 
								value="<%=houseDet.getResfac()%>">
							</div>
						</div> 
						  <div class="form-group row">
							<div class="col-md-6 field">
								<div class="divtitlename">装修程度：</div>
								<input type="text" name="decdeg" id="decdeg" 
								class="form-control input-infowidth" disabled="disabled" 
								value="<%=houseDet.getDecdeg()%>">
							</div>
						</div>          
                        <div class="form-group row">
							<div class="col-md-6 field">
								<div class="divtitlename">描述：</div>
								<textarea rows="3" cols="20" name="describe" id="describe" 
								class="form-control input-infowidth" disabled="disabled" 
								value="<%=houseDet.getDescribe()%>"></textarea>
							</div>
						</div>
						<div class="form-group row">
							<div class="col-md-12 field">
								<table>
									<tr>
										<td>
											<input type="button" id="updateinfo" class="btn btn-primary" value="修改" onClick="clickpointbtn()">
										</td>
										<td>
											<a id="noupdateinfo" class="btn btn-primary" href="lookhouse.jsp" style="display:none;">取消修改</a>
										</td>
									</tr>
								</table>
								
								
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
						<small class="block">&copy; 2017 JavaWeb and Oracle All Rights Reserved. Design By - ZhangFang and YinZichen</small>
					</p>
				</div>
			</div>

		</div>
	</footer>
	
	

	<div class="gototop js-top">
		<a href="#" class="js-gotop"><i class="icon-arrow-up"></i></a>
	</div>
	
	

	</body>
</html>
