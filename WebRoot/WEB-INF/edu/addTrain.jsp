<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>添加培训记录</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<style>
		#td{
			align:center;
		}
	</style>
  </head>
  <body>
   	<form action="${pageContext.request.contextPath}/addTrainServlet" method="post">
   		<table align="center" width="60%" border="1px" cellspacing="0" cellpadding="0" height="200">
   			<tr>
   				<td id="td" width="20%" align="center" bgcolor="#d3eaef">培训ID：</td>
   				<td><input type="text" size="20" name="treId" style="margin-left:30px">*</td>
   			</tr>
   			<tr>
   				<td class="td" align="center" bgcolor="#d3eaef">培训项目：</td>
   				<td><input type="text" size="20" name="treName" style="margin-left:30px">*</td>
  			</tr>
  			<tr>
   				<td class="td" align="center" bgcolor="#d3eaef">培训人数：</td>
   				<td><input type="text" size="12" name="treNum" style="margin-left:30px">*</td>
   			</tr>
   			
   			<tr>
   				<td bgcolor="#d3eaef"></td>
   				<td><input type="submit" value="添加" style="margin-left:30px;margin-right:30px;"><input type="reset" value="重置"></td>
   			</tr>
 		</table>
   	</form>
  </body>
</html>
