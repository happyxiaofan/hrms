<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.hrms.edu.entity.Score"%>
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
		.btn input{
			width:60px;
			height:20px;
		}
		.tbl{
			margin:30px;
		}
	</style>
	
  </head>
  	<body>
  	<div align="center">
  	<table width="80%" height="200" border="1" cellpadding="0" cellspacing="0" class="tbl">
  		<tr bgcolor="#d3eaef"><th colspan="7" align="center" color="#001213">成绩查询表</th></tr>
  		<tr align="center">
  			<td><input type="checkbox"></td>
  			<td>序号</td>
  			<td>人员姓名</td>
  			<td>课程</td>
  			<td>成绩</td>
 		</tr>
  			<%
				List<Score> scores = (List<Score>)request.getAttribute("scores");
				for(int i = 0;i<scores.size();i++){
	          	  Score score = scores.get(i);
			%>
			<tr>
				<td height="20" bgcolor="#FFFFFF">
					<div align="center">
						<input type="checkbox" name="checkbox1" id="checkbox1" />
					</div>
				</td>
				<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div
						align="center"><%=score.getsId()%></div></td>
				<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div
						align="center"><%=score.getsName() %></div></td>
				<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div
						align="center"><%=score.getsClass() %></div></td>
				<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div
						align="center"><%=score.getsScore() %></div></td>
			</tr>
			<%} %>
 		<!-- <tr>
 			<td colspan="2">共有120条记录，当前第1/10页</td>
 			<td colspan="3" align="right"><div class="btn"><input type="button" value="首页">
 				<input type="button" value="上一页" >
 				<input type="button" value="下一页">
 				<input type="button" value="尾页">
 				转到第<input type="text" size="2">页
 				<input type="button" value="前往">
 				</div>
			</td>
 		</tr> -->
  	</table>
  	</div>
  </body>
</html>
