<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'addScore.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">

  </head>
  <body>
  	添加成绩：
  	<form action="${pageContext.request.contextPath }/addScore" method="post">
  		<table width="80%" border="1" cellspacing="0" height="200" align="center">
  			<tr>
  				<td width="20%" align="center" style="background:#d3eaef">学号:</td>
  				<td>
  					&nbsp;&nbsp;<input type="text" size="30" name="sId">
  				</td>
  			</tr>
  			<tr>
  				<td align="center" style="background:#d3eaef">姓名:</td>
  				<td>&nbsp;&nbsp;<input type="text" size="30" name="sName"></td>
  			</tr>
  			<tr>
  				<td align="center" style="background:#d3eaef">课程:</td>
  				<td>&nbsp;&nbsp;
  				<select name="sClass">
  					<option value="">请选择</option>
  					<option value="语文">语文</option>
  					<option value="数学">数学</option>
  					<option value="英语">英语</option>
  				</select></td>
  			</tr>
  			<tr>
  				<td align="center" style="background:#d3eaef">成绩:</td>
  				<td>&nbsp;&nbsp;<input type="text" size="30" name="sScore"></td>
 			</tr>
  			<tr><td style="background:#d3eaef"></td><td>&nbsp;&nbsp;<input type="submit" value="提交">&nbsp;&nbsp;&nbsp;<input type="reset" value="重置"></td></tr>
  		</table>
	</form>
  </body>
</html>
