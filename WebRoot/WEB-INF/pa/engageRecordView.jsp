<%@page import="com.hrms.pa.entity.EngageRecordEmp"%>
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
				<table width="80%" border="0" cellpadding="0" align="center"
					style="margin-top:30px" cellspacing="1" bgcolor="#a8c7ce">

					<tr>
						<td width="4%" height="30" bgcolor="d3eaef" class="STYLE10"><div
								align="center">
								<input type="checkbox" name="checkbox" id="checkbox" />
							</div></td>
						<!-- 员工编号 -->
						<td width="" bgcolor="d3eaef" class="STYLE6"><div
								align="center">编号</div></td>
						<td width="" bgcolor="d3eaef" class="STYLE6"><div
								align="center">员工ID</div></td>
						<td width="" bgcolor="d3eaef" class="STYLE6"><div
								align="center">姓名</div></td>
						<td width="" bgcolor="d3eaef" class="STYLE6"><div
								align="center">职位</div></td>
						<td width="" bgcolor="d3eaef" class="STYLE6">
							<div align="center">聘任时间</div>
						</td> </tr> <% List
						<EngageRecordEmp> eremps = (List<EngageRecordEmp>)request.getAttribute("eremps");
				if(eremps != null && eremps.size()>0){
					for(int i = 0;i<eremps.size();i++){
						EngageRecordEmp eremp = eremps.get(i);
					
				 %>
			
					<tr>
                    	<td height="30" bgcolor="#FFFFFF"><div align="center">
								<input type="checkbox" name="checkbox1" id="checkbox1" />
							</div></td>
                          <td class="STYLE6" bgcolor="#FFFFFF"><div
								align="center"><%=eremp.getRecordno() %></div></td>   
						<td bgcolor="#FFFFFF" class="STYLE19"><div
								align="center"><%=eremp.getEmp_id() %></div></td>
						<td  bgcolor="#FFFFFF" class="STYLE19"><div
								align="center"><%=eremp.getEmp_name() %></div></td>
                        <td bgcolor="#FFFFFF" class="STYLE19"><div
								align="center"><%=eremp.getEmp_post() %></div></td>
                        <td bgcolor="#FFFFFF" class="STYLE19"><div
								align="center"><%=new String(eremp.getEmp_date().substring(0,10)) %></div></td>
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

