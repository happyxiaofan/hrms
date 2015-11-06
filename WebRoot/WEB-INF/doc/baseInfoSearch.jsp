<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.hrms.doc.entity.*" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'baseInfoSearch.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<style type="text/css">
		.searchBox{width:400px;border:1px solid balck;margin-left:200px;display: none;}
		.datalist{border:1px solid #0058a3;font-family:Arial;border-collapse:collapse;background-color:#eaf5ff;font-size:14px;}
		.datalist td{border:1px solid #0058a3;text-align:left;padding-top:4px; padding-bottom:4px;padding-left:10px; padding-right:10px;}
		.datalist tr.altrow{background-color:#c7e5ff;
	</style>
	<script type="text/javascript">
		function search(){
			document.getElementById("search").submit();
			document.getElementById("searchBox").style.display="block";
		}
		
		window.onload = function(){
			document.getElementById("searchBox").style.display="block"
		}
	</script>
  </head>
  
  <body>
    <form id="search" action="${pageContext.request.contextPath }/baseInfoSearch?item=search" method="post">
    	<div style="margin-left:200px;width:40%">
    	<input type="text" name="content" onchange="search()">&nbsp;&nbsp;&nbsp;
    	<input type="submit" value="search" />
    	</div>
    </form>
    <div class="searchBox" id="searchBox">
    	<table width="100%" class="datalist">
    		<tr class="altrow">
    			<td>姓名</td>
    			<td>性别</td>
    			<td>学历</td>
    			<td>学位</td>
    			<td>状态</td>
    		</tr>
    		<c:forEach items="${infos}" var="info" >
    		<tr>
    			<td>${info.e_name}</td>
    			<td>${info.gender}</td>
    			<td>${info.education}</td>
    			<td>${info.degree}</td>
    			<td>${info.status}</td>
    		</tr>
    		</c:forEach>
    	</table>
    </div>
  </body>
</html>
