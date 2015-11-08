<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.hrms.edu.entity.Cert" %>
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
  </head>
  <body>
  	<form action="CertServlet" method="post">
  		<table width="80%" align="center" border="1" cellspacing="0">
  			<tr>
  				<td colspan="7" align="center">所有证书信息</td>
  			</tr>
  			<tr>
  				<td>证书</td>
  				<td>证书编号</td>
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
  				<td><input type="button" value="添加"></input></td>
  				<td><%=cert.getcId() %></td>
  				<td><%=cert.getcName() %></td>
  				<td><%=cert.getcStu() %></td>
  				<td><%=cert.getcTec() %></td>
  				<td><%=cert.getcDate() %></td>
  				<td>
	  				<a href="${pageContext.request.contextPath}/deleteCertServlet?cId=<%=cert.getcId() %>">
						<input type="submit" value="删除"></input>
					</a>
					<a href="${pageContext.request.contextPath}/listCertServlet?cId=<%=cert.getcId() %>">
						<input type="submit" value="修改">
					</a>
				</td>
  			</tr>
  			<%} %>
  		</table>
  	</form>
  </body>
</html>
