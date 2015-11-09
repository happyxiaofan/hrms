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
form{ margin:0 auto; width:350px;}
input{margin-top:10px;
font-size:18px;}
</style>
<script type="text/javascript" src="res/js/DatePicker/WdatePicker.js"></script>
</head>
<body>
	<form action="${pageContext.request.contextPath}/listRewardServlet?item=addReward" method="post">
			<table>
				<tr>
					<td>奖惩编号：</td>
					<td><input type="text" name="rewid" /></td>
				</tr>
				<tr>
					<td>奖惩人员：</td>
					<td><input type="text" name="rewname" /></td>
				</tr>
				<tr>
					<td>奖惩类型：</td>
					<td><input type="text" name="rewtype" /></td>
				</tr>
				<tr>
					<td>奖惩时间：</td>
					<td><input id="rewdate" name="rewdate" type="text" />
    				<img onclick="WdatePicker({el:'rewdate'})" src="res/js/DatePicker/skin/datePicker.gif" width="16" height="22" align="absmiddle"/>
    			</td>
				</tr>
				<tr>
					<td>奖惩标题：</td>
					<td><input type="text" name="rewtitle" /></td>
				</tr>
				<tr>
					<td>奖惩内容：</td>
					<td><input type="text" name="rewcontent" /></td>
				</tr>
				<tr>
					<td>奖金类别：</td>
					<td><input type="text" name="rewlevel" /></td>
				</tr>
				<tr>
				<td colspan="2" align="center"><input type="submit" value="添加" />&nbsp;&nbsp;&nbsp;&nbsp;<input type="reset" value ="重置"/></td>
				</tr>
			</table>
	</form>
</body>
</html>
