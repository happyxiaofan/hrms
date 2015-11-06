<%@page import="com.hrms.sys.entity.Employee"%>
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
<script type="text/javascript">
		
		function forward1() {
			var pagesize = document.getElementById("pagesize").value;
			var recordcount = document.getElementById("recordcount").value;
			if(pagesize!="" && parseInt(pagesize)<parseInt(recordcount)) {
				location.href = "listEmployeeServlet?pagesize=" + pagesize;
			}
		}
		
		function forward2() {
			var pagenum = document.getElementById("pagenum").value;
			var pagecount = document.getElementById("pagecount").value;
			var pagesize = document.getElementById("pagesize").value;
			if(pagesize!="" && pagenum!="" && parseInt(pagenum)<parseInt(pagecount)) {
				location.href = "listEmployeeServlet?pagesize=" + pagesize + "&pagenum=" + pagenum;
			}
		}
	</script>
</head>

<body>
	<form>
		<input type="hidden" value="${page.recordcount}" id="recordcount" /> <input
			type="hidden" value="${page.pagecount}" id="pagecount" />
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
							<td width="12%" height="20" bgcolor="d3eaef" class="STYLE6"><div
									align="center">员工编号</div></td>
							<td width="12%" height="20" bgcolor="d3eaef" class="STYLE6"><div
									align="center">姓名</div></td>
							<td width="8%" height="20" bgcolor="d3eaef" class="STYLE6"><div
									align="center">角色</div></td>
							<td width="19%" height="20" bgcolor="d3eaef" class="STYLE6"><div
									align="center">
									<span class="STYLE10">联系方式</span>
								</div></td>
							<td width="16%" height="20" bgcolor="d3eaef" class="STYLE6"><div
									align="center">所在部门</div></td>
							<td width="20%" height="20" bgcolor="d3eaef" class="STYLE6">
								<div align="center">职位</div>
							</td>
						</tr>

						<%-- <%
							List<Employee> emps = (List<Employee>) request.getAttribute("emps1");
							if (emps != null && emps.size() > 0) {
								for (int i = 0; i < emps.size(); i++) {
									Employee emp = emps.get(i);
						%>
						<tr>
							<td height="20" bgcolor="#FFFFFF"><div align="center">
									<input type="checkbox" name="checkbox1" id="checkbox1" />
								</div></td>
							<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div
									align="center"><%=emp.getE_id()%></div></td>
							<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div
									align="center"><%=emp.getEname()%></div></td>
							<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div
									align="center">男</div></td>
							<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div
									align="center"><%=emp.getPwd()%></div></td>
							<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div
									align="center">11210A02</div></td>
							<td height="20" bgcolor="#FFFFFF" class="STYLE19">
								<div lign="center">
									<%=emp.getEmp_role_name()%>
								</div>
							</td>
							<td height="20" bgcolor="#FFFFFF"><div align="center">
									<span class="STYLE19"><a
										href="${pageContext.request.contextPath}/deleteEmp?e_id=<%=emp.getE_id() %>">删除
									</a>| <a
										href="${pageContext.request.contextPath}/addEmp?item=view&e_id=<%=emp.getE_id() %>&e_name=<%=emp.getEname() %>&passwd=<%=emp.getPwd() %>">查看</a></span>
								</div></td>
						</tr>
						<%
							}
							}
						%> --%>
						<c:forEach items="${pList2}" var="p">
			   				<tr>
			   					<td width="4%" height="20" bgcolor="d3eaef" class="STYLE10"><div
									align="center">
									<input type="checkbox" name="checkbox" id="checkbox" />
								</div></td>
			   					<td height="20" width="12%" bgcolor="#FFFFFF" class="STYLE19"><div
									align="center">${p.e_id }</div></td>
			   					<td height="20" width="12%" bgcolor="#FFFFFF" class="STYLE19"><div
									align="center">${p.ename }</div></td>
			   					<td height="20" width="8%" bgcolor="#FFFFFF" class="STYLE19"><div
									align="center">${p.emp_role_name }</div></td>
								<td height="20" width="19%" bgcolor="#FFFFFF" class="STYLE19"><div
									align="center">男</div></td>
								<td height="20" width="16%" bgcolor="#FFFFFF" class="STYLE19"><div
									align="center">男</div></td>
								<td height="20" width="20%"bgcolor="#FFFFFF" class="STYLE19"><div
									align="center">男</div></td>
								
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
			   							<a href="listEmployeeServlet?pagenum=1&pagesize=10" id="pageFirst">首页</a>
			   							<a href="listEmployeeServlet?pagenum=${page.pagenum-1}&pagesize=${page.pagesize}">上一页</a>
			   						</c:otherwise>
			   					</c:choose>
			   					<c:choose>
			   						<c:when test="${page.pagenum==page.pagecount}">
			   							下一页
			   							尾页
			   						</c:when>
			   						<c:otherwise>
			   							<a href="listEmployeeServlet?pagenum=${page.pagenum+1}&pagesize=${page.pagesize}">下一页</a>
			   							<a href="listEmployeeServlet?pagenum=${page.pagecount}&pagesize=${page.pagesize}">尾页</a>
			   						</c:otherwise>
			   					</c:choose>
			   					
			   					跳转到第<input type="text" value="${page.pagenum }" size="2" id="pagenum" onblur="forward2()"/>页
			   				</td>
			   			</tr>
					</table>
		</table>
	</form>
</body>
</html>
