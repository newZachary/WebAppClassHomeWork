<%@page import="cn.sdcet.project.domain.UserInfo"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<%@ page language="java"
	import="cn.sdcet.project.service.AgentInfoService"%>
<%@ page language="java"
	import="cn.sdcet.project.service.UserInfoService"%>
<%@page import="cn.sdcet.project.domain.AgentInfo" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="Dashboard">
    <meta name="keyword" content="Dashboard, Bootstrap, Admin, Template, Theme, Responsive, Fluid, Retina">

    <title>方墅-后台管理系统</title>

    <!-- Bootstrap core CSS -->
    <link href="assets/css/bootstrap.css" rel="stylesheet">
    <!--external css-->
    <link href="assets/font-awesome/css/font-awesome.css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="assets/css/bootstrap-daterangepicker/bootstrap-datetimepicker.min.css" />
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css" crossorigin="anonymous">
    <!-- Custom styles for this template -->
    <link href="assets/css/style.css" rel="stylesheet">
    <link href="assets/css/style-responsive.css" rel="stylesheet">
    <link href="assets/css/highlight.css" rel="stylesheet">
	<link href="https://cdn.bootcss.com/bootstrap-switch/3.3.4/css/bootstrap3/bootstrap-switch.css" rel="stylesheet">
	<link href="https://getbootstrap.com/assets/css/docs.min.css" rel="stylesheet">
	<link href="assets/css/switch-main.css" rel="stylesheet"></head>
    


    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
  </head>

  <body>

  <section id="container" >
      <!-- **********************************************************************************************************************************************************
      TOP BAR CONTENT & NOTIFICATIONS
      *********************************************************************************************************************************************************** -->
      <!--header start-->
      <jsp:include page="header.jsp" flush="false"></jsp:include>
      <!--header end-->
      
      <!-- **********************************************************************************************************************************************************
      MAIN SIDEBAR MENU
      *********************************************************************************************************************************************************** -->
      <!--sidebar start-->
      <aside>
          <div id="sidebar"  class="nav-collapse ">
              <!-- sidebar menu start-->
              <ul class="sidebar-menu" id="nav-accordion">
              
              	  <p class="centered"><a href="index.jsp"><img src="assets/img/ui-manager.png" class="img-circle" width="60"></a></p>
              	  <h5 class="centered">管理员</h5>
              	  	
                  <li class="mt">
                      <a href="index.jsp">
                          <i class="fa fa-home fa-fw"></i>
                          <span>主页</span>
                      </a>
                  </li>

                  <li class="sub-menu">
                      <a href="javascript:;" >
                          <i class="fa fa-th"></i>
                          <span>查看别墅</span>
                      </a>
                      <ul class="sub">
                          <li><a href="checkallvilla.jsp">查看别墅列表</a></li>
                      </ul>
                  </li>
                  
                  <li class="sub-menu">
                      <a href="javascript:;" >
                          <i class="fa fa-cogs fa-fw"></i>
                          <span>别墅管理</span>
                      </a>
                      <ul class="sub">
                          <li><a  href="addvilla.jsp">新增别墅信息</a></li>
                          <li><a  href="lookvilla.jsp">修改别墅信息</a></li>
                      </ul>
                  </li>
                  <li class="sub-menu">
                      <a class="active" href="javascript:;" >
                          <i class="fa fa-tasks fa-fw"></i>
                          <span>代理人管理</span>
                      </a>
                      <ul class="sub">
                          <li class="active"><a href="setagency.html">设置代理人</a></li>
                      </ul>
                  </li>
                  <li class="sub-menu">
                      <a href="javascript:;" >
                          <i class=" fa fa-bar-chart-o"></i>
                          <span>图表</span>
                      </a>
                      <ul class="sub">
                          <li><a  href="chartjs.html">Chartjs</a></li>
                      </ul>
                  </li>

              </ul>
              <!-- sidebar menu end-->
          </div>
      </aside>
      <!--sidebar end-->
      
      <!-- **********************************************************************************************************************************************************
      MAIN CONTENT
      *********************************************************************************************************************************************************** -->
      
      <% 
		List<AgentInfo> listAgent = new ArrayList<AgentInfo>();
		AgentInfoService agentService = new AgentInfoService();
		listAgent = agentService.selectAgentId();
		
		
	  %>
      
      <!--main content start-->
      <section id="main-content">
          <section class="wrapper">
          	<h3><i class="fa fa-angle-right"></i> 设置代理人</h3>
				<div class="row">
				
	                  <div class="col-md-12">
	                  	  <div class="content-panel">
	                  	  	  <h4><i class="fa fa-angle-right"></i> 代理人</h4>
	                  	  	  <hr>
		                      <table class="table" style="font-size: 16px;">
		                          <thead>
		                          <tr>
		                              <th>编号</th>
		                              <th>姓名</th>
		                              <th>联系方式</th>
		                              <th>&nbsp;</th>
		                          </tr>
		                          </thead>
		                          <tbody>
		                          <%for(int i=0;i<listAgent.size();i++){%>
		                          <tr>
		                              <td><%=listAgent.get(i).getAgentId().getId() %></td>
		                              <td><%=listAgent.get(i).getName() %></td>
		                              <td><%=listAgent.get(i).getContact() %></td>
		                              <td>
										<div class="text-center">
										  <button type="button" class="btn btn-danger" onClick="cancelAgent(<%=listAgent.get(i).getAgentId().getId()%>)">取消代理人身份</button>
									  </div>
                          			  </td>
		                          </tr>
		                          <%} %>
		                          
		                          </tbody>
		                      </table>
	                  	  </div><!--/content-panel -->
	                  </div><!-- /col-md-12 -->
                  
	                  <div class="col-md-12 mt">
	                  	<div class="content-panel">
	                          
	                  	  	  <h4><i class="fa fa-angle-right"></i> 将用户设置为代理人</h4>
	                  	  	  
	                  	  	  
	                  	  	  <form id="formSearch" class="form-horizontal style-form" method="post" action="updatevilla.jsp">
                          <div class="form-group">
                              <div class="col-sm-10">
                                  <input id="phonenum" type="text" class="form-control" name="phonenum" placeholder="输入用户名">
                              </div>
                              <div class="col-sm-2">
                                  <button type="button" class="btn btn-primary" onClick="toSearch()">点我查询</button>
                              </div>
                          </div>
                          <div id="divalert" style="display:none" class="alert alert-danger alert-dismissable">
								<button type="button" class="close" data-dismiss="alert"
										aria-hidden="true">&times;</button>错误！请重新输入。
							</div>
                      </form>
                      
                      <div id="alertDiv" style="display:none;" class="alert alert-warning">
							<a href="#" class="close" data-dismiss="alert">
								&times;
							</a><span id="spanAlert">设置失败</span>
						</div>
						
						
                      
                      <table class="table table-hover" style="font-size: 16px;">
	                  	  	  <hr>
	                              <thead>
	                              <tr>
	                                  <th>登录名</th>
	                                  <th>姓名</th>
	                                  <th>性别</th>
	                                  <th>邮箱</th>
	                                  <th>操作</th>
	                              </tr>
	                              </thead>
	                              <tbody id="searchResult">
	                              
	                              </tbody>
	                          </table>
	                  	  </div><!--/content-panel -->
	                  </div><!-- /col-md-12 -->
				</div><!-- row -->

              

		</section><!--/wrapper -->
      </section><!-- /MAIN CONTENT -->

      <!--main content end-->
      <!--footer start-->
      <footer class="site-footer">
          <div class="text-center">
              2019 - Copyright © Fangshu Project. All rights reserved.
              <a href="index.html#" class="go-top">
                  <i class="fa fa-angle-up"></i>
              </a>
          </div>
      </footer>
      <!--footer end-->
  </section>
    
    
    
    
    

    <!-- js placed at the end of the document so the pages load faster -->
    <script src="assets/js/jquery.js"></script>
    <script src="assets/js/bootstrap.min.js"></script>
    <script class="include" type="text/javascript" src="assets/js/jquery.dcjqaccordion.2.7.js"></script>
    <script src="assets/js/jquery.scrollTo.min.js"></script>
    <script src="assets/js/jquery.nicescroll.js" type="text/javascript"></script>
    <script src="assets/js/jquery-ui-1.9.2.custom.min.js"></script>
	<script src="assets/js/jquery.tagsinput.js"></script>
	<script src="assets/js/form-component.js"></script>    
	<script src="https://cdn.bootcss.com/bootstrap-switch/4.0.0-alpha.1/js/bootstrap-switch.js"></script>
	<script src="assets/js/highlight.js"></script>
	<script src="assets/js/switch-main.js"></script>

    <!--common script for all pages-->
    <script src="assets/js/common-scripts.js"></script>

    <!--script for this page-->
    
  <script>
      //custom select box

      $(function(){
          $('select.styled').customSelect();
      });
      
      function cancelAgent(agentId){
    	  $.ajax({
				url : '${pageContext.request.contextPath}/DelAgentInfo',
				type : 'post',//请求类型get或者post
				data : {"agentId":agentId},
				success : function(data) {//customer_dialog
					alert('取消成功');
					window.location.reload();
				},
				error : function() {
					alert('取消失败');
				}
			});
      }
      
      function toSearch(){
    	  var phonenum=$("#phonenum").val();
    	  $.ajax({
				url : '${pageContext.request.contextPath}/SearchUserInfo',
				type : 'post',//请求类型get或者post
				data : {"phonenum":phonenum},
				success : function(data) {//customer_dialog
					$.each(data,function(index,obj){
					$("#searchResult").append(                   
		                    	"<tr><td>"+obj.user.loginid+"</td>"+    //联系方式     登录名
		                        "<td>"+obj.name+"</td>"+    //姓名
		                        "<td>"+obj.gender+"</td>"+    //性别
		                        "<td>"+obj.email+"</td>"+    //性别
		                        "<td><button type='button' class='btn btn-success'"+
		                        "onClick='addAgent("+obj.user.loginid+")'>设置代理人</button></td></tr>"); 
					});
				},
				error : function() {
					alert('设置失败');
				}
			});
      }
      
      function addAgent(phonenum){
    	  alert(phonenum);
    	  $.ajax({
				url : '${pageContext.request.contextPath}/AddAgent',
				type : 'post',//请求类型get或者post
				data : {"phonenum":phonenum},
				success : function(data) {//customer_dialog
					$("#alertDiv").show();
					<%String info=request.getParameter("info");
					if(info=="2"){%>
						$("#spanAlert").val()="添加成功";
					<%}%>
				},
				error : function() {
					alert('系统bug');
				}
			});
      }
	  
  </script>

  </body>
</html>
