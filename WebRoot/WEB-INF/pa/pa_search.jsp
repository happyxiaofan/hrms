<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
<style type="text/css">
form{ margin:0 auto; width:300px;}
input{margin-top:10px;
font-size:18px;}
</style>
</head>

<body>
	<form action="${pageContext.request.contextPath}/queryInfo" method="post">
	<table>
		<tr>
			<td>员工编号：</td>
			<td><input type="text" name="pchange_emp_id" /></td>
		</tr>
		
		<tr>
			<td><input type="submit" value="检索" onclick="search()"/></td>
			<td> <input type="reset" value="重置"></td>
		</tr>
	</table>
	</form>
   
</body>
</html>