<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" errorPage="../Error/error.jsp"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>My JSP 'uploadPicture.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<style type="text/css">
body {
	list-style: none;
	float: left;
}

.row {
	margin: 5px;
}

.span3 {
	width: 30%;
	float: left;
}

.span7 {
	width: 70%;
	float: left;
}

fieldset {
	width: 100px;
	margin: 0px;
	padding: 0px;
}

.progress {
	height: 20px;
	overflow: hidden;
	background-color: #f5f5f5;
	border-radius: 4px;
}

.progress-bar {
	float: left;
	width: 0;
	height: 100%;
	font-size: 12px;
	line-height: 20px;
	color: #fff;
	text-align: center;
	background-color: #5cb85c;
}

#progress {
	width: 100px;
	display: none;
}
</style>
</head>

<body>

	<span>请上传19张图片 </span>
<%
String houseid=request.getParameter("houseid");
%>
	
		<div class="form-group row">
			<div class="col-md-6 field">
				<!-- 防止上传文件过程中页面跳转 -->
				<iframe id="uploadFrame" name="uploadFrame" width="0" height="0"></iframe>
				<form action="UploadPic?action=pic&houseid=<%=houseid %>" method="post" id="uploadForm"
					enctype="multipart/form-data" target="uploadFrame">
					<fieldset>

						<input type="file" name="upload">

					</fieldset>
					<div>
						<input type="submit" value="确定修改" id="uploadBtn" >
					</div>
				</form>
			</div>
			<div id="message"></div>
			<div class="progress" id="progress">
				<div class="progress-bar" id="progressBar">
					<span>0</span>
				</div>
			</div>
		</div>
	<div class="form-group row">
			<div class="col-md-6 field">
				<!-- 防止上传文件过程中页面跳转 -->
				<iframe id="uploadFrame" name="uploadFrame" width="0" height="0"></iframe>
				<form action="UploadPic?action=pic&houseid=<%=houseid %>" method="post" id="uploadForm"
					enctype="multipart/form-data" target="uploadFrame">
					<fieldset>

						<input type="file" name="upload">

					</fieldset>
					<div>
						<input type="submit" value="确定修改" id="uploadBtn" >
					</div>
				</form>
			</div>
			<div id="message"></div>
			<div class="progress" id="progress">
				<div class="progress-bar" id="progressBar">
					<span>0</span>
				</div>
			</div>
		</div>
	<div class="form-group row">
			<div class="col-md-6 field">
				<!-- 防止上传文件过程中页面跳转 -->
				<iframe id="uploadFrame" name="uploadFrame" width="0" height="0"></iframe>
				<form action="UploadPic?action=pic&houseid=<%=houseid %>" method="post" id="uploadForm"
					enctype="multipart/form-data" target="uploadFrame">
					<fieldset>

						<input type="file" name="upload">

					</fieldset>
					<div>
						<input type="submit" value="确定修改" id="uploadBtn" >
					</div>
				</form>
			</div>
			<div id="message"></div>
			<div class="progress" id="progress">
				<div class="progress-bar" id="progressBar">
					<span>0</span>
				</div>
			</div>
		</div>
	<div class="form-group row">
			<div class="col-md-6 field">
				<!-- 防止上传文件过程中页面跳转 -->
				<iframe id="uploadFrame" name="uploadFrame" width="0" height="0"></iframe>
				<form action="UploadPic?action=pic&houseid=<%=houseid %>" method="post" id="uploadForm"
					enctype="multipart/form-data" target="uploadFrame">
					<fieldset>

						<input type="file" name="upload">

					</fieldset>
					<div>
						<input type="submit" value="确定修改" id="uploadBtn" >
					</div>
				</form>
			</div>
			<div id="message"></div>
			<div class="progress" id="progress">
				<div class="progress-bar" id="progressBar">
					<span>0</span>
				</div>
			</div>
		</div>
	<div class="form-group row">
			<div class="col-md-6 field">
				<!-- 防止上传文件过程中页面跳转 -->
				<iframe id="uploadFrame" name="uploadFrame" width="0" height="0"></iframe>
				<form action="UploadPic?action=pic&houseid=<%=houseid %>" method="post" id="uploadForm"
					enctype="multipart/form-data" target="uploadFrame">
					<fieldset>

						<input type="file" name="upload">

					</fieldset>
					<div>
						<input type="submit" value="确定修改" id="uploadBtn" >
					</div>
				</form>
			</div>
			<div id="message"></div>
			<div class="progress" id="progress">
				<div class="progress-bar" id="progressBar">
					<span>0</span>
				</div>
			</div>
		</div>
	<div class="form-group row">
			<div class="col-md-6 field">
				<!-- 防止上传文件过程中页面跳转 -->
				<iframe id="uploadFrame" name="uploadFrame" width="0" height="0"></iframe>
				<form action="UploadPic?action=pic&houseid=<%=houseid %>" method="post" id="uploadForm"
					enctype="multipart/form-data" target="uploadFrame">
					<fieldset>

						<input type="file" name="upload">

					</fieldset>
					<div>
						<input type="submit" value="确定修改" id="uploadBtn" >
					</div>
				</form>
			</div>
			<div id="message"></div>
			<div class="progress" id="progress">
				<div class="progress-bar" id="progressBar">
					<span>0</span>
				</div>
			</div>
		</div>
	<div class="form-group row">
			<div class="col-md-6 field">
				<!-- 防止上传文件过程中页面跳转 -->
				<iframe id="uploadFrame" name="uploadFrame" width="0" height="0"></iframe>
				<form action="UploadPic?action=pic&houseid=<%=houseid %>" method="post" id="uploadForm"
					enctype="multipart/form-data" target="uploadFrame">
					<fieldset>

						<input type="file" name="upload">

					</fieldset>
					<div>
						<input type="submit" value="确定修改" id="uploadBtn" >
					</div>
				</form>
			</div>
			<div id="message"></div>
			<div class="progress" id="progress">
				<div class="progress-bar" id="progressBar">
					<span>0</span>
				</div>
			</div>
		</div>
	<div class="form-group row">
			<div class="col-md-6 field">
				<!-- 防止上传文件过程中页面跳转 -->
				<iframe id="uploadFrame" name="uploadFrame" width="0" height="0"></iframe>
				<form action="UploadPic?action=pic&houseid=<%=houseid %>" method="post" id="uploadForm"
					enctype="multipart/form-data" target="uploadFrame">
					<fieldset>

						<input type="file" name="upload">

					</fieldset>
					<div>
						<input type="submit" value="确定修改" id="uploadBtn" >
					</div>
				</form>
			</div>
			<div id="message"></div>
			<div class="progress" id="progress">
				<div class="progress-bar" id="progressBar">
					<span>0</span>
				</div>
			</div>
		</div>
	<div class="form-group row">
			<div class="col-md-6 field">
				<!-- 防止上传文件过程中页面跳转 -->
				<iframe id="uploadFrame" name="uploadFrame" width="0" height="0"></iframe>
				<form action="UploadPic?action=pic&houseid=<%=houseid %>" method="post" id="uploadForm"
					enctype="multipart/form-data" target="uploadFrame">
					<fieldset>

						<input type="file" name="upload">

					</fieldset>
					<div>
						<input type="submit" value="确定修改" id="uploadBtn" >
					</div>
				</form>
			</div>
			<div id="message"></div>
			<div class="progress" id="progress">
				<div class="progress-bar" id="progressBar">
					<span>0</span>
				</div>
			</div>
		</div>
	<div class="form-group row">
			<div class="col-md-6 field">
				<!-- 防止上传文件过程中页面跳转 -->
				<iframe id="uploadFrame" name="uploadFrame" width="0" height="0"></iframe>
				<form action="UploadPic?action=pic&houseid=<%=houseid %>" method="post" id="uploadForm"
					enctype="multipart/form-data" target="uploadFrame">
					<fieldset>

						<input type="file" name="upload">

					</fieldset>
					<div>
						<input type="submit" value="确定修改" id="uploadBtn" >
					</div>
				</form>
			</div>
			<div id="message"></div>
			<div class="progress" id="progress">
				<div class="progress-bar" id="progressBar">
					<span>0</span>
				</div>
			</div>
		</div>
	<div class="form-group row">
			<div class="col-md-6 field">
				<!-- 防止上传文件过程中页面跳转 -->
				<iframe id="uploadFrame" name="uploadFrame" width="0" height="0"></iframe>
				<form action="UploadPic?action=pic&houseid=<%=houseid %>" method="post" id="uploadForm"
					enctype="multipart/form-data" target="uploadFrame">
					<fieldset>

						<input type="file" name="upload">

					</fieldset>
					<div>
						<input type="submit" value="确定修改" id="uploadBtn" >
					</div>
				</form>
			</div>
			<div id="message"></div>
			<div class="progress" id="progress">
				<div class="progress-bar" id="progressBar">
					<span>0</span>
				</div>
			</div>
		</div>
	<div class="form-group row">
			<div class="col-md-6 field">
				<!-- 防止上传文件过程中页面跳转 -->
				<iframe id="uploadFrame" name="uploadFrame" width="0" height="0"></iframe>
				<form action="UploadPic?action=pic&houseid=<%=houseid %>" method="post" id="uploadForm"
					enctype="multipart/form-data" target="uploadFrame">
					<fieldset>

						<input type="file" name="upload">

					</fieldset>
					<div>
						<input type="submit" value="确定修改" id="uploadBtn" >
					</div>
				</form>
			</div>
			<div id="message"></div>
			<div class="progress" id="progress">
				<div class="progress-bar" id="progressBar">
					<span>0</span>
				</div>
			</div>
		</div>
	<div class="form-group row">
			<div class="col-md-6 field">
				<!-- 防止上传文件过程中页面跳转 -->
				<iframe id="uploadFrame" name="uploadFrame" width="0" height="0"></iframe>
				<form action="UploadPic?action=pic&houseid=<%=houseid %>" method="post" id="uploadForm"
					enctype="multipart/form-data" target="uploadFrame">
					<fieldset>

						<input type="file" name="upload">

					</fieldset>
					<div>
						<input type="submit" value="确定修改" id="uploadBtn" >
					</div>
				</form>
			</div>
			<div id="message"></div>
			<div class="progress" id="progress">
				<div class="progress-bar" id="progressBar">
					<span>0</span>
				</div>
			</div>
		</div>
	<div class="form-group row">
			<div class="col-md-6 field">
				<!-- 防止上传文件过程中页面跳转 -->
				<iframe id="uploadFrame" name="uploadFrame" width="0" height="0"></iframe>
				<form action="UploadPic?action=pic&houseid=<%=houseid %>" method="post" id="uploadForm"
					enctype="multipart/form-data" target="uploadFrame">
					<fieldset>

						<input type="file" name="upload">

					</fieldset>
					<div>
						<input type="submit" value="确定修改" id="uploadBtn" >
					</div>
				</form>
			</div>
			<div id="message"></div>
			<div class="progress" id="progress">
				<div class="progress-bar" id="progressBar">
					<span>0</span>
				</div>
			</div>
		</div>
	<div class="form-group row">
			<div class="col-md-6 field">
				<!-- 防止上传文件过程中页面跳转 -->
				<iframe id="uploadFrame" name="uploadFrame" width="0" height="0"></iframe>
				<form action="UploadPic?action=pic&houseid=<%=houseid %>" method="post" id="uploadForm"
					enctype="multipart/form-data" target="uploadFrame">
					<fieldset>

						<input type="file" name="upload">

					</fieldset>
					<div>
						<input type="submit" value="确定修改" id="uploadBtn" >
					</div>
				</form>
			</div>
			<div id="message"></div>
			<div class="progress" id="progress">
				<div class="progress-bar" id="progressBar">
					<span>0</span>
				</div>
			</div>
		</div>
	<div class="form-group row">
			<div class="col-md-6 field">
				<!-- 防止上传文件过程中页面跳转 -->
				<iframe id="uploadFrame" name="uploadFrame" width="0" height="0"></iframe>
				<form action="UploadPic?action=pic&houseid=<%=houseid %>" method="post" id="uploadForm"
					enctype="multipart/form-data" target="uploadFrame">
					<fieldset>

						<input type="file" name="upload">

					</fieldset>
					<div>
						<input type="submit" value="确定修改" id="uploadBtn" >
					</div>
				</form>
			</div>
			<div id="message"></div>
			<div class="progress" id="progress">
				<div class="progress-bar" id="progressBar">
					<span>0</span>
				</div>
			</div>
		</div>
	<div class="form-group row">
			<div class="col-md-6 field">
				<!-- 防止上传文件过程中页面跳转 -->
				<iframe id="uploadFrame" name="uploadFrame" width="0" height="0"></iframe>
				<form action="UploadPic?action=pic&houseid=<%=houseid %>" method="post" id="uploadForm"
					enctype="multipart/form-data" target="uploadFrame">
					<fieldset>

						<input type="file" name="upload">

					</fieldset>
					<div>
						<input type="submit" value="确定修改" id="uploadBtn" >
					</div>
				</form>
			</div>
			<div id="message"></div>
			<div class="progress" id="progress">
				<div class="progress-bar" id="progressBar">
					<span>0</span>
				</div>
			</div>
		</div>
	<div class="form-group row">
			<div class="col-md-6 field">
				<!-- 防止上传文件过程中页面跳转 -->
				<iframe id="uploadFrame" name="uploadFrame" width="0" height="0"></iframe>
				<form action="UploadPic?action=pic&houseid=<%=houseid %>" method="post" id="uploadForm"
					enctype="multipart/form-data" target="uploadFrame">
					<fieldset>

						<input type="file" name="upload">

					</fieldset>
					<div>
						<input type="submit" value="确定修改" id="uploadBtn" >
					</div>
				</form>
			</div>
			<div id="message"></div>
			<div class="progress" id="progress">
				<div class="progress-bar" id="progressBar">
					<span>0</span>
				</div>
			</div>
		</div>
	<div class="form-group row">
			<div class="col-md-6 field">
				<!-- 防止上传文件过程中页面跳转 -->
				<iframe id="uploadFrame" name="uploadFrame" width="0" height="0"></iframe>
				<form action="UploadPic?action=pic&houseid=<%=houseid %>" method="post" id="uploadForm"
					enctype="multipart/form-data" target="uploadFrame">
					<fieldset>

						<input type="file" name="upload">

					</fieldset>
					<div>
						<input type="submit" value="确定修改" id="uploadBtn" >
					</div>
				</form>
			</div>
			<div id="message"></div>
			<div class="progress" id="progress">
				<div class="progress-bar" id="progressBar">
					<span>0</span>
				</div>
			</div>
		</div>
	
	

</body>
</html>
