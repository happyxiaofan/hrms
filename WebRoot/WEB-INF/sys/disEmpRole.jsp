<%@page import="com.hrms.commons.utils.Validator"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="com.hrms.sys.entity.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
		
		function forward1() {
			var pagesize = document.getElementById("pagesize").value;
			var recordcount = document.getElementById("recordcount").value;
			if(pagesize!="" && parseInt(pagesize)<parseInt(recordcount)) {
				location.href = "disEmpRoleServlet?item=dis&pagesize=" + pagesize;
			}
		}
		
		function forward2() {
			var pagenum = document.getElementById("pagenum").value;
			var pagecount = document.getElementById("pagecount").value;
			var pagesize = document.getElementById("pagesize").value;
			if(pagesize!="" && pagenum!="" && parseInt(pagenum)<parseInt(pagecount)) {
				location.href = "disEmpRoleServlet?item=dis&pagesize=" + pagesize + "&pagenum=" + pagenum;
			}
		}
	</script>
</head>

<body>
	<form action="${pageContext.request.contextPath }/disEmpRoleServlet?item=disRole" method="post">
		<input type="hidden" value="${page.recordcount}" id="recordcount" /> 
		<input type="hidden" value="${page.pagecount}" id="pagecount" />
		<table width="100%" border="0" align="center" cellpadding="0"
			cellspacing="0">
			<tr>
				<td><table width="100%" border="0" cellpadding="0"
						cellspacing="1" bgcolor="#a8c7ce">
						<tr>
							<td width="1%" height="20" bgcolor="d3eaef" class="STYLE10"><div
									align="center">
									<input type="checkbox" name="checkbox" id="checkbox" />
								</div></td>
							<!-- 员工编号 -->
							<td width="12%" height="20" bgcolor="d3eaef" class="STYLE6"><div
									align="center">员工编号</div></td>
							<td width="12%" height="20" bgcolor="d3eaef" class="STYLE6"><div
									align="center">姓名</div></td>
							<td width="8%" height="20" bgcolor="d3eaef" class="STYLE6"><div
									align="center">角色</div></td>
						</tr>

						<%-- <%
							List<Employee> emps = (List<Employee>) request.getAttribute("emps");
							List<Role> roles = (List<Role>) request.getAttribute("roles");
							if (emps != null && emps.size() > 0) {
								for (int i = 0; i < emps.size(); i++) {
									Employee emp = emps.get(i);
						%>
						<tr>
							<td height="20" bgcolor="#FFFFFF"><div align="center">
									<input type="checkbox" name="checkbox1" id="checkbox1" />
								</div></td>
							<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div
									align="center"><input type="hidden" name="e_id" value="<%=emp.getE_id()%>"><%=emp.getE_id()%></div></td>
							<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div
									align="center"><input type="hidden" name="e_name" value="<%=emp.getEname()%>"/><%=emp.getEname()%></div></td>
							<td height="20" bgcolor="#FFFFFF" class="STYLE19">
								<div align="center">
									<select name="empRole">
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
						%> --%>
						
						<c:forEach items="${pList}" var="p">
			   				<tr>
			   					<td width="4%" height="20" bgcolor="d3eaef" class="STYLE10"><div
									align="center">
									<input type="checkbox" name="checkbox" id="checkbox" />
								</div></td>
			   					<td height="20" width="12%" bgcolor="#FFFFFF" class="STYLE19"><div
									align="center"><input type="hidden" name="e_id" value="${p.e_id }">${p.e_id }</div></td>
			   					<td height="20" width="12%" bgcolor="#FFFFFF" class="STYLE19"><div
									align="center"><input type="hidden" name="e_name" value="${p.ename }">${p.ename }</div></td>
			   					<td height="20" width="8%" bgcolor="#FFFFFF" class="STYLE19">
				   					<div align="center">
				   						<select name="empRole">
				   							<option selected="selected">请选择角色
					   						<c:forEach items="${roles }" var="role">
												<option value="${role.role_id }">${role.role_name }
					   						</c:forEach>
				   						</select>
									</div>
								</td>
								
			   				</tr>
			   			</c:forEach>
						<!-- 分页 -->
						<tr>
			   				<td colspan="5" align="center">
			   					共有${page.recordcount}条记录&nbsp;
			   					每页显示<input type="text" id="pagesize" value="${page.pagesize }" size="2" onblur="forward1()"/>条记录&nbsp;
			   					共有${page.pagecount }页
			   					<c:choose>
			   						<c:when test="${page.pagenum==1}">
			   							首页
			   							上一页
			   						</c:when>
			   						<c:otherwise>
			   							<a href="disEmpRoleServlet?item=dis&pagenum=1&pagesize=10" id="pageFirst">首页</a>
			   							<a href="disEmpRoleServlet?item=dis&pagenum=${page.pagenum-1}&pagesize=${page.pagesize}">上一页</a>
			   						</c:otherwise>
			   					</c:choose>
			   					<c:choose>
			   						<c:when test="${page.pagenum==page.pagecount}">
			   							下一页
			   							尾页
			   						</c:when>
			   						<c:otherwise>
			   							<a href="disEmpRoleServlet?item=dis&pagenum=${page.pagenum+1}&pagesize=${page.pagesize}">下一页</a>
			   							<a href="disEmpRoleServlet?item=dis&pagenum=${page.pagecount}&pagesize=${page.pagesize}">尾页</a>
			   						</c:otherwise>
			   					</c:choose>
			   					
			   					跳转到第<input type="text" value="${page.pagenum }" size="2" id="pagenum" onblur="forward2()"/>页
			   				</td>
			   			</tr>
					</table> 
					</table>
					<input type="submit" value="分配"
					style="margin-left: 500px;margin-top:20px;" />
		</form>
</body>
</html>
