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
    
    <title>My JSP 'baseInfoView.jsp' starting page</title>
    
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
a{text-decoration: none;}
</style>
<script type="text/javascript">
		
		function forward1() {
			var pagesize = document.getElementById("pagesize").value;
			var recordcount = document.getElementById("recordcount").value;
			if(pagesize!="" && parseInt(pagesize)<parseInt(recordcount)) {
				location.href = "RecordActionServlet?method=forwardEdit&entity=record&edit="+editAreaValue()+"&pagesize=" + pagesize;
			}
		}
		
		function forward2() {
			var pagenum = document.getElementById("pagenum").value;
			var pagecount = document.getElementById("pagecount").value;
			var pagesize = document.getElementById("pagesize").value;
			if(pagesize!="" && pagenum!="" && parseInt(pagenum)<parseInt(pagecount)) {
				location.href = "RecordActionServlet?method=forwardEdit&entity=record&edit="+editAreaValue()+"&pagesize=" + pagesize + "&pagenum=" + pagenum;
			}
		}
		
		function editAreaValue(){
			return document.getElementById("editValue").value;
		}
		
		window.onload = function(){
			var editValue = document.getElementById("editValue").value;
			if(editValue=="view"){
				var editArea = document.getElementById("editArea");
				editArea.style.display="none";
			}else{
				
			}
		}
	</script>
  </head>
  
  <body>
  <form>
  <input type="hidden" value="${page.recordcount}" id="recordcount" /> 
  <input type="hidden" value="${page.pagecount}" id="pagecount" />
  <input type="hidden" value="${edit}" id="editValue"/>
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
									align="center">部门</div></td>
							<td width="8%" height="20" bgcolor="d3eaef" class="STYLE6"><div
									align="center">职位</div></td>
							<td width="8%" height="20" bgcolor="d3eaef" class="STYLE6"><div
									align="center">学历</div></td>
							<td width="15%" height="20" bgcolor="d3eaef" class="STYLE6"><div
									align="center">工作内容</div></td>
							<td width="16%" height="20" bgcolor="d3eaef" class="STYLE6"><div
									align="center">开始时间</div></td>
							<td width="15%" height="20" bgcolor="d3eaef" class="STYLE6">
								<div align="center">结束时间</div>
							</td>
							<td width="50px" height="20" bgcolor="d3eaef" class="STYLE6" ><div
									align="center" class="editArea">
									<span class="STYLE10">基本操作</span>
								</div></td>
								
						</tr>
						<c:forEach items="${records}" var="record">
			   				<tr>
			   					<td width="4%" height="30" bgcolor="d3eaef" class="STYLE10"><div
									align="center">
									<input type="checkbox" name="checkbox" id="checkbox" />
								</div></td>
			   					<td height="20" width="50px" bgcolor="#FFFFFF" class="STYLE19"><div
									align="center">${record.dept }</div></td>
			   					<td height="20" width="50px" bgcolor="#FFFFFF" class="STYLE19"><div
									align="center">${record.job }</div></td>
			   					<td height="20" width="50px" bgcolor="#FFFFFF" class="STYLE19"><div
									align="center">${record.edu }</div></td>
								<td height="20" width="100px" bgcolor="#FFFFFF" class="STYLE19"><div
									align="center">${record.work }</div></td>
								<td height="20" width="50px" bgcolor="#FFFFFF" class="STYLE19"><div
									align="center">${record.start }</div></td>
								<td height="20" width="50px"bgcolor="#FFFFFF" class="STYLE19"><div
									align="center">${record.end }</div></td>
								<td height="20" bgcolor="#FFFFFF" width="60px"><div align="center" id="editArea">
									<span class="STYLE19"><a
										href="${pageContext.request.contextPath}/RecordActionServlet?method=deleteRecord&entity=record&dept=${record.dept}">删除
									</a> | <a
										href="${pageContext.request.contextPath}/RecordActionServlet?method=updateRecord&entity=record">编辑</a></span>
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
			   							<a href="RecordActionServlet?method=forwardEdit&entity=record&edit=${editValue}&pagenum=1&pagesize=15" id="pageFirst">首页</a>
			   							<a href="RecordActionServlet?method=forwardEdit&entity=record&edit=${editValue}&pagenum=${page.pagenum-1}&pagesize=${page.pagesize}">上一页</a>
			   						</c:otherwise>
			   					</c:choose>
			   					<c:choose>
			   						<c:when test="${page.pagenum==page.pagecount}">
			   							下一页
			   							尾页
			   						</c:when>
			   						<c:otherwise>
			   							<a href="RecordActionServlet?method=forwardEdit&entity=record&edit=${editValue}&pagenum=${page.pagenum+1}&pagesize=${page.pagesize}">下一页</a>
			   							<a href="RecordActionServlet?method=forwardEdit&entity=record&edit=${editValue}&pagenum=${page.pagecount}&pagesize=${page.pagesize}">尾页</a>
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
