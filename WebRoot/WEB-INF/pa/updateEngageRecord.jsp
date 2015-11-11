<%@page import="com.hrms.pa.entity.EngageRecordEmp"%>
<%@page import="com.hrms.pa.manager.UserManager"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
<style type="text/css">
form{ margin:0 auto; width:500px;}
input{margin-top:10px;
font-size:18px;}
</style>
<script type="text/javascript" src="res/js/DatePicker/WdatePicker.js"></script>
  </head>
  
  <body>
	<%
    		EngageRecordEmp eremp = (EngageRecordEmp)request.getAttribute("eremp");
    		int recordno = eremp.getRecordno();
    		String emp_id = eremp.getEmp_id();
    		String emp_name = new String(eremp.getEmp_name().getBytes("ISO-8859-1"),"utf-8");
    		String emp_post = new String(eremp.getEmp_post().getBytes("ISO-8859-1"),"utf-8");
    		String emp_date = eremp.getEmp_date();
    		
    %>
    <form action="${pageContext.request.contextPath}/updateEngageRecord" method="post">
    	<table>
    	<tr>
        	<td>编号：</td>
            <td><input style="backgroundcolor:gray" type="text" name="recordno" value="<%=recordno %>" readonly="readonly"/><br /></td>
        </tr>
        <tr>
        	<td>员工ID：</td>
            <td><input type="text" name="emp_id" value="<%=emp_id %>"/><br /></td>
        </tr>
        <tr>
        	<td>姓名：</td>
            <td><input type="text" name="emp_name" value="<%=emp_name %>"/><br /></td>
        </tr>
        <tr>
        	<td>职位：</td>
            <td><input type="text" name="emp_post" value="<%=emp_post %>"/><br /></td>
        </tr>
        <tr>
        	<td>聘任时间：</td>
            <td>
            
            <input id="emp_date" name="emp_date" type="text" />
    			<img onclick="WdatePicker({el:'emp_date'})" src="res/js/DatePicker/skin/datePicker.gif" width="16" height="22" align="absmiddle">
    			</img>
    			</td>
        </tr>
        <tr>
        	<td><input type="submit" value="更新" /></td>
            <td><input type="reset" value="重置" /></td>
        </tr>
    </table>
	</form>
  </body>
</html>
