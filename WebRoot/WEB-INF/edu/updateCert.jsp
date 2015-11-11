<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.hrms.edu.entity.*" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'updateCert.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<script type="text/javascript" src="res/js/DatePicker/WdatePicker.js"></script>
  </head>
  
  <body>
  	<%
  		Cert cert=(Cert)request.getAttribute("cert");
  	 %>
    <form action="${pageContext.request.contextPath}/listCertServlet?item=updateCert" method="post">
    	<table width="70%" border="1" cellspacing="0" cellspadding="0" height="270px" align="center">
    		<tr>
    			<td width="20%"><div align="center">证书编号:</div></td>
    			<td width="50%"><input type="hidden" name="cId" value="<%=cert.getcId() %>"><%=cert.getcId() %></td>
    		</tr>
    		<tr>
    			<td> <div align="center">证书名称:</div></td>
    			<td><input type="text" name="cName" value="<%=new String(cert.getcName().getBytes("ISO-8859-1"),"utf-8" )%>"></td>
    		</tr>
    		<tr>
    			<td><div align="center">培训学员:</div></td>
    			<td><input type="text" name="cStu" value="<%=new String(cert.getcStu().getBytes("ISO-8859-1"),"utf-8" ) %>"></td>
    		</tr>
    		<tr>
    			<td><div align="center">培训教师:</div></td>
    			<td><input type="text" name="cTec" value="<%=new String(cert.getcTec().getBytes("ISO-8859-1"),"utf-8" ) %>"></td>
    		</tr>
    		<tr>
    			<td><div align="center">培训时间:</div></td>
    			<td><input id="cDate" name="cDate" type="text" value="<%=cert.getcDate().substring(0,10)%>"/>
    			<img onclick="WdatePicker({el:'cDate'})" src="res/js/DatePicker/skin/datePicker.gif" width="16" height="22" align="absmiddle">
    			</td>
    		</tr>
    		<tr>
    			
    			<td colspan="2"><div style="margin-left:200px"><input type="submit" value="更新"> <input type="reset" value="重置"></div></td>
    		</tr>
    	</table>
    </form>
  </body>
</html>
