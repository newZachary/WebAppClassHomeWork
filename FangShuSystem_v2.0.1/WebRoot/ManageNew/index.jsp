<%@page import="cn.sdcet.project.service.UserInfoService"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page language="java" import="cn.sdcet.project.service.HouseInfoService"%>
<%@ page language="java" import="cn.sdcet.project.domain.House"%>
<%@ page language="java" import="cn.sdcet.project.domain.AgentInfo"%>
<%@ page language="java" import="cn.sdcet.project.service.AgentInfoService"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
AgentInfoService agentservice=new AgentInfoService();
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html lang="zh-CN">
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
    <link rel="stylesheet" type="text/css" href="assets/css/zabuto_calendar.css">
    <link rel="stylesheet" type="text/css" href="assets/js/gritter/css/jquery.gritter.css" />
    <link rel="stylesheet" type="text/css" href="assets/lineicons/style.css">    
    
    <!-- Custom styles for this template -->
    <link href="assets/css/style.css" rel="stylesheet">
    <link href="assets/css/style-responsive.css" rel="stylesheet">

    <script src="assets/js/chart-master/Chart.js"></script>
    
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
      <header class="header black-bg">
              <div class="sidebar-toggle-box">
                  <div class="fa fa-bars tooltips" data-placement="right" data-original-title="Toggle Navigation"></div>
              </div>
            <!--logo start-->
            <a href="index.html" class="logo"><b>后台管理系统</b></a>
            <!--logo end-->
            <div class="nav notify-row" id="top_menu">
                <!--  notification start -->
                <ul class="nav top-menu">
                    <!-- settings start -->
                    <li class="dropdown">
                        <a data-toggle="dropdown" class="dropdown-toggle" href="index.html#">
                            <i class="fa fa-tasks"></i>
                            <span class="badge bg-theme">4</span>
                        </a>
                        <ul class="dropdown-menu extended tasks-bar">
                            <div class="notify-arrow notify-arrow-green"></div>
                            <li>
                                <p class="green">你有 4 条新消息	</p>
                            </li>
                            <li>
                                <a href="index.html#">
                                    <div class="task-info">
                                        <div class="desc">完成</div>
                                        <div class="percent">100%</div>
                                    </div>
                                    <div class="progress progress-striped">
                                        <div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100" style="width: 100%">
                                            <span class="sr-only">90% 成功</span>
                                        </div>
                                    </div>
                                </a>
                            </li>
                            <li>
                                <a href="index.html#">
                                    <div class="task-info">
                                        <div class="desc">前台完善率</div>
                                        <div class="percent">80%</div>
                                    </div>
                                    <div class="progress progress-striped">
                                        <div class="progress-bar progress-bar-warning" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: 80%">
                                            <span class="sr-only">80% 前台</span>
                                        </div>
                                    </div>
                                </a>
                            </li>
                            <li>
                                <a href="index.html#">
                                    <div class="task-info">
                                        <div class="desc">后台完善率</div>
                                        <div class="percent">80%</div>
                                    </div>
                                    <div class="progress progress-striped">
                                        <div class="progress-bar progress-bar-info" role="progressbar" aria-valuenow="80" aria-valuemin="0" aria-valuemax="100" style="width: 80%">
                                            <span class="sr-only">80% 后台</span>
                                        </div>
                                    </div>
                                </a>
                            </li>
                            <li>
                                <a href="index.html#">
                                    <div class="task-info">
                                        <div class="desc">数据库完善率</div>
                                        <div class="percent">70%</div>
                                    </div>
                                    <div class="progress progress-striped">
                                        <div class="progress-bar progress-bar-danger" role="progressbar" aria-valuenow="70" aria-valuemin="0" aria-valuemax="100" style="width: 70%">
                                            <span class="sr-only">70% 数据库</span>
                                        </div>
                                    </div>
                                </a>
                            </li>
                            <li class="external">
                                <a href="#">就这些了</a>
                            </li>
                        </ul>
                    </li>
                    <!-- settings end -->
                    
                </ul>
                <!--  notification end -->
            </div>
            <div class="top-menu">
            	<ul class="nav pull-right top-menu">
                    <li><a class="logout" href="login.html">退出登录</a></li>
            	</ul>
            </div>
        </header>
      <!--header end-->
      
      <!-- **********************************************************************************************************************************************************
      MAIN SIDEBAR MENU
      *********************************************************************************************************************************************************** -->
      <!--sidebar start-->
      <aside>
          <div id="sidebar"  class="nav-collapse ">
              <!-- sidebar menu start-->
              <ul class="sidebar-menu" id="nav-accordion">
              
              	  <p class="centered"><a href="index.html"><img src="assets/img/ui-manager.png" class="img-circle" width="60"></a></p>
              	  <h5 class="centered">管理员</h5>
              	  	
                  <li class="mt">
                      <a class="active" href="index.html">
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
                          <li><a  href="checkallvilla.jsp">查看别墅列表</a></li>
                      </ul>
                  </li>
                  
                  <li class="sub-menu">
                      <a href="javascript:;" >
                          <i class="fa fa-cogs fa-fw"></i>
                          <span>别墅管理</span>
                      </a>
                      <ul class="sub">
                          <li><a  href="addvilla.jsp">新增别墅信息</a></li>
                          <li><a  href="#">修改别墅信息</a></li>
                          <li><a  href="#">删除别墅信息</a></li>
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
                          <li><a  href="chartjs.jsp">Chartjs</a></li>
                      </ul>
                  </li>

              </ul>
              <!-- sidebar menu end-->
          </div>
      </aside>
      
      
      <!-- **********************************************************************************************************************************************************
      MAIN CONTENT
      *********************************************************************************************************************************************************** -->
      <!--main content start-->
      <section id="main-content">
          <section class="wrapper">

              <div class="row">
                  <div class="col-lg-9 main-chart">
                  
                  	<div class="row mtbox">
                  		<a href="addvilla.jsp">
                  		<div class="col-md-2 col-sm-2 col-md-offset-1 box0">
                  			<div class="box1">
					  			<i class="fa fa-plus-circle fa-5x" aria-hidden="true"></i>
					  			<h5 style="margin-top: 30px">新增别墅</h5>
                  			</div>
					  			<p>在这里点击，用以增加新的别墅</p>
                  		</div>
                  		</a>
                  		
                  		<a href="setagency.jsp">
                  		<div class="col-md-2 col-sm-2 box0">
                  			<div class="box1">
					  			<i class="fa fa-wrench fa-5x" aria-hidden="true"></i> 
					  			<h5 style="margin-top: 30px">设置代理人</h5>
                  			</div>
					  			<p>点击这里，可以将注册用户设置为代理人</p>
                  		</div>
                  		</a>
                  		
                  		<a href="checkallvilla.jsp">
                  		<div class="col-md-2 col-sm-2 box0">
                  			<div class="box1">
					  			<i class="fa fa-th-list fa-5x" aria-hidden="true"></i>
					  			<h5 style="margin-top: 30px">全部别墅</h5>
                  			</div>
					  			<p>点击这里，查看全部别墅</p>
                  		</div>
                  		</a>
                  		
                  		<div class="col-md-2 col-sm-2 box0">
                  			<div class="box1">
					  			<i class="fa fa-cog fa-spin fa-5x fa-fw"></i>
								<span class="sr-only">Loading...</span>
					  			<h5 style="margin-top: 30px"> 未完待续... </h5>
                  			</div>
					  			<p>表着急，还有待探索啦...</p>
                  		</div>
                  	
                  	</div><!-- /row mt -->	
                  
                     <%
                     int n=100;
                     int countNum=0;
                     int year=0,month=0;
                     UserInfoService infoService=new UserInfoService();
                     //注册人数
                     List<Map<String,Integer>> listUserCount= infoService.countUser();
                     //访问人数
                     List<Map<String,Integer>> listUserCount2= infoService.countVisit();
                     int j=0,k=0;
                     String str="",str2="";
                     //注册人数
						for(j=listUserCount.size()-1;j>0;j--){
							countNum+=listUserCount.get(j).get("count")*n;
							str+=listUserCount.get(j).get("count")*n;
							str+=",";
						}
						countNum+=listUserCount.get(j).get("count")*n;
                     	str+=listUserCount.get(j).get("count")*n;
                     	
						//访问人数
                     	for(k=listUserCount2.size()-1;k>0;k--){
							year=listUserCount2.get(k).get("year");
							month=listUserCount2.get(k).get("month");
							str2+="['"+year+"-"+month+"',"+listUserCount2.get(k).get("sum")+"]";
							str2+=",";
							
						}
                     	year=listUserCount2.get(k).get("year");
						month=listUserCount2.get(k).get("month");
						str2+="['"+year+"-"+month+"',"+listUserCount2.get(k).get("sum")+"]";
						System.out.println(str2);
                     %> 
                      <div class="row mt">
                      <!-- SERVER STATUS PANELS -->
                      	<div class="col-md-4 col-sm-4 mb">
							<!-- REVENUE PANEL -->
							<div class="darkblue-panel pn ">
								<div class="darkblue-header">
									<h5>注册用户变化</h5>
								</div>
								<div class="chart mt">
									<div class="sparkline" data-type="line" data-resize="true" data-height="75" data-width="90%" data-line-width="1" data-line-color="#fff" data-spot-color="#fff" data-fill-color="" data-highlight-line-color="#fff" data-spot-radius="4" 
									data-data="[<%=str%>]"></div>
								</div>
								<p class="mt"><b>总人数 <%=countNum%> </b><br/>截至目前</p>
							</div>
						</div><!-- /col-md-4 -->
                      	<% 

                      	HouseInfoService houseService = new HouseInfoService();
                      	House house=houseService.getHouseOfHot();
                      	%>

                      	<div class="col-md-4 col-sm-4 mb">
                      		<div class="white-panel pn">
                      			<div class="white-header">
						  			<h5>最受欢迎别墅</h5>
                      			</div>
								<div class="row">
									<div class="col-sm-6 col-xs-6 goleft">
										<p><i class="fa fa-heart"></i><%=house.getOrderCount() %></p>
									</div>
									<div class="col-sm-6 col-xs-6"></div>
	                      		</div>
	                      		<div class="centered">
										<img src="../<%=house.getOnePicAdd() %>" width="160">
	                      		</div>
	                      		<div class="row">
									<div class="col-md-6">
										<p class="small mt">名称</p>
										<p><%=house.getName() %></p>
									</div>
									<div class="col-md-6">
										<p class="small mt">地址</p>
										<p><%=house.getH_address() %></p>
									</div>
								</div>
                      		</div>
                      	</div><!-- /col-md-4 -->
                      	<%
                      	
                      	AgentInfo agent=new AgentInfo();
                      	agent=agentservice.getAgentOfHot();
                      	
                      	
                      	%>
						<div class="col-md-4 mb">
							<!-- WHITE PANEL - TOP USER -->
							<div class="white-panel pn">
								<div class="white-header">
									<h5>最受欢迎代理人</h5>
								</div>
								<p><img src="../<%=agent.getHead() %>" class="img-circle" width="80"></p>
								<p><b><%=agent.getName() %></b></p>
								<div class="row">
									<div class="col-md-6">
										<p class="small mt">代理别墅数</p>
										<p><%=agent.getHouseCount() %></p>
									</div>
									<div class="col-md-6">
										<p class="small mt">点赞数</p>
										<p><%=agent.getThumbCount() %></p>
									</div>
								</div>
							</div>
						</div><!-- /col-md-4 -->
                      	

                    </div><!-- /row -->
                    
                    
					
					<div class="row mt">
                      <!--CUSTOM CHART START -->
                      <div class="border-head">
                          <h3>访问人数</h3>
                      </div>
                      <div id="charts" style="min-width: 300px; height: 400px; margin: 0 auto;"></div>
                      <!--custom chart end-->
					</div><!-- /row -->	
					
                  </div><!-- /col-lg-9 END SECTION MIDDLE -->
                  
                  
      <!-- **********************************************************************************************************************************************************
      RIGHT SIDEBAR CONTENT
      *********************************************************************************************************************************************************** -->                  
                  
                  <div class="col-lg-3 ds">
                    <!--COMPLETED ACTIONS DONUTS CHART-->
						<h3>新消息</h3>
                                        
                      <!-- First Action -->
                      <div class="desc">
                      	<div class="thumb">
                      		<span class="badge bg-theme"><i class="fa fa-clock-o"></i></span>
                      	</div>
                      	<div class="details">
                      		<p><muted>2 分钟前</muted><br/>
                      		   <a href="#">张三同学</a> 注册了账户<br/>
                      		</p>
                      	</div>
                      </div>
                      <!-- Second Action -->
                      <div class="desc">
                      	<div class="thumb">
                      		<span class="badge bg-theme"><i class="fa fa-clock-o"></i></span>
                      	</div>
                      	<div class="details">
                      		<p><muted>3 小时前</muted><br/>
                      		   <a href="#">李四先生</a> 收藏了迤逦山庄别墅<br/>
                      		</p>
                      	</div>
                      </div>
                      <!-- Third Action -->
                      <div class="desc">
                      	<div class="thumb">
                      		<span class="badge bg-theme"><i class="fa fa-clock-o"></i></span>
                      	</div>
                      	<div class="details">
                      		<p><muted>7 小时前</muted><br/>
                      		   <a href="#">王伍先生e</a> 预约了长清湖别墅<br/>
                      		</p>
                      	</div>
                      </div>
                        
                        <!-- ------------------------只显示五条！！！------------------------------------------ -->
                      <h3>部分经销商(代理人)</h3>
						<%
						List<AgentInfo> listAgent =new ArrayList<AgentInfo>();
						listAgent=agentservice.selectAgentOfTopFive();
						if(listAgent.size()!=0){
							for(int i=0;i<listAgent.size();i++){
							%>
							<div class="desc text-center">
							<div class="thumb">
                      		<img class="img-circle" src="assets/img/NO.<%=i+1 %>.png" width="35px" height="35px" align="">
                      		</div>
                      	<div class="thumb">
                      		<img class="img-circle" src="../<%=listAgent.get(i).getHead() %>" width="35px" height="35px" align="">
                      	</div>
                      	<div class="details text-center">
                      		<p class="text-center"><a href="#"><%=listAgent.get(i).getName()%></a><br/>
                      		   <muted><%= listAgent.get(i).getContact()%></muted>
                      		</p>
                      	</div>
                      </div>
							
								
						<%	}
						}%>
                       
						
                    
                      
                   

                        <!-- CALENDAR-->
                        <div id="calendar" class="mb">
                            <div class="panel green-panel no-margin">
                                <div class="panel-body">
                                    <div id="date-popover" class="popover top" style="cursor: pointer; disadding: block; margin-left: 33%; margin-top: -50px; width: 175px;">
                                        <div class="arrow"></div>
                                        <h3 class="popover-title" style="disadding: none;"></h3>
                                        <div id="date-popover-content" class="popover-content"></div>
                                    </div>
                                    <div id="my-calendar"></div>
                                </div>
                            </div>
                        </div><!-- / calendar -->
                      
                  </div><!-- /col-lg-3 -->
              </div><!--/row -->
          </section>
      </section>

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
    <script src="assets/js/jquery-1.8.3.min.js"></script>
    <script src="assets/js/bootstrap.min.js"></script>
    <script class="include" type="text/javascript" src="assets/js/jquery.dcjqaccordion.2.7.js"></script>
    <script src="assets/js/jquery.scrollTo.min.js"></script>
   
    <script src="assets/js/jquery.sparkline.js"></script>


    <!--common script for all pages-->
    <script src="assets/js/common-scripts.js"></script>
    
    <script type="text/javascript" src="assets/js/gritter/js/jquery.gritter.js"></script>
    <script type="text/javascript" src="assets/js/gritter-conf.js"></script>

    <!--script for this page-->
    <script src="assets/js/sparkline-chart.js"></script>    
	<script src="assets/js/zabuto_calendar.js"></script>	
	
	
	<!-- highcharts -->
	<script src="assets/js/highcharts.js"></script>
	<script src="assets/js/exporting.js"></script>
	<script src="assets/js/export-data.js"></script>
	
	<script type="text/javascript">
        $(document).ready(function () {
        var unique_id = $.gritter.add({
            // (string | mandatory) the heading of the notification
            title: '欢迎您管理员!',
            // (string | mandatory) the text inside the notification
            text: '这是方墅-一站式别墅服务平台后台管理页面，你在这里可以管理我们的系统：新增别墅、设置代理人、查看别墅列表。 <a href="" target="_blank" style="color:#ffd777">祝您使用愉快！</a>',
            // (string | optional) the image to display on the left
            image: 'assets/img/ui-sam.jpg',
            // (bool | optional) if you want it to fade out on its own or just sit there
            sticky: true,
            // (int | optional) the time you want it to be alive for before fading out
            time: '',
            // (string | optional) the class name you want to apply to that specific message
            class_name: 'my-sticky-class'
        });

        return false;
        });
	</script>
	
	<script type="application/javascript">
        $(document).ready(function () {
            $("#date-popover").popover({html: true, trigger: "manual"});
            $("#date-popover").hide();
            $("#date-popover").click(function (e) {
                $(this).hide();
            });
        
            $("#my-calendar").zabuto_calendar({
                action: function () {
                    return myDateFunction(this.id, false);
                },
                action_nav: function () {
                    return myNavFunction(this.id);
                },
                ajax: {
                    url: "show_data.php?action=1",
                    modal: true
                },
                legend: [
                    {type: "text", label: "纪念日", badge: "00"},
                    {type: "block", label: "特殊日", }
                ]
            });
        });
        
        
        function myNavFunction(id) {
            $("#date-popover").hide();
            var nav = $("#" + id).data("navigation");
            var to = $("#" + id).data("to");
            console.log('nav ' + nav + ' to: ' + to.month + '/' + to.year);
        }
        
        
      //highcharts
		Highcharts.chart('charts', {
			chart: {
				type: 'column'
			},
			title: {
				text: '各月访问人数'
			},
			xAxis: {
				type: 'category',
				labels: {
					rotation: -45,
					style: {
						fontSize: '13px',
						fontFamily: 'Verdana, sans-serif'
					}
				}
			},
			yAxis: {
				min: 0,
				title: {
					text: '人数 (十进制)'
				}
			},
			legend: {
				enabled: false
			},
			tooltip: {
				pointFormat: '人数: <b>{point.y:.1f} </b>'
			},
			plotOptions: {
				column: {
					colorByPoint:false,
					color:"#FFAEAD"
				}
			},
			series: [{
				name: 'Population',
				data: [ //调用的方法和 显示注册 在同一地方
				        <%=str2%>
				],
				dataLabels: {
					enabled: true,
					rotation: -90,
					color: '#FFFFFF',
					align: 'right',
					format: '{point.y:.1f}', // one decimal
					y: 10, // 10 pixels down from the top
					style: {
						fontSize: '13px',
						fontFamily: 'Verdana, sans-serif'
					}
				}
			}]
		});

        
    </script>
  

  </body>
</html>
