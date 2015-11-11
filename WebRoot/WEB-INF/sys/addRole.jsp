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
input{margin-top:10px;
font-size:18px;}
</style>
  </head>
  
  <body>
    <form action="${pageContext.request.contextPath}/roleServlet?item=addRole" method="post">
		<table width="60%" border="1px" cellspacing="0px" align="center">
		<tr>
			<td width="20%" bgcolor="#a8c7ce" align="center">角色编号：</td>
			<td><input type="text" name="role_id" /></td>
		</tr>
		<tr>
			<td bgcolor="#a8c7ce" align="center">角色名称：</td>
			<td><input type="text" name="role_name" /></td>
		</tr>
		<tr>
			<td colspan="2"><div style="margin-left:150px">
				<input type="submit" value="添加" />　　　
				<input type="reset" />
			</td>
		</tr>
		</table>
	</form>
  </body>
</html>
