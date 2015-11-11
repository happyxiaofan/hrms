<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'addModule.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<style type="text/css">
input{margin-top:10px;
font-size:18px;}
</style>
 </head>
  
  <body>
    <form action="${pageContext.request.contextPath}/moduleServlet?item=addModule" method="post">
		<table width="60%" align="center" border="1px" cellspacing="0">
			<tr>
				<td>模块编号：</td>
				<td><input type="text" name="m_id" /></td>
			</tr>
			<tr>
				<td>模块名称：</td>
				<td><input type="text" name="m_name" /></td>
			</tr>
			<tr>
				<td colspan="2"><div style="margin-left:150px;">
				<input type="submit" value="添加" />　　　
				<input type="reset" />
				</div>
				</td>
			</tr>
		</table>
	</form>
  </body>
</html>
