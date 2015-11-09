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

  </head>
  
  <body>

    <form action="${pageContext.request.contextPath}/addEngageRecord?item=add" method="post">
    	<table>
    	<tr>
        	<td>编号：</td>
            <td><input type="text" name="recordno" /></td>
        </tr>
        <tr>
        	<td>员工ID：</td>
            <td><input type="text" name="emp_id" /><br /></td>
        </tr>
        <tr>
        	<td>姓名：</td>
            <td><input type="text" name="emp_name" /><br /></td>
        </tr>
        <tr>
        	<td>职位：</td>
            <td><input type="text" name="emp_post" /><br /></td>
        </tr>
        <tr>
        	<td>聘任时间：</td>
            <td><input type="text" name="emp_date" /><br /></td>
        </tr>
        <tr>
        	<td><input type="submit" value="添加" /></td>
            <td><input type="reset" value="重置" /></td>
        </tr>
    </table>
	</form>
  </body>
</html>
