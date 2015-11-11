<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'updateArchive.jsp' starting page</title>
    
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
    <form action="${pageContext.request.contextPath }/archiveServlet?item=update" method="post">
    	<table border="1px" width="60%" height="270px" cellspacing="0px" align="center">
    		<tr>
    			<td bgcolor="#a8c7ce" >档案ID</td>
    			<td><input type="text" value="${archive.a_id }"></td>
    		</tr>
    		<tr>
    			<td bgcolor="#a8c7ce" >人员ID</td>
    			<td>
    			<input type="text" value="${archive.e_id}">
    			</td>
    		</tr>
    		<tr>
    			<td bgcolor="#a8c7ce" >档案编号</td>
    			<td><input type="text" value="${archive.a_num }"></td>
    		</tr>
    		<tr>
    			<td bgcolor="#a8c7ce" >档案名称</td>
    			<td><input type="text" value="${archive.a_name }"></td>
    		</tr>
    		<tr>
    			<td bgcolor="#a8c7ce" >摘要</td>
    			<td>
    				<input type="text" value="${archive.a_sum }">
    			</td>
    		</tr>
    		<tr>
    			<td bgcolor="#a8c7ce" >备注</td>
    			<td>
    				<input type="text" value="${archive.a_note }">
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
