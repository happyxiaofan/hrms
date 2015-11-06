<%@page import="com.hrms.sys.manager.UserManager"%>
<%@page import="com.hrms.sys.entity.Employee"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'updateEmp.jsp' starting page</title>
    
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
	input{margin-top:10px;font-size:18px;}
	</style>
  </head>
  
  <body>
    	<%
    		Employee emp = (Employee)request.getAttribute("emp");
    		String e_id = emp.getE_id();
    		String e_name = new String(emp.getEname().getBytes("ISO-8859-1"),"utf-8");
    		String passwd = request.getParameter(emp.getPwd());
    	 %>
    	 <form action="${pageContext.request.contextPath}/updateEmp" method="post">
		雇员ID：<input type="text" name="e_id" value="<%=e_id %>"/><br />
		姓名：<input type="text" name="e_name" value="<%=e_name %>"/><br />
		密码：<input type="password" name="passwd" value="<%=passwd %>"/><br />
		性别：男<input type="radio" name="gender" value="0" />　　　女<input type="radio" name="gender" value="1" /><br />
		部门：<select name="stuClass">
        <option selected>---------
        <option value="A01">11210A01
        <option value="A02">11210A02
		</select><br />
		职位：<select name="major">
        <option selected>
        <option value="1">软件开发与测试
        <option value="2">信息商务
		</select><br />
		联系方式：<input type="text" name="stuTel" /><br />
		<input type="submit" value="更新" />　　　<input type="reset" />
	</form>
  </body>
</html>
