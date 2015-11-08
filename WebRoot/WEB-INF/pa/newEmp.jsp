<%@page import="com.hrms.pa.entity.NewEmployee"%>
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
								align="center">员工ID</div></td>
						<td width="" height="20" bgcolor="d3eaef" class="STYLE6"><div
								align="center">姓名</div></td>
						<td width="" height="20" bgcolor="d3eaef" class="STYLE6"><div
								align="center">性别</div></td>
						<td width="" height="20" bgcolor="d3eaef" class="STYLE6"><div
								align="center">入职时间</div></td>
						<td width="" height="20" bgcolor="d3eaef" class="STYLE6"><div
								align="center">学历</div></td>
						<td width="" height="20" bgcolor="d3eaef" class="STYLE6">
							<div align="center">学位</div></td>
                        <td width="" height="20" bgcolor="d3eaef" class="STYLE6">
							<div align="center">部门</div></td>
						<td width="" height="20" bgcolor="d3eaef" class="STYLE6"><div
								align="center">职务</div></td>
                        <td width="" height="20" bgcolor="d3eaef" class="STYLE6"><div
								align="center">职称</div></td>
                  
					</tr>
				
			<%
				List<NewEmployee> newemps = (List<NewEmployee>)request.getAttribute("newemps");
				if(newemps != null && newemps.size()>0){
					for(int i = 0;i<newemps.size();i++){
						NewEmployee newemp = newemps.get(i);
					
			 %>
					<tr>
                    	<td height="20" bgcolor="#FFFFFF"><div align="center">
								<input type="checkbox" name="checkbox1" id="checkbox1" />
							</div></td>
						<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div
								align="center"><%=newemp.getEmp_id()%></div></td>
						<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div
								align="center"><%=newemp.getEmp_name() %></div></td>
                        <td height="20" bgcolor="#FFFFFF" class="STYLE19"><div
								align="center"><%=newemp.getEmp_gender() %></div></td>
						<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div
								align="center"><%=newemp.getEmp_date() %></div></td>
						<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div
								align="center"><%=newemp.getEmp_education() %></div></td>
						<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div
								align="center"><%=newemp.getEmp_degree() %></div></td>
						<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div
								align="center"><%=newemp.getEmp_department() %></div></td>
                         <td height="20" bgcolor="#FFFFFF" class="STYLE19"><div
								align="center"><%=newemp.getEmp_job() %></div></td>
						<td height="20" bgcolor="#FFFFFF" class="STYLE19">
							<div align="center"><%=newemp.getEmp_post() %></div>
						</td>
                       
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
