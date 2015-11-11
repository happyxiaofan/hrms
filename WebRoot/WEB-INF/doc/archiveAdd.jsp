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
    	<table height="300px" width="60%" align="center" border="1px" cellspacing="0px">
    		<tr>
    			<td bgcolor="#d3eaef"><div align="center">档案ID</div></td>
    			<td><div style="margin-left:30px;"><input type="text" name="a_id"></div></td>
    		</tr>
    		<tr>
    			<td bgcolor="#d3eaef"><div align="center">人员ID</div></td>
    			<td><div style="margin-left:30px;"><input type="text" name="e_id"></div></td>
    		</tr>
    		<tr>
    			<td bgcolor="#d3eaef"><div align="center">档案编号</div></td>
    			<td><div style="margin-left:30px;"><input type="text" name="a_num"></div></td>
    		</tr>
    		<tr>
    			<td bgcolor="#d3eaef"><div align="center">档案名称</div></td>
    			<td><div style="margin-left:30px;"><input type="text" name="a_name"></div></td>
    		</tr>
    		<tr>
    			<td bgcolor="#d3eaef"><div align="center">内容摘要</div></td>
    			<td><div style="margin-left:30px;"><input type="text" name="a_sum"></div></td>
    		</tr>
    		<tr>
    			<td bgcolor="#d3eaef"><div align="center">备注</div></td>
    			<td><div style="margin-left:30px;"><input type="text" name="a_note"></div></td>
    		</tr>
    		<tr>
    			<td colspan="2">
    				<div style="margin-left:270px;"><input type="submit" value="添加档案"></div>
    			</td>
    		</tr>
    	</table>
    </form>
  </body>
</html>
