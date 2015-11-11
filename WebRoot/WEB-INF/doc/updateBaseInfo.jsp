<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="com.hrms.doc.entity.*" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'updateBaseInfo.jsp' starting page</title>
    
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
    <form action="${pageContext.request.contextPath }/docBaseInfoServlet?item=update" method="post">
    	<table border="1px" cellspacing="0px" width="60%" align="center" style="margin-top:30px" height="270px">
    		<tr>
    			<td bgcolor="#a8c7ce">姓名</td>
    			<%BaseInfo info= (BaseInfo)request.getAttribute("info");
    				String e_name = new String(info.getE_name().getBytes("ISO-8859-1"),"utf-8");
    			 %>
    			<td><input type="text" name="e_name" value="<%=e_name %>" readonly="readonly"></td>
    		</tr>
    		<tr>
    			<td bgcolor="#a8c7ce" >性别</td>
    			<td>
    			<input type="radio" name="gender" value="男">男
    			<input type="radio" name="gender" value="女">女
    			</td>
    		</tr>
    		<tr>
    			<td bgcolor="#a8c7ce" >学历</td>
    			<td><input type="text" name="edu" value=""></td>
    		</tr>
    		<tr>
    			<td bgcolor="#a8c7ce" >学位</td>
    			<td><input type="text" name="degree" value=""></td>
    		</tr>
    		<tr>
    			<td bgcolor="#a8c7ce" >状态</td>
    			<td>
    				<input type="radio" name="status" value="7" checked>在职
    				<input type="radio" name="status" value="8" checked>兼职
    				<input type="radio" name="status" value="9" checked>离退
    			</td>
    		</tr>
    		<tr>
    			<td colspan="2" style="text-align:center">
    				<input type="submit" value="更新">
    			</td>
    		</tr>
    	</table>	
    </form>
  </body>
</html>
