<%@ page import="com.hrms.sys.entity.*" %>
<%@page import="com.hrms.commons.utils.Validator"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'listModule.jsp' starting page</title>
    
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
			<td height="30"><table width="100%" border="0" cellspacing="0"
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
														管理人员基本信息列表</span></td>
											</tr>
										</table></td>
									<td><div align="right">
											<span class="STYLE1"> <input type="checkbox"
												name="checkbox11" id="checkbox11" /> 全选 &nbsp;&nbsp;<img
												src="res/images/add.gif" width="10" height="10" /> 添加
												&nbsp; <img src="res/images/del.gif" width="10" height="10" />
												删除 &nbsp;&nbsp;<img src="res/images/edit.gif" width="10"
												height="10" /> 编辑 &nbsp;
											</span><span class="STYLE1"> &nbsp;</span>
										</div></td>
								</tr>
							</table></td>
					</tr>
				</table></td>
		</tr>
		<tr>
			<td><table width="100%" border="0" cellpadding="0"
					cellspacing="1" bgcolor="#a8c7ce">
					<tr>
						<td width="4%" height="20" bgcolor="d3eaef" class="STYLE10"><div
								align="center">
								<input type="checkbox" name="checkbox" id="checkbox" />
							</div></td>
						<td width="12%" height="20" bgcolor="d3eaef" class="STYLE6"><div
								align="center">模块编号</div></td>
						<td width="12%" height="20" bgcolor="d3eaef" class="STYLE6"><div
								align="center">模块名称</div></td>
						<td width="21%" height="20" bgcolor="d3eaef" class="STYLE6"><div
								align="center">
								<span class="STYLE10">基本操作</span>
							</div></td>
					</tr>
					
					 <%
						List<Module> modules = (List<Module>)request.getAttribute("modules");
						if(Validator.isValid(modules)){
							for(int i = 0;i<modules.size();i++){
			          	  		Module module = modules.get(i);
					%>
					<tr>
						<td height="20" bgcolor="#FFFFFF"><div align="center">
								<input type="checkbox" name="checkbox1" id="checkbox1" />
							</div></td>
						<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div
								align="center"><%=module.getM_id()%></div></td>
						<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div
								align="center"><%=module.getM_name()%></div></td>
						
						<td height="20" bgcolor="#FFFFFF"><div align="center">
								<span class="STYLE19"><a href="${pageContext.request.contextPath}/moduleServlet?item=deleteModule&m_id=<%=module.getM_id() %>">删除 </a>| <a
									href="${pageContext.request.contextPath}/moduleServlet?item=view&m_id=<%=module.getM_id() %>&m_name=<%=module.getM_name() %>">查看</a></span>
							</div></td>
					</tr>
					<%		} 
						}
					%>
					
				</table>
  </body>
</html>
