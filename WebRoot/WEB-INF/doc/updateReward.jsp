<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<%@ page import="com.hrms.doc.manager.*"  %>
<%@ page import="com.hrms.doc.entity.Reward" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'hr_updaterewardpunish.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
  
  <%
    		Reward rew = (Reward)request.getAttribute("rew");
    		String rewid= rew.getRewid();
    		String rewname = rew.getRewname();
    		String rewtype = rew.getRewtype();
    		String rewdate = rew.getRewdate();
    		String rewtitle = rew.getRewtitle();
    		String rewcontent = rew.getRewcontent();
    		String rewlevel = rew.getRewlevel();
    		
    	 %>
   			<form action="${pageContext.request.contextPath}/listRewardServlet?item=updateReward" method="post">
			<table>
				<tr>
					<td>奖惩人员：<input type="hidden" name="rewid" value="<%= rewid %>" /></td>
					<td><input type="text" name="rewname" value="<%= rewname %>" /></td>
				</tr>
				<tr>
					<td>奖惩类型：</td>
					<td><input type="text" name="rewtype" value="<%= rewtype %>" /></td>
				</tr>
				<tr>
					<td>奖惩时间：</td>
					<td><input type="text" name="rewdate" value="<%= rewdate %>"/></td>
				</tr>
				<tr>
					<td>奖惩标题：</td>
					<td><input type="text" name="rewcontent" value="<%= rewtitle %>" /></td>
				</tr>
				<tr>
					<td>奖惩内容：</td>
					<td><input type="text" name="rewcontent" value="<%= rewcontent %>" /></td>
				</tr>
				<tr>
					<td>奖金类别：</td>
					<td><input type="text" name="rewlevel" value="<%= rewlevel %>" /></td>
				</tr>
				<tr>
				<td colspan="2" align="center"><input type="submit" value="更新" />&nbsp;&nbsp;&nbsp;&nbsp;<input type="reset" value ="重置"/></td>
				</tr>
			</table>
	</form>
  </body>
</html>
