<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.hrms.edu.entity.Cert"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">
<title>添加修改证书</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<script type="text/javascript" src="res/js/DatePicker/WdatePicker.js"></script>
<script type="text/javascript">
	flag=true;
	function mySwitch(){
		var div = document.getElementById("div");
		if(flag){
			div.style.display="block";
		}else{
			div.style.display="none";
		}
		flag = !flag;
		//document.getElementById("div").style.display=='none'?'block':'none';
	}
	
</script>
</head>
<body>
	<input type="hidden" id="len" value="${certlen }">
	<form action="CertServlet" method="post">
		<table width="80%" align="center" border="1" cellspacing="0">
			<tr>
				<td colspan="7" align="center" height="30px" bgcolor="#d3eaef">所有证书信息</td>
			</tr>
			<tr>
				<td height="30px">证书编号</td>
				<td>证书名称</td>
				<td>培训学员</td>
				<td>培训老师</td>
				<td>获取证书时间</td>
				<td>操作</td>
			</tr>
			<%
				List<Cert> certs = (List<Cert>)request.getAttribute("certs");
				for(int i = 0;i<certs.size();i++){
	          	  Cert cert = certs.get(i);
			%>
			<tr>
				<td height="30px"><%=cert.getcId() %></td>
				<td><%=cert.getcName() %></td>
				<td><%=cert.getcStu() %></td>
				<td><%=cert.getcTec() %></td>
				<td><%=cert.getcDate().substring(0,10) %></td>
				<td><a
					href="${pageContext.request.contextPath}/listCertServlet?item=delete&cId=<%=cert.getcId() %>">
						删除 </a> <a
					href="${pageContext.request.contextPath}/listCertServlet?item=update&cId=<%=cert.getcId()%>
						&cName=<%=cert.getcName() %>&cStu=<%=cert.getcStu() %>&cTec=<%=cert.getcTec()%>&cDate=<%=cert.getcDate() %>">
						修改 </a></td>
			</tr>
			<%} %>
		</table>
	</form>

	<div id="div" style="display:none;margin-top:50px">
		<form
			action="${pageContext.request.contextPath }/listCertServlet?item=addCert"
			method="post">
			<table width="80%" align="center" border="1" cellspacing="0">
				<tr>
					<td colspan="7" align="center">添加证书信息</td>
				</tr>
				<tr>
					<td>证书编号</td>
					<td>证书名称</td>
					<td>培训学员</td>
					<td>培训老师</td>
					<td>获取证书时间</td>
					<td>基本操作</td>
				</tr>
				<tr>
					<td style="bgcolor:gray;"><input type="text" name="cId" size="10"
						value="${certlen }" readonly="readonly"></td>
					<td><input type="text" name="cName" size="10"></td>
					<td><input type="text" name="cStu" size="10"></td>
					<td><input type="text" name="cTec" size="10"></td>
					<td><input id="cDate" name="cDate" type="text" /> <img
						onclick="WdatePicker({el:'cDate'})"
						src="res/js/DatePicker/skin/datePicker.gif" width="16" height="22"
						align="absmiddle"></td>
					<td><input type="submit" value="添加"></td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>
