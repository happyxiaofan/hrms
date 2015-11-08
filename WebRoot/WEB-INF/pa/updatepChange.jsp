<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="com.hrms.pa.entity.*"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'updatepChange.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<style type="text/css">
form{ margin:0 auto; width:400px;}
input{margin-top:10px;
font-size:18px;}
</style>

  </head>
  
  <body>
  <%
    		pChange pc = (pChange)request.getAttribute("pc");
    		String pchange_id = pc.getPchange_id();
    		String pchange_name = new String(pc.getPchange_name().getBytes("ISO-8859-1"),"utf-8");
    		String pchange_time= pc.getPchange_time();
    		String pchange_pstate= pc.getPchange_pstate();
    		String pchange_astate = pc.getPchange_astate();
    		String pchange_class =pc.getPchange_class();
    		String pchange_emp_id =pc.getPchange_emp_id();
    		
    		
    	 %>
    <form action="${pageContext.request.contextPath}/updatepChange" method="post">
		<table>
			<tr>
				<td>人事调动编号：</td>
				<td><input type="text" name="pchange_id"  value="<%=pchange_id %>"/></td>
			</tr>
			<tr>
				<td>调配人员：</td>
				<td><input type="text" name="pchange_name" value="<%=pchange_name%>"/></td>
			</tr>
			<tr>
				<td>调配时间：</td>
				<td><input type="text" name="pchange_time" value="<%=pchange_time%>"/></td>
			</tr>
			<tr>
				<td>变动前状态： </td>
				<td> <input type="text" name="pchange_pstate" value="<%=pchange_pstate%>" /></td>
			</tr>
			<tr>
				<td>变动后状态：</td>
				<td><input type="text" name="pchange_astate" value="<%=pchange_astate%>" /></td>
			</tr>
			<tr>
				<td>变动类别：</td>
				<td><input type="text" name="pchange_class" value="<%=pchange_class%>"/></td>
			</tr>
			<tr>
				<td>员工ID</td>
				<td><input type="text" name="pchange_emp_id" value="<%=pchange_emp_id%>" /></td>
			</tr>
			<tr>
				<td><input type="submit" value="更新" /></td>
				<td><input type="reset" value="重置"/></td>
			</tr>
		</table>
		
		
	</form>
  </body>
</html>
