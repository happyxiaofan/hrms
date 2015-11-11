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
    	 <table border="1px" cellspacing="0px" height="200px" width="60%" align="center">
    	 <tr>
			<td bgcolor="#a8c7ce" width="20%">部门编号：</td>
			<td><input type="text" name="dept_id" value="<%=dept_id %>"/></td>
		</tr>
		<tr>
			<td  bgcolor="#a8c7ce">部门名称：</td>
			<td><input type="text" name="dept_name" value="<%=dept_name %>"/></td>
		</tr>
		<tr>
			<td  bgcolor="#a8c7ce">人数：</td>
			<td><input type="text" name="dept_num" value="<%=dept_num %>"/></td>
		</tr>
		<tr>
			<td  bgcolor="#a8c7ce">状态：</td>
			<td><input type="text" name="status" value="<%=status %>"/></td>
		</tr>
		<tr>
			<td colspan="2" >
				<div style="margin-left:150px">
				<input type="submit" value="更新"/>
				<input type="reset" />
				</div>
			</td>
		</tr>
		</table>
	</form>
  </body>
</html>
