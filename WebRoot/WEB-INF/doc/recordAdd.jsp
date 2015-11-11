<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="com.hrms.doc.entity.*" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'archiveAdd.jsp' starting page</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
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
  	<div style="width:60%;margin-left:200px;margin-top:20px" align="center" >
    <form action="${pageContext.request.contextPath }/RecordActionServlet?method=addRecord&entity=record" method="post">
    	<table border="1px" cellspacing="0px" width="100%" >
    		<tr>
    			<td height="30px" bgcolor="#a8c7ce">部门</td>
    			<td>
    				<select name="dept">
    					<option>请选择部门</option>
    					<c:forEach items="${list }" var="dept">
    						<option value="${dept.dept_id }">${dept.dept_name }
    					</c:forEach>
    				</select>
    			</td>
    		</tr>
    		<tr>
    			<td height="30px" bgcolor="#a8c7ce">职位</td>
    			<td><input type="text" name="job"></td>
    		</tr>
    		<tr>
    			<td height="30px" bgcolor="#a8c7ce">学历</td>
    			<td>
    				<select name="edu">
    					<option selected="selected">本科
    					<option>研究生
    					<option>博士
    				</select>
    			</td>
    		</tr>
    		<tr>
    			<td height="30px" bgcolor="#a8c7ce">工作内容</td>
    			<td><input type="text" name="work"></td>
    		</tr>
    		<tr>
    			<td height="30px" bgcolor="#a8c7ce">开始时间</td>
    			<td><input id="start_time" name="start_time" type="text" />
    			<img onclick="WdatePicker({el:'start_time'})" src="res/js/DatePicker/skin/datePicker.gif" width="16" height="22" align="absmiddle">
    			</td>
    		</tr>
    		<tr>
    			<td height="30px" bgcolor="#a8c7ce">结束时间</td>
    			<td>
    			<input id="end_time" name="end_time" type="text" />
    			<img onclick="WdatePicker({el:'end_time'})" src="res/js/DatePicker/skin/datePicker.gif" width="16" height="22" align="absmiddle">
    			</td>
    		</tr>
    		<tr>
    			<td colspan="2" height="30px" align="center">
    				<input type="submit" value="添加履历">
    			</td>
    		</tr>
    	</table>
    </form>
    </div>
  </body>
</html>
