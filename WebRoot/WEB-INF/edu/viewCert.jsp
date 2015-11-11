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
<title>查看证书</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<script type="text/javascript">
		$(document).ready(function(){
		  $(".add").click(function(){
		  alert("dadsa");
		    $("#div1").slideToggle();
		  });
		});
	</script>
</head>
<body>
	<form action="" method="post">
  		<table width="80%" align="center" border="1" cellspacing="0">
  			<tr>
  				<td colspan="6" align="center" height="30px" bgcolor="#d3eaef">所有证书信息</td>
  			</tr>
  			<tr>
  				<td height="30px">证书编号</td>
  				<td>证书名称</td>
  				<td>培训学员</td>
  				<td>培训老师</td>
  				<td>获取证书时间</td>
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
  			</tr>
  			<%} %>
  		</table>
  	</form>
</body>
</html>
