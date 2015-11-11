<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'addEmp.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<style type="text/css">
input{margin-top:10px;
font-size:18px;}
</style>
  </head>
  
  <body>
	<form action="${pageContext.request.contextPath}/addEmp?item=add" method="post">
		<table width="60%" border="1px" cellspacing="0px" align="center">
		<tr>
			<td width="20%" bgcolor="#a8c7ce">雇员ID：</td>
			<td><input type="text" name="e_id" /></td>
		</tr>
		<tr>
			<td bgcolor="#a8c7ce">姓名：</td>
			<td><input type="text" name="e_name" /></td>
		</tr>
		<tr>
			<td bgcolor="#a8c7ce">密码：</td>
			<td><input type="password" name="passwd" /></td>
		</tr>
		<tr>
			<td bgcolor="#a8c7ce">性别：</td>
			<td>
				男<input type="radio" name="gender" value="0" />　　　
				女<input type="radio" name="gender" value="1" /><br />
			</td>
		</tr>
		<tr>
			<td height="30px" bgcolor="#a8c7ce">部门：</td>
			<td>
				<select name="stuClass">
		        <option selected>---------
		        <option value="A01">11210A01
		        <option value="A02">11210A02
				</select>
			</td>
		</tr>
		<tr>
			<td height="30px" bgcolor="#a8c7ce">职位：</td>
			<td>
				<select name="major">
		        <option selected>
		        <option value="1">软件开发与测试
		        <option value="2">信息商务
				</select>
			</td>
		</tr>
		<tr>
			<td bgcolor="#a8c7ce">联系方式：</td>
			<td>
				<input type="text" name="stuTel" />
			</td>
		</tr>
		<tr>
			<td colspan="2">
				<div style="margin-left:150px">
					<input type="submit" value="注册" />　　　
					<input type="reset" />
				</div>
			</td>
		</tr>
		</table>
	</form>
</body>
</html>
