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
form{ margin:0 auto; width:300px;}
input{margin-top:10px;
font-size:18px;}
</style>

  </head>
  
  <body>
    <form action="${pageContext.request.contextPath}/addDept?item=add" method="post">
		部门ID：<input type="text" name="dept_id" /><br />
		部门名称：<input type="text" name="dept_name" /><br />
		人数：<input type="text" name="dept_num" /><br />
		是否可用：<br />
		<input type="checkbox" name="dept_status" value="1">可用
		<input type="checkbox" name="dept_status" value="0">不可用
		<br />
		<input type="submit" value="添加" />　　　
		<input type="reset" />
	</form>
  </body>
</html>
