<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="com.hrms.pa.entity.*"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>My JSP 'listpChange.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
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
			<td height="30">
			<table width="100%" border="0" cellspacing="0"
					cellpadding="0">
					<tr>
						<td height="24" bgcolor="#353c44"><table width="100%"
								border="0" cellspacing="0" cellpadding="0">
								<tr>
									<td><table width="100%" border="0" cellspacing="0"
											cellpadding="0">
											<tr>
												<td width="6%" height="19" valign="bottom"><div
														align="center">
														<img src="res/images/tb.gif" width="14" height="14" />
													</div></td>
												<td width="94%" valign="bottom"><span class="STYLE1">
														人事变动信息列表</span></td>
											</tr>
										</table></td>
									
								</tr>
							</table></td>
					</tr>
				</table></td>
		</tr>
		<tr>
			<td><table width="80%" border="0" cellpadding="0"
					cellspacing="1" bgcolor="#a8c7ce" align="center" style="margin-top:30px">
					<tr>
						<td width="4%" height="20" bgcolor="d3eaef" class="STYLE10"><div
								align="center">
								<input type="checkbox" name="checkbox" id="checkbox" />
							</div></td>
						<!-- 员工编号 -->
						<td width="5%" height="30" bgcolor="d3eaef" class="STYLE6"><div
								align="center">人事变动编号</div></td>
						<td width="5%" bgcolor="d3eaef" class="STYLE6"><div
								align="center">员工编号</div></td>
						<td width="5%"  bgcolor="d3eaef" class="STYLE6"><div
								align="center">调配人员</div></td>
						<td width="5%"  bgcolor="d3eaef" class="STYLE6"><div
								align="center">调配时间</div></td>
						<td width="5%" bgcolor="d3eaef" class="STYLE6"><div
								align="center">变动前状态</div></td>
						<td width="5%"  bgcolor="d3eaef" class="STYLE6"><div
								align="center">变动后状态</div></td>
						<td width="5%"  bgcolor="d3eaef" class="STYLE6"><div
								align="center">变动类别</div></td>
						<td width="5%"  bgcolor="d3eaef" class="STYLE6"><div
								align="center">
								<span class="STYLE10">基本操作</span>
							</div></td>
					</tr>

					<%
						List<pChange> pcs = (List<pChange>)request.getAttribute("pcs");
						if(pcs != null && pcs.size() > 0){
							for(int i = 0;i<pcs.size();i++){
			          	  		pChange pc = pcs.get(i);
			          %>
					<tr>
						<td height="20" bgcolor="#FFFFFF"><div align="center">
								<input type="checkbox" name="checkbox1" id="checkbox1" />
							</div></td>
						<td height="30px" bgcolor="#FFFFFF" class="STYLE19"><div
								align="center"><%=pc.getPchange_id()%></div></td>
						<td bgcolor="#FFFFFF" class="STYLE19"><div
								align="center"><%=pc.getPchange_emp_id() %></div></td>
						<td bgcolor="#FFFFFF" class="STYLE19"><div
								align="center"><%=pc.getPchange_name() %></div></td>
						<td bgcolor="#FFFFFF" class="STYLE19"><div
								align="center"><%=pc.getPchange_time() %></div></td>
						<td  bgcolor="#FFFFFF" class="STYLE19"><div
								align="center"><%=pc.getPchange_pstate()%></div></td>
						<td  bgcolor="#FFFFFF" class="STYLE19"><div
								align="center"><%=pc.getPchange_astate()%></div></td>
						<td bgcolor="#FFFFFF" class="STYLE19"><div
								align="center"><%=pc.getPchange_class()%></div></td>
						 <td  bgcolor="#FFFFFF"><div align="center">
								<span class="STYLE19"><a
									href="${pageContext.request.contextPath}/deletepChange?pchange_id=<%=pc.getPchange_id() %>">删除
								</a> <a href="${pageContext.request.contextPath}/updateInfo?item=update&pchange_id=<%=pc.getPchange_id()%>&pchange_name=<%=pc.getPchange_name()%>&pchange_time=<%=pc.getPchange_time()%>&pchange_pstate=<%=pc.getPchange_pstate()%>&pchange_astate=<%=pc.getPchange_astate()%>&pchange_class=<%=pc.getPchange_class()%>&pchange_emp_id=<%=pc.getPchange_emp_id()%>">更新</a>  </span>
							</div></td>
					</tr>
					
					<%		} 
						}
					%>
				</table>
		</table>	
</body>
</html>
