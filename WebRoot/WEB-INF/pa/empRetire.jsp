<%@page import="com.hrms.pa.entity.RetireEmployee"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>My JSP 'listEmp.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<style type="text/css">
body {
	margin-left: 3px;
	margin-top: 0px;
	margin-right: 3px;
	margin-bottom: 0px;
}

.STYLE1 {
	color: #e1e2e3;
	font-size: 12px;
}

.STYLE6 {
	color: #000000;
	font-size: 12;
}

.STYLE10 {
	color: #000000;
	font-size: 12px;
}

.STYLE19 {
	color: #344b50;
	font-size: 12px;
}

.STYLE21 {
	font-size: 12px;
	color: #3b6375;
}

.STYLE22 {
	font-size: 12px;
	color: #295568;
}
</style>
</head>

<body>
	<table width="100%" border="0" align="center" cellpadding="0"
		cellspacing="0">
		<tr>
			<td>
			<table width="100%" border="0" cellpadding="0"
					cellspacing="1" bgcolor="#a8c7ce">
              
					<tr>
                    	<td width="4%" height="20" bgcolor="d3eaef" class="STYLE10"><div
								align="center">
								<input type="checkbox" name="checkbox" id="checkbox" />
							</div></td>
						<!-- 员工编号 -->
                        <td width="" height="20" bgcolor="d3eaef" class="STYLE6"><div
								align="center">编号</div></td>
						<td width="" height="20" bgcolor="d3eaef" class="STYLE6"><div
								align="center">员工ID</div></td>
						<td width="" height="20" bgcolor="d3eaef" class="STYLE6"><div
								align="center">姓名</div></td>
						<td width="" height="20" bgcolor="d3eaef" class="STYLE6"><div
								align="center">性别</div></td>
						<td width="" height="20" bgcolor="d3eaef" class="STYLE6"><div
								align="center">年龄</div></td>
						<td width="" height="20" bgcolor="d3eaef" class="STYLE6"><div
								align="center">退休原因</div></td>
						<td width="" height="20" bgcolor="d3eaef" class="STYLE6">
							<div align="center">退休类别</div></td>
                        <td width="" height="20" bgcolor="d3eaef" class="STYLE6">
							<div align="center">退休时间</div></td>
						
                        <td width="" height="20" bgcolor="d3eaef" class="STYLE6"><div
								align="center">是否退休</div></td>
                     </tr>
				<%
				List<RetireEmployee> remps = (List<RetireEmployee>)request.getAttribute("remps");
				if(remps != null && remps.size()>0){
					for(int i = 0;i<remps.size();i++){
						RetireEmployee remp = remps.get(i);
					
				 %>
			
					<tr>
                    	<td height="20" bgcolor="#FFFFFF"><div align="center">
								<input type="checkbox" name="checkbox1" id="checkbox1" />
							</div></td>
                            
                        <td width="" height="20" bgcolor="d3eaef" class="STYLE6"><div
								align="center"><%=remp.getRetireno() %>></div></td>
						<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div
								align="center"><%=remp.getEmp_id() %></div></td>
						<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div
								align="center"><%=remp.getEmp_name() %></div></td>
                        <td height="20" bgcolor="#FFFFFF" class="STYLE19"><div
								align="center"><%=remp.getEmp_gender() %></div></td>
						<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div
								align="center"><%=remp.getEmp_age() %></div></td>
						<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div
								align="center"><%=remp.getRetire_reason() %></div></td>
						<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div
								align="center"><%=remp.getRetire_class() %></div></td>
						<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div
								align="center"><%=remp.getRetire_date() %></div></td>
                         <td height="20" bgcolor="#FFFFFF" class="STYLE19"><div
								align="center"><%=remp.getIsretire() %></div></td>
						
					</tr>
					
			<%
					}
				}
			 %>
					
			</table>
			</td>
		</tr>
		</table>
	</body>
</html>