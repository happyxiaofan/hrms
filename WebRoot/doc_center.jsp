<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'center.jsp' starting page</title>
	<style type="text/css">
<!--
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
	overflow:hidden;
}
-->
</style>
  </head>
  
  <body>
<table width="100%" height="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="8" bgcolor="#353c44">&nbsp;</td>
    <td width="187px" valign="top"><iframe height="100%" width="100%" border="0" frameborder="0" src="doc_menu.jsp" name="leftFrame" id="leftFrame" title="leftFrame"></iframe></td>
    <td width="10" bgcolor="#add2da">&nbsp;</td>
    <td valign="top"><iframe height="100%" width="100%" border="0" frameborder="0" src="${pageContext.request.contextPath}/listDept" name="rightFrame" id="rightFrame" title="rightFrame"></iframe></td>
    <td width="8" bgcolor="#353c44">&nbsp;</td>
  </tr>
</table>
</body>
</html>
