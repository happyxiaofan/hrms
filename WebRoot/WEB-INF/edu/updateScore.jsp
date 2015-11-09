<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="com.hrms.edu.entity.Score" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>更新页面</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">

  </head>
  <body>
  	更新成绩：
  	<%
  		Score score=(Score)request.getAttribute("score");
  	%>
  	<form action="${pageContext.request.contextPath }/listEduServlet?item=updateScore" method="post">
  		<table width="80%" border="1" cellspacing="0" height="200" align="center">
  			<tr>
  				<td width="20%" align="center" style="background:#d3eaef">学号:</td>
  				<td>
  					&nbsp;&nbsp;<input type="hidden" size="30" name="sId" value="<%=score.getsId()%>"><%=score.getsId()%>
  				</td>
  			</tr>
  			<tr>
  				<td align="center" style="background:#d3eaef">姓名:</td>
  				<td>&nbsp;&nbsp;<input type="text" size="30" name="sName" value="<%=new String(score.getsName().getBytes("ISO-8859-1"),"utf-8")%>"></td>
  			</tr>
  			<tr>
  				<td align="center" style="background:#d3eaef">课程:</td>
  				<td>&nbsp;&nbsp;
  				<select name="sClass" >
  					<option value="<%=new String(score.getsClass().getBytes("ISO-8859-1"),"utf-8")%>"><%=new String(score.getsClass().getBytes("ISO-8859-1"),"utf-8")%></option>
  					<option value="语文">语文</option>
  					<option value="数学">数学</option>
  					<option value="英语">英语</option>
  				</select></td>
  			</tr>
  			<tr>
  				<td align="center" style="background:#d3eaef">成绩:</td>
  				<td>&nbsp;&nbsp;<input type="text" size="30" name="sScore" value="<%=score.getsScore()%>"></td>
 			</tr>
  			<tr><td style="background:#d3eaef"></td><td>&nbsp;&nbsp;<input type="submit" value="更新">
  			&nbsp;&nbsp;&nbsp;<input type="reset" value="重置"></td></tr>
  		</table>
	</form>
  </body>
</html>
