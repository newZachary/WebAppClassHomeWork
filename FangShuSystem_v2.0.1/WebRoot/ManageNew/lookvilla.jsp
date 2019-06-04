<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html lang="zh-CN">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="FangshuProject">

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
    <!-- fileinput 文件上传 -->
    <link href="assets/css/fileinput.css" media="all" rel="stylesheet" type="text/css"/>
	<link href="assets/themes/explorer-fas/theme.css" media="all" rel="stylesheet" type="text/css"/>

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
                      <a class="active" href="javascript:;" >
                          <i class="fa fa-cogs fa-fw"></i>
                          <span>别墅管理</span>
                      </a>
                      <ul class="sub">
                          <li><a  href="addvilla.jsp">新增别墅信息</a></li>
                          <li class="active"><a  href="lookvilla.jsp">修改别墅信息</a></li>
                      </ul>
                  </li>
                  <li class="sub-menu">
                      <a href="javascript:;" >
                          <i class="fa fa-tasks fa-fw"></i>
                          <span>代理人管理</span>
                      </a>
                      <ul class="sub">
                          <li><a  href="setagency.jsp">设置代理人</a></li>
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
      <!--main content start-->
      <section id="main-content">
          <section class="wrapper">
          	<h3><i class="fa fa-angle-right"></i> 修改别墅</h3>
          	
          	<!-- BASIC FORM ELELEMNTS -->
          	<div class="row mt">
          		<div class="col-lg-12">
                  <div class="form-panel">
                  	  <h4 class="mb"><i class="fa fa-angle-right"></i> 查询要修改的别墅</h4>
                      <form id="formUpd" class="form-horizontal style-form" method="post" action="updatevilla.jsp">
                          <div class="form-group">
                              <div class="col-sm-10">
                                  <input id="houseID" type="text" class="form-control" name="houseid" placeholder="输入别墅编号">
                              </div>
                              <div class="col-sm-2">
                                  <button type="button" class="btn btn-primary" onClick="toUpdate()">点我修改</button>
                              </div>
                          </div>
                          <div id="divalert" style="display:none" class="alert alert-danger alert-dismissable">
								<button type="button" class="close" data-dismiss="alert"
										aria-hidden="true">
									&times;
								</button>
								错误！请重新输入。
							</div>
                         
                         <div class="form-group">
                              <div class="col-sm-12 text-center">
                                  <a class="btn btn-primary" href="checkallvilla.jsp">不知道别墅编号？点我进入全部别墅页</a>
                              </div>
                          </div>
                         
                      </form>
                  </div>
          		</div><!-- col-lg-12-->      	
          	</div><!-- /row -->
          
          	
          	
          	
          	
          	
		</section><!-- /wrapper -->
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
    <script src="assets/js/common-scripts.js"></script>
    <script src="assets/js/jquery-ui-1.9.2.custom.min.js"></script>
	<script src="assets/js/bootstrap-switch.js"></script>
	<script src="assets/js/jquery.tagsinput.js"></script>
	<script type="text/javascript" src="assets/js/bootstrap-daterangepicker/bootstrap-datetimepicker.js"></script>
	<script type="text/javascript" src="assets/js/bootstrap-daterangepicker/locales/bootstrap-datetimepicker.zh-CN.js" charset="UTF-8"></script>
	<script type="text/javascript" src="assets/js/bootstrap-inputmask/bootstrap-inputmask.min.js"></script>
	<script src="assets/js/form-component.js"></script>    
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
    <script src="assets/js/plugins/piexif.js" type="text/javascript"></script>
    <script src="assets/js/plugins/sortable.js" type="text/javascript"></script>
    <script src="assets/js/fileinput.js" type="text/javascript"></script>
    <script src="assets/js/locales/zh.js" type="text/javascript"></script>
    <script src="assets/themes/fas/theme.js" type="text/javascript"></script>
    <script src="assets/themes/explorer-fas/theme.js" type="text/javascript"></script>
    
    <script>
    function toUpdate(){
    	if($("#houseID").val()==""){
    		$("#divalert").show();
    	}else{
    		var formUpd=document.getElementById("formUpd");
    		$.ajax({
				url : 'updatevilla.jsp',
				type : 'post',//请求类型get或者post
				data : {"houseid":$("#houseID").val()},
				success : function(data) {//customer_dialog
					formUpd.submit();
				},
				error : function() {
					$("#divalert").show();
				}
			});
    		
    	}
    }
    </script>
    
  

  </body>
</html>
