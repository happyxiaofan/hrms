<%@page import="com.hrms.sys.entity.Department"%>
<%@page import="com.hrms.sys.manager.DepartmentManager"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'updateDept.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
    <%
    		Department department = (Department)request.getAttribute("dept");
    		String dept_id = department.getDept_id();
    		String dept_name = new String(department.getDept_name().getBytes("ISO-8859-1"),"utf-8");
    		int dept_num = department.getDept_num();
    		int status = department.getStatus();
    	 %>
    	 <form action="${pageContext.request.contextPath}/updateDept" method="post">
		部门编号：<input type="text" name="dept_id" value="<%=dept_id %>"/><br />
		部门名称：<input type="text" name="dept_name" value="<%=dept_name %>"/><br />
		人数：<input type="text" name="dept_num" value="<%=dept_num %>"/><br />
		状态：<input type="text" name="status" value="<%=status %>"/><br />
		<input type="submit" value="更新"/>
		<input type="reset" />
	</form>
  </body>
</html>
