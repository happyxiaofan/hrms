<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="com.hrms.doc.entity.*" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'archiveView.jsp' starting page</title>
    
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
a{
	text-decoration:none;
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
				location.href = "archiveServlet?item=edit&pagesize=" + pagesize;
			}
		}
		
		function forward2() {
			var pagenum = document.getElementById("pagenum").value;
			var pagecount = document.getElementById("pagecount").value;
			var pagesize = document.getElementById("pagesize").value;
			if(pagesize!="" && pagenum!="" && parseInt(pagenum)<parseInt(pagecount)) {
				location.href = "archiveServlet?item=edit&pagesize=" + pagesize + "&pagenum=" + pagenum;
			}
		}
	</script>
  </head>
  
  <body>
    <form>
  <input type="hidden" value="${page.recordcount}" id="recordcount" /> 
  <input type="hidden" value="${page.pagecount}" id="pagecount" />
   <table width="100%" border="0" align="center" cellpadding="0"
			cellspacing="0">
			<tr>
				<td>
				<table width="80%" border="0" cellpadding="0" style="margin-top:30px" align="center"
						cellspacing="1" bgcolor="#a8c7ce">
						<tr>
							<td width="4%" height="30" bgcolor="d3eaef" class="STYLE10"><div
									align="center">
									<input type="checkbox" name="checkbox" id="checkbox" />
								</div></td>
							<!-- 员工编号 -->
							<td width="12%" height="20" bgcolor="d3eaef" class="STYLE6"><div
									align="center">档案ID</div></td>
							<td width="8%" height="20" bgcolor="d3eaef" class="STYLE6"><div
									align="center">人员ID</div></td>
							<td width="8%" height="20" bgcolor="d3eaef" class="STYLE6"><div
									align="center">档案编号</div></td>
							<td width="50px" height="20" bgcolor="d3eaef" class="STYLE6"><div
									align="center">档案名称</div></td>
							<td width="16%" height="20" bgcolor="d3eaef" class="STYLE6"><div
									align="center">档案摘要</div></td>
							<td width="5%" height="20" bgcolor="d3eaef" class="STYLE6">
								<div align="center">备注</div>
							</td>
							<td width="50px" height="20" bgcolor="d3eaef" class="STYLE6" ><div
									align="center" class="editArea">
									<span class="STYLE10">基本操作</span>
								</div></td>
							
						</tr>
						<c:forEach items="${archives}" var="archive">
			   				<tr>
			   					<td width="4%" height="30" bgcolor="d3eaef" class="STYLE10"><div
									align="center">
									<input type="checkbox" name="checkbox" id="checkbox" />
								</div></td>
			   					<td height="20" width="50px" bgcolor="#FFFFFF" class="STYLE19"><div
									align="center">${archive.a_id }</div></td>
			   					<td height="20" width="50px" bgcolor="#FFFFFF" class="STYLE19"><div
									align="center">${archive.e_id }</div></td>
			   					<td height="20" width="50px" bgcolor="#FFFFFF" class="STYLE19"><div
									align="center">${archive.a_num }</div></td>
								<td height="20" width="100px" bgcolor="#FFFFFF" class="STYLE19"><div
									align="center">${archive.a_name }</div></td>
								<td height="20" width="50px" bgcolor="#FFFFFF" class="STYLE19"><div
									align="center">${archive.a_sum }</div></td>
								<td height="20" width="50px"bgcolor="#FFFFFF" class="STYLE19"><div
									align="center">${archive.a_note }</div></td>
								<td height="20" bgcolor="#FFFFFF" width="60px"><div align="center" id="editArea">
									<span class="STYLE19"><a
										href="${pageContext.request.contextPath}/archiveServlet?item=delete&a_id=${archive.a_id }">删除
									</a> | <a
										href="${pageContext.request.contextPath}/archiveServlet?item=edit2&a_id=${archive.a_id }&e_id=${archive.a_id }&a_num=${archive.a_num }&a_name=${archive.a_name}&a_sum=${archive.a_sum }&a_note=${archive.a_note}">编辑</a></span>
								</div></td>
			   				</tr>
			   			</c:forEach>
						<!-- 分页 -->
						<tr>
			   				<td colspan="9" align="center" height="30px">
			   					共有${page.recordcount}条记录&nbsp;
			   					每页显示<input type="text" id="pagesize" value="${page.pagesize }" size="2" onblur="forward1()"/>条记录&nbsp;
			   					共有${page.pagecount }页
			   					<c:choose>
			   						<c:when test="${page.pagenum==1}">
			   							首页
			   							上一页
			   						</c:when>
			   						<c:otherwise>
			   							<a href="archiveServlet?item=edit&pagenum=1&pagesize=1" id="pageFirst">首页</a>
			   							<a href="archiveServlet?item=edit&pagenum=${page.pagenum-1}&pagesize=${page.pagesize}">上一页</a>
			   						</c:otherwise>
			   					</c:choose>
			   					<c:choose>
			   						<c:when test="${page.pagenum==page.pagecount}">
			   							下一页
			   							尾页
			   						</c:when>
			   						<c:otherwise>
			   							<a href="archiveServlet?item=edit&pagenum=${page.pagenum+1}&pagesize=${page.pagesize}">下一页</a>
			   							<a href="archiveServlet?item=edit&pagenum=${page.pagecount}&pagesize=${page.pagesize}">尾页</a>
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
