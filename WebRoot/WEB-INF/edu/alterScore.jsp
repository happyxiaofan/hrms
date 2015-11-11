<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.hrms.edu.entity.Score"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>成绩查询表</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<style>
.btn input {
	width: 60px;
	height: 20px;
}

.tbl {
	margin: 30px;
}
</style>
<script type="text/javascript">
	function forward1() {
		var pagesize = document.getElementById("pagesize").value;
		var recordcount = document.getElementById("recordcount").value;
		if (pagesize != "" && parseInt(pagesize) <= parseInt(recordcount)) {
			location.href = "listScoreServlet?item=edit&pagesize=" + pagesize;
		}
	}

	function forward2() {
		var pagenum = document.getElementById("pagenum").value;
		var pagecount = document.getElementById("pagecount").value;
		var pagesize = document.getElementById("pagesize").value;
		if (pagesize != "" && pagenum != ""
				&& parseInt(pagenum) <= parseInt(pagecount)) {
			location.href = "listScoreServlet?item=edit&pagesize=" + pagesize
					+ "&pagenum=" + pagenum;
		}
	}
</script>
</head>
<body>
	<input type="hidden" value="${page.recordcount}" id="recordcount" />
	<input type="hidden" value="${page.pagecount}" id="pagecount" />
	<div align="center">
		<table width="80%" height="200" border="1" cellpadding="0"
			cellspacing="0" class="tbl">
			<tr bgcolor="#d3eaef">
				<th colspan="8" align="center" height="30px" bgcolor="#d3eaef">成绩查询表</th>
			</tr>
			<tr align="center">
				<td height="30px"><input type="checkbox"></td>
				<td>序号</td>
				<td>人员姓名</td>
				<td>课程</td>
				<td>成绩</td>
				<td>操作</td>
			</tr>
			<%
				List<Score> scores = (List<Score>) request.getAttribute("scores");
				for (int i = 0; i < scores.size(); i++) {
					Score score = scores.get(i);
			%>
			<tr>
				<td height="20" bgcolor="#FFFFFF">
					<div align="center">
						<input type="checkbox" name="checkbox1" id="checkbox1" />
					</div>
				</td>
				<td height="30px" bgcolor="#FFFFFF" class="STYLE19"><div
						align="center"><%=score.getsId()%></div></td>
				<td bgcolor="#FFFFFF" class="STYLE19"><div
						align="center"><%=score.getsName()%></div></td>
				<td bgcolor="#FFFFFF" class="STYLE19"><div
						align="center"><%=score.getsClass()%></div></td>
				<td bgcolor="#FFFFFF" class="STYLE19"><div
						align="center"><%=score.getsScore()%></div></td>
				<td bgcolor="#FFFFFF">
					<div align="center">
						<span class="STYLE19"> <a
							href="${pageContext.request.contextPath}/deleteScoreServlet?sId=<%=score.getsId() %>">
								删除 </a>| <a
							href="${pageContext.request.contextPath}/listEduServlet?item=update&sId=<%=score.getsId()%>
							&sName=<%=score.getsName()%>&sClass=<%=score.getsClass()%>&sScore=<%=score.getsScore()%>">
								修改 </a>
						</span>
					</div>
				</td>
			</tr>
			<%
				}
			%>
			<!-- <tr>
 			<td colspan="2">共有120条记录，当前第1/10页</td>
 			<td colspan="4" align="right"><div class="btn"><input type="button" value="首页">
 				<input type="button" value="上一页" >
 				<input type="button" value="下一页">
 				<input type="button" value="尾页">
 				转到第<input type="text" size="2">页
 				<input type="button" value="前往">
 				</div>
			</td>
 		</tr> -->
			<tr>
				<td colspan="6" align="center">共${page.recordcount}条记录&nbsp;
					每页<input type="text" id="pagesize" value="${page.pagesize }"
					size="2" onblur="forward1()" />条记录&nbsp; 共${page.pagecount }页 <c:choose>
						<c:when test="${page.pagenum==1}">
			   							首页
			   							上一页
			   						</c:when>
						<c:otherwise>
							<a href="listScoreServlet?item=edit&pagenum=1&pagesize=10"
								id="pageFirst">首页</a>
							<a
								href="listScoreServlet?item=edit&pagenum=${page.pagenum-1}&pagesize=${page.pagesize}">上一页</a>
						</c:otherwise>
					</c:choose> <c:choose>
						<c:when test="${page.pagenum==page.pagecount}">
			   							下一页
			   							尾页
			   						</c:when>
						<c:otherwise>
							<a
								href="listScoreServlet?item=edit&pagenum=${page.pagenum+1}&pagesize=${page.pagesize}">下一页</a>
							<a
								href="listScoreServlet?item=edit&pagenum=${page.pagecount}&pagesize=${page.pagesize}">尾页</a>
						</c:otherwise>
					</c:choose> 跳转到第<input type="text" value="${page.pagenum }" size="2"
					id="pagenum" onblur="forward2()" />页
				</td>
			</tr>
		</table>
	</div>
</body>
</html>
