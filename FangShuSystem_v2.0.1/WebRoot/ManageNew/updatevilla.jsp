<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="cn.sdcet.project.service.AgentInfoService"%>
<%@page import="cn.sdcet.project.domain.AgentInfo" %>
<%@page import="javax.servlet.http.HttpSession"%>
<%@page import="cn.sdcet.project.domain.HouseDetailInfo" %>
<%@page import="cn.sdcet.project.service.HouseDetailInfoService"%>
<%@ page language="java"
	import="cn.sdcet.project.service.PictureService"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

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
    
      <style type="text/css">

.hiddenword{
	margin:0px;
	padding:0px;
	color:#F00;
	
	font-size:12px;
	display:none;
	}
    </style>
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
          	
          	<%
    	HouseDetailInfo houseDet=new HouseDetailInfo();
    
    	String ids=request.getParameter("houseid");
    	int id=Integer.parseInt(ids);
    	HouseDetailInfoService userinfoService=new HouseDetailInfoService();
    	houseDet=userinfoService.getHouseInfoDetail(id);
    	List<String> listPic = new ArrayList<String>();
    	PictureService picService = new PictureService();
    	listPic = picService.selectPictures(id);
    	
    %>
    
          	
          	<!-- BASIC FORM ELELEMNTS -->
          	<form action="../UpdHouseInfo" id="updhouseinfo" name="updhouseinfo" class="form-horizontal style-form" method="post">
          	<div class="row mt">
          		
          		<div class="col-lg-12">
                  <div class="form-panel">
                  	  <h4 class="mb"><i class="fa fa-angle-right"></i> 别墅基本信息</h4>
                  	    <input type="hidden" name="hiddenId" value="<%=id%>">
                          <div class="form-group">
                              <label class="col-sm-2 col-sm-2 control-label">别墅名称</label>
                              <div class="col-sm-10">
                                  <input type="text" class="form-control" placeholder="必填"
                                  name="housename" id="housename" onBlur="checknull('housename','hidhousename')" 
                                   value="<%=houseDet.getHouse().getName()%>">
                              </div>
                          </div>
                          <div class="form-group">
                              <label class="col-sm-2 col-sm-2 control-label">别墅地址</label>
                              <div class="col-sm-10">
                                  <select id="address" name="address" class="selectpicker show-tick form-control input-infowidth" >
                                	<option selected="selected"><%=houseDet.getHouse().getH_address()%></option>
			                       	<option >修改请选择下方选项</option>
			                       	<option value="北京">北京</option>
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
                          <div class="form-group">
                              <label class="col-sm-2 col-sm-2 control-label">详细地址</label>
                              <div class="col-sm-10">
                                  <input name="addressdet" id="addressdet"  type="text" class="form-control " placeholder="必填" value="<%=houseDet.getH_addressdel()%>">
                                  <span class="help-block">具体到街道门牌号</span>
                              </div>
                          </div>
						  <div class="form-group">
							  <label class="col-sm-2 col-sm-2 control-label">价格</label>
							  <div class="col-sm-10">
								  <input class="form-control" type="text" placeholder="必填"
								  onBlur="checknum('price','hidprice','hidpricenum')"  name="price" id="price" 
								  value="<%=houseDet.getHouse().getPrice()%>"  >
							  
							  <div id="hidprice" class="hiddenword">*价格不能为空</div>
								<div id="hidpricenum" class="hiddenword">*价格必须为数字</div>
								</div>
						  </div>
                          <div class="form-group">
                              <label class="col-sm-2 col-sm-2 control-label">户型</label>
                              <div class="col-sm-10">
                                  <input id="housetype" name="housetype" type="text" class="form-control" placeholder="独栋、三层、车库、花园" 
                                  value="<%=houseDet.getHouse().getHousetype()%>">
                              </div>
                          </div>
                          <div class="form-group">
                              <label class="col-sm-2 col-sm-2 control-label">面积</label>
                              <div class="col-sm-10">
                                  <input  name="area" id="area" type="text" class="form-control" 
                                  onBlur="checknum('area','hidarea','hidareanum')"
                                  placeholder="必填"  value="<%=houseDet.getHouse().getArea()%>" >
                                  
                                  <span class="help-block">输入数值</span>
                                  <div id="hidarea" class="hiddenword">*房屋面积不能为空</div>
								<div id="hidareanum" class="hiddenword">*房屋面积必须为数字</div>
                                
                              </div>
                          </div>
                         
                        
                
                  	  <h4 class="mb"><i class="fa fa-angle-right"></i> 别墅详细信息</h4>
                              <div class="form-group">
							  	  <label class="col-sm-2 col-sm-2 control-label">首付价格</label>
							  	  <div class="col-sm-10">
								  	  <input class="form-control" type="text"
								  	  onBlur="checknum('firstpay','hidfp','hidfpnum')"
								  	   name="firstpay" id="firstpay" value="<%=houseDet.getFristpay()%>">
							  	 	<div id="hidfp" class="hiddenword">*首付不能为空</div>
								<div id="hidfpnum" class="hiddenword">*首付必须为数字</div>
							  	  </div>
						  	  </div>
						  	 <% 
						  	 	List<AgentInfo> listAgent = new ArrayList<AgentInfo>();
								AgentInfoService agentService = new AgentInfoService();
								listAgent = agentService.selectAgentId();
							%>
                              <div class="form-group">
							  	  <label class="col-sm-2 col-sm-2 control-label">代理人编号</label>
							  	  <div class="col-sm-10">
								  	<select id="agentid" name="agentid" class="selectpicker show-tick form-control input-infowidth" >
                                	<option value="<%=houseDet.getAgent().getId()%>" selected="selected"><%=houseDet.getAgent().getId()%></option>
                                	<option >修改请选择下方选项</option>
                                	<%for(AgentInfo agent:listAgent){ %>
                                	<option value="<%=agent.getId()%>"><%=agent.getAgentId().getId()%></option>
                                	<%} %>
			                    </select>
							  	  </div>
						  	  </div>
                            
                              <div class="form-group">
							  	  <label class="col-sm-2 col-sm-2 control-label">建成时间</label>
							  	  <div class="col-sm-10">
								  	  <div id="buildtime" class="input-group date form_date col-md-5" data-date="" data-date-format="yyyy-MM-dd" data-link-field="dtp_input2" data-link-format="yyyy-mm-dd">
                    					<input name="time" id="time"class="form-control" size="16" type="text" value="<%=houseDet.getTime() %>" readonly>
                    						<span class="input-group-addon">
                    							<span class="glyphicon glyphicon-remove"></span>
                    						</span>
											<span class="input-group-addon" onClick="getBuildDate()">
               									<span class="glyphicon glyphicon-calendar"></span>
               								</span>
                					</div>
                					<input type="hidden" id="dtp_input2" value="" />
							  	  </div>
							  	  
						  	  </div>
                             
                              <div class="form-group">
							  	  <label class="col-sm-2 col-sm-2 control-label">小区设施</label>
							  	  <div class="col-sm-10">
								  	  <input class="form-control" type="text" name="resfac" id="resfac"
								  	  value="<%=houseDet.getResfac()%>">
							  	  </div>
						  	  </div>
                              <div class="form-group">
							  	  <label class="col-sm-2 col-sm-2 control-label">装修程度</label>
							  	  <div class="col-sm-10">
								  	  <input class="form-control" type="text"  name="decdeg" id="decdeg"
								  	  value="<%=houseDet.getDecdeg()%>">
							  	  </div>
						  	  </div>
                              <div class="form-group">
							  	  <label class="col-sm-2 col-sm-2 control-label">服务介绍</label>
							  	  <div class="col-sm-10">
								  	  <input class="form-control" type="text" name="serviceintro"  id="serviceintro" value="<%=houseDet.getServiceintro() %>" >
							  	  </div>
						  	  </div>
                              <div class="form-group">
							  	  <label class="col-sm-2 col-sm-2 control-label">核心卖点</label>
							  	  <div class="col-sm-10">
								  	  <input class="form-control" type="text" name="corepoint" id="corepoint" value="<%=houseDet.getCorepoint()%>">
							  	  </div>
						  	  </div>
                              <div class="form-group">
							  	  <label class="col-sm-2 col-sm-2 control-label">描述</label>
							  	  <div class="col-sm-10">
								  	  <textarea rows="3" cols="20" name="describe" id="describe" 
								  	  value="<%=houseDet.getDescribe()%>"
								  	  class="form-control input-infowidth"></textarea>
							  	  </div>
						  	  </div>
                             
                             
                             <div class="form-group">
								  <div class="col-sm-10">
									  <button type="button" id="updateinfo" class="btn btn-primary"  onClick="clickpointbtn()">上传修改</button>
								  </div>
							 </div>
                             
                          
          			</div><!-- /form-panel -->
          		</div><!-- /col-lg-12 -->
          		
          	</div><!-- /row -->
          	</form>
          	<!-- INLINE FORM ELELEMNTS -->
          	<div class="row mt">
          		<div class="col-lg-12">
          			<div class="form-panel">
                  	  <h4 class="mb"><i class="fa fa-angle-right"></i> 图片上传</h4>
                      <form id="uploadImg" action="../UploadPic" enctype="multipart/form-data">
							<div class="file-loading">
								<input id="kv-explorer" type="file" multiple>
							</div>
							<br>
						</form>
          			</div><!-- /form-panel -->
          		</div><!-- /col-lg-12 -->
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
		//alert("dd");	
		//updhouseinfo.submit();
		submitajax();
	}
	function submitajax(){
		
		$.ajax({
			url : '${pageContext.request.contextPath}/UpdHouseInfo',
			type : 'post',//请求类型get或者post
			data :$('#updhouseinfo').serialize(),
			success : function(data) {//customer_dialog
				alert('修改成功');
				//location.reload(true);
			},
			error : function() {
				alert('ajax请求失败');
			}
		});
		
	}
	function clickpointnobtn(){
		alert("主人这个地方你还没写呐");
	}
	
	



      //custom select box

	  /**********    获取时间    *********/
      $(function(){
          $('select.styled').customSelect();
      });

	  function getBuildDate(){
		  $('#buildtime').datetimepicker({
			  	language:  'zh-CN',
				format: 'yyyy-mm-dd',
				weekStart: 1,
				todayBtn:  1,
				autoclose: 1,
				todayHighlight: 1,
				startView: 2,
				minView: 2,
				forceParse: 0
		  });
	  }
	  /**********    end 获取时间    *********/
	  
	  
	  /**********    文件上传    *********/
	  $("#kv-explorer").fileinput({
            'theme': 'fas',
			language: 'zh',
            'uploadUrl': '#',
            overwriteInitial: true,
            initialPreviewAsData: true,
            allowedFileExtensions: ['jpg', 'png', 'gif'],
            initialPreview: [
            	"../<%=listPic.get(0)%>"
            ]
        })
        
        $("#kv-explorer").on('filepreupload', function(event, data, previewId, index) {
        	$("#uploadImg").submit();
        });
	  	
	  
	  
	 
	  /**********    end 文件上传    *********/

  </script>

  </body>
</html>
