<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'AddDept.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<style type="text/css">
input{margin-top:10px;
font-size:18px;}
</style>

  </head>
  
  <body>
    <form action="${pageContext.request.contextPath}/addDept?item=add" method="post">
    	<table border="1" cellspacing="0" width="60%" align="center">
    	<tr>
    		<td>部门ID：</td>
    		<td><input type="text" name="dept_id" /></td>
    	</tr>
		<tr>
			<td>部门名称：</td>
			<td><input type="text" name="dept_name" /></td>
		</tr>
		<tr>
			<td>人数：</td>
			<td><input type="text" name="dept_num" /></td>
		</tr>
		<tr>
			<td>是否可用：</td>
			<td>
				<input type="checkbox" name="dept_status" value="1">可用
				<input type="checkbox" name="dept_status" value="0">不可用
			</td>
		</tr>
		<tr>
		<td colspan="2">
			<div style="margin-left:100px"><input type="submit" value="添加" />　　　
			<input type="reset" /></div>
		</td>
		</tr>
    	</table>
	</form>
  </body>
</html>
