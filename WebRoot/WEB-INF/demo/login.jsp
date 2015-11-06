<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<html>
	<head>
		<base href="<%=basePath%>">
		
		<title>人力资源管理系统</title>
		<link rel="stylesheet" type="text/css" href="res/css/style.css" />
		<script type="text/javascript" src="res/js/js.js"></script>
	</head>
	<body>
		<div id="top">
		</div>
		<form id="login" name="login" action="${pageContext.request.contextPath}/login" method="post">
			<div id="center">
				<div id="center_left"></div>
				<div id="center_middle">
					<div class="user">
						<label>
							用户名：
							<input type="text" name="userName" id="user" />
						</label>
					</div>
					<div class="user">
						<label>
							密 码：
							<input type="password" name="passwd" id="pwd" />
						</label>
					</div>
					<div class="chknumber">
						<label>
							验证码：
							<input name="chknumber" type="text" id="chknumber" maxlength="4"
								class="chknumber_input" />
						</label>
						<img src="res/images/checkcode.png" id="safecode" />
					</div>
				</div>
				<div id="center_middle_right"></div>
				<div id="center_submit">
					<div class="button">
						<img src="res/images/dl.gif" width="57" height="20"
							onclick="form_submit()">
					</div>
					<div class="button">
						<img src="res/images/cz.gif" width="57" height="20"
							onclick="form_reset()">
					</div>
				</div>
				<div id="center_right"></div>
			</div>
		</form>
		<div id="footer"></div>
	</body>
</html>
