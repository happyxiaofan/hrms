<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<%@ page import="com.hrms.sys.controller.*"%>
<%@ page import="com.hrms.sys.entity.Employee"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>My JSP 'hr_updaterewardpunish.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<script type="text/javascript">

	function check(){
		var originPwd = document.getElementById("originPwd").value;
		var pwd = document.getElementById("pwd").value;
		if(originPwd!=pwd){
			alert("原密码输入错误！");
			document.getElementById("originPwd").value="";
		}
	}
	
	function check2(){
		var originPwd = document.getElementById("originPwd").value;
		var pwd = document.getElementById("pwd").value;
		var pwd1 = document.getElementById("pwd1").value;
		var pwd2 = document.getElementById("pwd2").value;
		
		if(originPwd!=pwd){
			alert("原密码输入错误！");
			document.getElementById("pwd").value="";
		}
		if(pwd1 == originPwd){
			alert("新密码没有变化");
			return false;
		}
		if(pwd1!=pwd2){
			alert("两次输入的密码不一致，请重新输入！");
			document.getElementById("pwd1").value="";
			document.getElementById("pwd2").value="";
		}
		
	}
	
	function submit(){
		document.forms[0].submit();
	}
	
</script>
</head>

<body background="res/images/b3.jpg">
	<input type="hidden" id="originPwd" value="${baseInfo.passwd }">
	<input type="hidden" id="e_name" name="ename" value="${baseInfo.e_name}">
	<form
		action="${pageContext.request.contextPath }/addEmp?item=updatePwd&e_name=${ baseInfo.e_name}"
		method="post">
		<table align="center">
			<tr>
				<td height="50">原密码：</td>
				<td><input type="password" name="passwd" id="pwd"/></td>
			</tr>
			<tr>
				<td height="50">新密码：</td>
				<td><input type="password" name="passwd1" id="pwd1"/></td>
			</tr>
			<tr>
				<td height="50">再次输入：</td>
				<td><input type="password" name="passwd2" id="pwd2" onblur="check2()"/></td>
			</tr>
			<tr>
				<td height="50" colspan="2" align="center"><input type="button"
					value="修改" onclick="submit()"/>&nbsp;&nbsp;&nbsp;&nbsp;<input type="reset"
					value="撤销" /></td>
			</tr>
		</table>
	</form>
</body>
</html>
