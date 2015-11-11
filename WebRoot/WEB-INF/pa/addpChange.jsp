<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>My JSP 'AddpChange.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<script type="text/javascript" src="res/js/DatePicker/WdatePicker.js"></script>
<style type="text/css">
form {
	margin: 0 auto;
	width: 400px;
}

input {
	margin-top: 10px;
	font-size: 18px;
}
</style>

</head>

<body>
	<form action="${pageContext.request.contextPath}/addpChange"
		method="post">
		<table>
			<tr>
				<td>人事调动编号：</td>
				<td><input type="text" name="pchange_id" /></td>
			</tr>
			<tr>
				<td>调配人员：</td>
				<td><input type="text" name="pchange_name" /></td>
			</tr>
			<tr>
				<td>调配时间：</td>
				<td><input id="pChange_time" name="pchange_time" type="text" />
					<img onclick="WdatePicker({el:'pChange_time'})"
					src="res/js/DatePicker/skin/datePicker.gif" width="16" height="22"
					align="absmiddle">
			</tr>
			<tr>
				<td>变动前状态：</td>
				<td><input type="text" name="pchange_pstate" /></td>
			</tr>
			<tr>
				<td>变动后状态：</td>
				<td><input type="text" name="pchange_astate" /></td>
			</tr>
			<tr>
				<td>变动类别：</td>
				<td><input type="text" name="pchange_class" /></td>
			</tr>
			<tr>
				<td>员工ID</td>
				<td><input type="text" name="pchange_emp_id" /></td>
			</tr>
			<tr>
				<td><input type="submit" value="添加" /></td>
				<td><input type="reset" value="重置" /></td>
			</tr>
		</table>


	</form>
</body>
</html>
