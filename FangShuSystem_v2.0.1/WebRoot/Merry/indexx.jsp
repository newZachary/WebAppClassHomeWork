<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<header id="fh5co-header-section" class="sticky-banner" style="background:#fbf2eb">
			<div class="container">
				<div class="nav-header">
					
					<h1 id="fh5co-logo" ><a href="../FirstFront/index.jsp"><span style="font-family:'微软雅黑';color:#666;font-size:36px；">Villa </span><span style="font-family:'微软雅黑';color:#666;font-size:20px">-尽你所想</span></a></h1>
					<!-- START #fh5co-menu-wrap -->
					<nav id="fh5co-menu-wrap" role="navigation">
						<ul class="sf-menu" id="fh5co-primary-menu">
							<li><a href="../FirstFront/index.jsp" >主页</a></li>
							<li><a href="../MapSearch/map.jsp" class="fh5co-sub-ddown">地图</a></li>
							<li><a href="../DetailInfo/about.jsp">个人中心</a></li>
							<%
							Object username=session.getAttribute("username");
							if(username!=null)
							{%>
								<li><a href="../loginout">注销</a></li>
								
								<%}else{%>
									<li><a href="../LoginOut/login.jsp">登录</a></li>
								<%}%>
							
							<%
							Object isagent=session.getAttribute("isagent");
							if(isagent!=null&&Boolean.parseBoolean( isagent.toString()))
							{%>
								<li><a href="../DetailInfo/AgentHouse.jsp?currentPage=1">代理</a></li>
							<%}
							else{%>
								<li><a href="../DetailInfo/OrderHouse.jsp?currentPage=1">预约</a></li>
							<%}%>
							
						</ul>
					</nav>
				</div>
			</div>
		</header>
