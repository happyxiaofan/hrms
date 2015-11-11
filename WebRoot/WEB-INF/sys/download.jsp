<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="/WEB-INF/tld/mytag.tld" prefix="myTag" %> 
<%@page import="com.hrms.sys.entity.*" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'download.jsp' starting page</title>
    
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
  	<form action="${pageContext.request.contextPath }/downloadServlet?item=download" method="post">
  		<table border="1px" align="center" width="60%" cellspacing="0px" height="100px">
  		<tr>
  		<td width="10%">编号</td>
  		<td width="30%">图片</td>
  		<td width="15%">操作</td>
  		</tr>
  		<%-- <c:forEach items="${paths }" var="path"> --%>
  		<% 
  			List<PicPath> paths = (List<PicPath>)request.getAttribute("paths");
  			int j=1;
  			if(paths != null && paths.size() > 0){
  				for(int i=0;i<paths.size();i++){
  					PicPath path1 = paths.get(i);
  					System.out.println(path1.getPath());
  					if(path1.getPath() !=null){
  						
  						String filename = path1.getPath().substring(path1.getPath().lastIndexOf("\\")+1);
  		 %>
  		<tr>
  			<td><input type="hidden" name="filepath" value="<%=path1.getPath() %>" readonly="readonly"/><%=j %></td>
  			<td><input type="hidden" name="filename" value="<%=filename %>" readonly="readonly"/><%=filename %></td>
  			<td><input type="submit" value="下载"/></td>
  		</tr>
  		<%
  			j++;
  			}
  				}
  					} 
  		%>
  		<%-- </c:forEach><!--  --> --%>
  		</table>
  	</form>
  </body>
</html>
