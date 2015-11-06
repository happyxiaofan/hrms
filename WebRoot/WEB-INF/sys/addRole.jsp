<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'addRole.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<style type="text/css">
form{ margin:0 auto; width:300px;}
input{margin-top:10px;
font-size:18px;}
</style>
  </head>
  
  <body>
    <form action="${pageContext.request.contextPath}/roleServlet?item=addRole" method="post">
		角色编号：<input type="text" name="role_id" /><br />
		角色名称：<input type="text" name="role_name" /><br />
		<input type="submit" value="添加" />　　　
		<input type="reset" />
	</form>
  </body>
</html>
