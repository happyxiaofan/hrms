<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width,initial-scale=1,maximum-scale=1.0" />
<title>人力资源管理系统 | 登录</title>

<link rel="stylesheet" type="text/css" href="res/css/bootstrap.min.css" />
<style type="text/css">
			
html,body {
	height: 100%;
}
.box {
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#0586AD', endColorstr='#0586AD'); /*  IE */
	background-image:linear-gradient(bottom, #0586AD 0%, #0586AD 100%);
	background-image:-o-linear-gradient(bottom, #0586AD 0%, #0586AD 100%);
	background-image:-moz-linear-gradient(bottom, #0586AD 0%, #0586AD 100%);
	background-image:-webkit-linear-gradient(bottom, #0586AD 0%, #0586AD 100%);
	background-image:-ms-linear-gradient(bottom, #0586AD 0%, #0586AD 100%);
	
	margin: 0 auto;
	position: relative;
	width: 100%;
	height: 100%;
}
.login-box {
	width: 100%;
	max-width:400px;
	height: 420px;
	position: absolute;
	top: 50%;

	margin-top: -200px;
	/*设置负值，为要定位子盒子的一半高度*/
	
}
@media screen and (min-width:500px){
	.login-box {
		left: 50%;
		/*设置负值，为要定位子盒子的一半宽度*/
		margin-left: -200px;
	}
}	

.form {
	width: 100%;
	max-width:420px;
	height: 275px;
	margin: 25px auto 0px auto;
	padding-top: 25px;
}	
.login-content {
	height: 320px;
	width: 100%;
	max-width:500px;
	background-color: rgba(255, 250, 2550, .6);
	float: left;
}		
	
	
.input-group {
	margin: 0px 0px 20px 0px !important;
}
.form-control,
.input-group {
	height: 40px;
}

.form-group {
	margin-bottom: 0px !important;
}
.login-title {
	padding: 20px 10px;
	background-color: rgba(0, 0, 0, .6);
}
.login-title h1 {
	margin-top: 10px !important;
}
.login-title small {
	color: #fff;
}

.link p {
	line-height: 20px;
	margin-top: 30px;
}
.btn-sm {
	padding: 8px 24px !important;
	font-size: 16px !important;
}
.foot{
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#0586AD', endColorstr='#0586AD'); /*  IE */
	background-image:linear-gradient(bottom, #0586AD 0%, #0586AD 100%);
	background-image:-o-linear-gradient(bottom, #0586AD 0%, #0586AD 100%);
	background-image:-moz-linear-gradient(bottom, #0586AD 0%, #0586AD 100%);
	background-image:-webkit-linear-gradient(bottom, #0586AD 0%, #0586AD 100%);
	background-image:-ms-linear-gradient(bottom, #0586AD 0%, #0586AD 100%);
	margin-top:30px;
}
</style>

</head>

<body>
<div class="box">
		<div class="login-box">
			<div class="login-title text-center">
				<h1><small>登录</small></h1>
			</div>
			<div class="login-content ">
			<div class="form">
			<form id="login" name="login" action="${pageContext.request.contextPath}/login" method="post">
				<div class="form-group">
					<div class="col-xs-12  ">
						<div class="input-group">
							<span class="input-group-addon"><span class="glyphicon glyphicon-user"></span></span>
							<input type="text" id="user" name="userName" class="form-control" placeholder="用户名"/>
						</div>
					</div>
				</div>
				<div class="form-group">
					<div class="col-xs-12  ">
						<div class="input-group">
							<span class="input-group-addon"><span class="glyphicon glyphicon-lock"></span></span>
							<input type="password" id="pwd" name="passwd" class="form-control" placeholder="密码"/>
						</div>
					</div>
				</div>
				<!-- 验证码 -->
				<div class="form-group">
					<div class="col-xs-8 ">
						<div class="input-group">
							<span class="input-group-addon"><span class="glyphicon glyphicon-lock"></span></span>
							<input type="text" id="verifycode" name="verifycode" class="form-control" placeholder="验证码"/>
						</div>
					</div>
					<div class="col-xs-4 ">
						<div class="input-group">
							<img src="verifyAction" style="margin-left:0px;" width="70px;" height="30px"/><a href="javascript:window.parent.location.reload()">刷新</a>
							<p><span><font style="font-size: 5px;">${errormsg}</font></span></p>
						</div>
					</div>
				</div>
				<div class="form-group form-actions">
					<div class="col-xs-4 col-xs-offset-4 ">
					<button type="submit" class="btn btn-sm btn-info">登录</button>
					</div>
				</div>
			</form>
			</div>
			<div style="text-align:center;" class="foot">
				<p style="font-family:楷体;font-size:30px;color:kaiti">
					<b>人力资源管理系统欢迎您！</b>
				</p>
			</div>
		</div>
	</div>
</div>



</body>

</html>
