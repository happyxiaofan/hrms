<%@page import="com.hrms.sys.manager.ModuleManager"%>
<%@page import="com.hrms.sys.entity.Module" %>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'updateModule.jsp' starting page</title>
    
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
    <%
    		Module module = (Module)request.getAttribute("module");
    		String m_id = module.getM_id();
    		String m_name = new String(module.getM_name().getBytes("ISO-8859-1"),"utf-8");
    	 %>
    	 <form action="${pageContext.request.contextPath}/moduleServlet?item=updateModule" method="post">
		模块编号：<input type="text" name="m_id" value="<%=m_id %>"/><br />
		模块名称：<input type="text" name="m_name" value="<%=m_name %>"/><br />
		<input type="submit" value="更新"/>
		<input type="reset" />
	</form>
  </body>
</html>
