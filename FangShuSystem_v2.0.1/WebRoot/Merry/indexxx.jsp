<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<header id="fh5co-header-section" class="sticky-banner" style="background:#fbf2eb">
			<div class="container">
				<div class="nav-header" style="width:100%;min-width:500px;">
					
					<div style="width:250px;float:left;margin-top:20px;">
						<h1 id="fh5co-logo" >
							<a href="../FirstFront/index.jsp">
								<span style="font-family:'微软雅黑';color:#666;font-size:36px；">Villa </span>
								<span style="font-family:'微软雅黑';color:#666;font-size:20px">-尽你所想</span>
							</a>
						</h1>
					</div>
					<!-- START #fh5co-menu-wrap -->
						<div class="sf-menu" id="fh5co-primary-menu" style="width:300px;float:right;margin-top:35px;">
							<span><a href="../FirstFront/index.jsp" >主页</a></span>
							<span style="margin-left:10px;"><a href="../MapSearch/map.jsp" class="fh5co-sub-ddown">地图</a></span>
							<span style="margin-left:10px;" class="action"><a href="#" style="color:#F69D9D;">个人中心</a></span>
							<%
							Object username=session.getAttribute("username");
							if(username!=null)
							{%>
								<span style="margin-left:10px;"><a href="../loginout">注销</a></span>
								
								<%}else{%>
									<span style="margin-left:10px;"><a href="../LoginOut/login.jsp">登录</a></span>
								<%}%>
							
							<%
							Object isagent=session.getAttribute("isagent");
							if(isagent!=null&&Boolean.parseBoolean(isagent.toString()))
							{%>
								<li><a href="../DetailInfo/AgentHouse.jsp?currentPage=1">代理</a></li>
							<%}
							else{%>
								<li><a href="../DetailInfo/OrderHouse.jsp?currentPage=1">预约</a></li>
							<%}%>
							
						</div>
				</div>
			</div>
		</header>
