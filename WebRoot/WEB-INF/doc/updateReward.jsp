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
			<table border="1px" width="50%" align="center" style="margin-top:30px" cellspacing="0px">
				<tr>
					<td height="30px" bgcolor="#a8c7ce" width="20%">奖惩人员：<input type="hidden" name="rewid" value="<%= rewid %>" /></td>
					<td><div style="margin-left:30px"><input type="text" name="rewname" value="<%= rewname %>" /></div></td>
				</tr>
				<tr>
					<td height="30px" bgcolor="#a8c7ce" >奖惩类型：</td>
					<td> <div style="margin-left:30px"><input type="text" name="rewtype" value="<%= rewtype %>" /></div></td>
				</tr>
				<tr>
					<td height="30px" bgcolor="#a8c7ce" >奖惩时间：</td>
					<td> <div style="margin-left:30px"><input type="text" name="rewdate" value="<%= rewdate %>"/></div></td>
				</tr>
				<tr>
					<td height="30px" bgcolor="#a8c7ce" >奖惩标题：</td>
					<td> <div style="margin-left:30px"><input type="text" name="rewtitle" value="<%= rewtitle %>" /></div></td>
				</tr>
				<tr>
					<td height="30px" bgcolor="#a8c7ce" >奖惩内容：</td>
					<td><div style="margin-left:30px"><input type="text" name="rewcontent" value="<%= rewcontent %>" /></div></td>
				</tr>
				<tr>
					<td height="30px" bgcolor="#a8c7ce" >奖金类别：</td>
					<td><div style="margin-left:30px"><input type="text" name="rewlevel" value="<%= rewlevel %>" /></div></td>
				</tr>
				<tr>
				<td colspan="2"><div style="margin-left:100px"><input type="submit" value="更新" />&nbsp;&nbsp;&nbsp;&nbsp;<input type="reset" value ="重置"/></div></td>
				</tr>
			</table>
	</form>
  </body>
</html>
