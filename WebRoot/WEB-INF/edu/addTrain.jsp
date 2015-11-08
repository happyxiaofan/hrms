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
   		<table align="center" width="30%" border="1px" >
   			<tr>
   				<td id="td">培训ID：</td>
   				<td><input type="text" size="5" name="treId">*</td>
   			</tr>
   			<tr>
   				<td class="td">培训项目：</td><td><input type="text" size="12" name="treName">*</td>
  			</tr>
  			<tr>
   				<td class="td">培训人数：</td>
   				<td><input type="text" size="5" name="treNum">*</td>
   			</tr>
   			
   			<tr>
   				<td><input type="submit" value="添加"></td>
   				<td><input type="reset" value="重置"></td>
   			</tr>
 		</table>
   	</form>
  </body>
</html>
