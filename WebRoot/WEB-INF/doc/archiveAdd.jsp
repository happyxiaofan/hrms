<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'archiveAdd.jsp' starting page</title>
    
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
    <form action="${pageContext.request.contextPath }/archiveServlet?item=addFile" method="post">
    	<table>
    		<tr>
    			<td>档案ID</td>
    			<td><input type="text" name="a_id"></td>
    		</tr>
    		<tr>
    			<td>人员ID</td>
    			<td><input type="text" name="e_id"></td>
    		</tr>
    		<tr>
    			<td>档案编号</td>
    			<td><input type="text" name="a_num"></td>
    		</tr>
    		<tr>
    			<td>档案名称</td>
    			<td><input type="text" name="a_name"></td>
    		</tr>
    		<tr>
    			<td>内容摘要</td>
    			<td><input type="text" name="a_sum"></td>
    		</tr>
    		<tr>
    			<td>备注</td>
    			<td><input type="text" name="a_note"></td>
    		</tr>
    		<tr>
    			<td colspan="2">
    				<input type="submit" value="添加档案">
    			</td>
    		</tr>
    	</table>
    </form>
  </body>
</html>
