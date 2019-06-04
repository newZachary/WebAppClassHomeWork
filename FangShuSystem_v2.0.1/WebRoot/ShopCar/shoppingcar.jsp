<%@ page language="java" import="java.util.*" pageEncoding="utf-8" errorPage="Error/error.jsp"%>
<% request.setCharacterEncoding("UTF-8"); %>
<%@ page language="java" import="cn.sdcet.project.service.*"%>
<%@ page language="java" import="cn.sdcet.project.domain.House"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<link rel="stylesheet" type="text/css" href="css/shoppingcart.css" /><link href="https://fonts.googleapis.com/css?family=Josefin+Slab:400,600,700" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css?family=Sacramento" rel="stylesheet">
	<link rel="stylesheet" href="css/animate.css">
	<link rel="stylesheet" href="css/icomoon.css">
	<link rel="stylesheet" href="css/bootstrap.css">
	<link rel="stylesheet" href="css/magnific-popup.css">
	<link rel="stylesheet" href="css/flexslider.css">
	<link rel="stylesheet" href="css/style.css">
	<script src="js/modernizr-2.6.2.min.js"></script>
	<script src="js/jquery.min.js"></script>
	<script src="js/jquery.easing.1.3.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/jquery.waypoints.min.js"></script>
	<script src="js/jquery.flexslider-min.js"></script>
	<script src="js/jquery.magnific-popup.min.js"></script>
	<script src="js/magnific-popup-options.js"></script>
	<script src="js/main.js"></script>
<%
	List<House> listHouse=new ArrayList<House>();
	Object id=session.getAttribute("username");
	int userid;
	
		if(id==null){
			response.sendRedirect("../LoginOut/login.jsp?returnUrl="+request.getRequestURI());
		}else{
			ShopCarService shopCar=new ShopCarService();
			userid=Integer.valueOf(session.getAttribute("userid").toString());
			listHouse=shopCar.getShopCar(userid);
		}
		int i=0;
	%>

<script type="text/javascript">
	function checkboxall(){
		if(checkall.checked){
			
			for( var j=0;j<i;j++){
			$("checkbox"+i).checked=true;
			}
			
		}
		else{
			for( var j=0;j<i;j++){
				$("checkbox"+i).checked=false;
				}
			
			}
		}
	
	
</script>



<title>购物车</title>
<link rel="shortcut icon" href="images/iconvilla.png" type="image/x-icon">
</head>

	

<body>
	<div id="divframe">
		<nav class="fh5co-nav" role="navigation">
		<div class="container-fluid">
			<div class="row">
				<div class="top-menu">
					<div class="container">
						<div class="row">
							<div class="col-sm-7 text-left menu-1">
								<ul>
									<li><a href="../FirstFront/index.jsp" class="topa">首页</a></li>
									<li><a href="../MapSearch/map.jsp" class="topa">搜索地图</a></li>
									<li><a href="../loginout">注销</a></li>
								</ul>
							</div>
							<div class="col-sm-5">
								<ul class="fh5co-social-icons">
									<li><a href="#"><i class="icon-twitter-with-circle"></i></a></li>
									<li><a href="#"><i class="icon-facebook-with-circle"></i></a></li>
									<li><a href="#"><i class="icon-linkedin-with-circle"></i></a></li>
									<li><a href="#"><i class="icon-dribbble-with-circle"></i></a></li>
								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>
			
		</div>
	</nav>
        
        
        <div id="fh5co-contact" class="fh5co-no-pd-top">
		<div class="container" style="padding:0px;">
			<div class="row animate-box" style="margin-top:50px;margin-left:0px;margin-right:0px;">
				<div class="col-md-12 col-md-offset-0 text-center fh5co-heading">
					<h2><span style="font-family:'微软雅黑'">我的购物车</span></h2>
				</div>
			</div>
			
            <div class="row" style="width:100%;">
				
                
                
                
                
                
           
        
    	<div id="shopcarinfo">
            <div id="mainmiddle" style="width:100%">
                <form method="post">
        		<!-- <div id="divbtnchoice">
                    	<div style="margin-top:30px;margin-left:20px;">
                    		<label><input type="checkbox" id="checkall" onclick="checkboxall()" />全选</label>
                    	</div>
            	</div> -->
                <div id="divtable">
                
                	<table border="1" cellspacing="0" frame="hsides" rules="none" style="margin:auto;width:100%;">
                    	<tr class="trone" style="text-align:center;background-color:rgb(251,242,235);color:#333;">
                        	<td>&nbsp;</td>
                        	<td>图片</td>
                        	<td>房屋名称</td>
                        	<td>位置</td>
                        	<td>价格</td>
                        	<td>&nbsp;</td>
                        </tr>
                        <%  for(House house:listHouse){
                        	
                        	%>
                        	
                        	<tr class="trone">
                        	<td style="text-align:center;width:100px;"><input type="checkbox" id="checkbox<%=i %>" class="checkbox1" /></td>
                        	<td class="tdimg">
                            	<a href="producedetail.html"><img src="<%=house.getOnePicAdd() %>" class="tabimg"/></a>
                            </td>
                        	<td class="tdword"><a href="producedetail.html"><%=house.getName() %></a></td>
                        	<td class="tdnumber">
                        		<span><%=house.getH_address() %></span>
                            </td>
                        	<td class="tdmoney"><b><%=house.getPrice() %></b>
                        	<input type="hidden" name="houseid" value="<%=house.getId()%>"/>
                        	</td>
                        	<td class="tdcompile"><input type="button" name="delthing" onclick="window.location.href='../delthing?houseid=<%=house.getId()%>'" value="删除" class="delthing" /></td>
                        </tr>
                       <%
                       i++;
                       }%>
                      
                    	
                    </table>
                
                    
                </div>
                <div>
                	<input type="button" name="clearshop" value="结算购物车" class="submitclear" />
                </div>
                </form>
            </div>
        </div>
                
                
                
                
				
				

			</div>
		</div>
	</div>
        
    	
        
    	<div class="row copyright" style="margin:0px;">
				<div class="col-md-12 text-center">
					<p>
						<small class="block">&copy; 2017 ZhangFang&amp;YinZichen All Rights Reserved</small>
					</p>
					<p>
						<ul class="fh5co-social-icons">
							<li><a href="#"><i class="icon-twitter"></i></a></li>
							<li><a href="#"><i class="icon-facebook"></i></a></li>
							<li><a href="#"><i class="icon-linkedin"></i></a></li>
							<li><a href="#"><i class="icon-dribbble"></i></a></li>
						</ul>
					</p>
				</div>
		</div>
    </div>
</body>
</html>
