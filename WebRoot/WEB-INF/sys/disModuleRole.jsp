<%@page import="com.hrms.commons.utils.Validator"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="com.hrms.sys.entity.*"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>My JSP 'disEmpRole.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<script type="text/javascript">
		function receiveValue(param) {
			document.getElementById("dept").value = param;
		}
		
		//showModalDiaglog窗口打开
		function addRoles() {
			var v = window.open("listRoles.html","","height=400px;width=400px;");
			receiveValue(v);
		}

	</script>

</head>

<body>
	<form action="${pageContext.request.contextPath }/disModuleRoleServlet?item=disRole" method="post">
		<table width="100%" border="0" align="center" cellpadding="0"
			cellspacing="0">
			<tr>
				<td><table width="100%" border="0" cellpadding="0"
						cellspacing="1" bgcolor="#a8c7ce">
						<tr>
							<td width="4%" height="20" bgcolor="d3eaef" class="STYLE10"><div
									align="center">
									<input type="checkbox" name="checkbox" id="checkbox" />
								</div></td>
							<!-- 员工编号 -->
							<td width="12%" height="20" bgcolor="d3eaef" class="STYLE6"><div
									align="center">模块编号</div></td>
							<td width="12%" height="20" bgcolor="d3eaef" class="STYLE6"><div
									align="center">模块名称</div></td>
							<td width="8%" height="20" bgcolor="d3eaef" class="STYLE6"><div
									align="center">角色</div></td>
						</tr>

						<%
							List<Module> modules = (List<Module>) request.getAttribute("modules");
							List<Role> roles = (List<Role>) request.getAttribute("roles");
							if (modules != null && modules.size() > 0) {
								for (int i = 0; i < modules.size(); i++) {
									Module module = modules.get(i);
						%>
						<tr>
							<td height="20" bgcolor="#FFFFFF"><div align="center">
									<input type="checkbox" name="checkbox1" id="checkbox1" />
								</div></td>
							<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div
									align="center"><input type="hidden" name="module_id" value="<%=module.getM_id()%>"><%=module.getM_id()%></div></td>
							<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div
									align="center"><input type="hidden" name="module_name" value="<%=module.getM_name()%>"/><%=module.getM_name()%></div></td>
							<td height="20" bgcolor="#FFFFFF" class="STYLE19">
								<div align="center">
									<select name="moduleRole">
										<option selected="selected">请选择角色
											<%
											for (int j = 0; j < roles.size(); j++) {
														Role role = roles.get(j);
										%>
										
										<option value="<%=role.getRole_id()%>"><%=role.getRole_name()%>
											<%
												}
											%>
										
									</select>
								</div>
							</td>

						</tr>
						<%
							}
							}
						%>
					</table> 
					</table>
					<input type="submit" value="分配"
					style="margin-left: 500px;margin-top:20px;" />
					</form>
</body>
</html>
