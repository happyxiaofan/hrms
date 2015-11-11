<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="com.hrms.pa.entity.*"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
<style type="text/css">
form {
	margin: 0 auto;
	width: 300px;
}

input {
	margin-top: 10px;
	font-size: 18px;
}
.altrow-1 td{
	text-align:center;

}
.altrow td{
	text-align:center;
}
</style>
</head>

<body>
	<form action="${pageContext.request.contextPath}/paInfoServlet"
		method="post">
		<table align="left" >
			<tr>
				<td><select id="str" name="str">
						<option value="e_name">--请选择查询条件--</option>
						<option value="job">岗位</option>

						<option value="post">职称</option>

				</select></td>
				<td><input type="text" name="key" onclick="value='';focus()" /></td>
				<td><input type="submit" value="搜索" onclick="search()" /></td>
			</tr>


		</table>
	</form>

	<table class="datalist" onmouseup="inds()" border="1px" width="80%" cellspacing="0px" align="center">
		<tr class="altrow-1">

			<td height="30px" 	bgcolor="#a8c7ce">姓名</td>
			<td bgcolor="#a8c7ce">职称</td>
			<td bgcolor="#a8c7ce">岗位</td>
			<td bgcolor="#a8c7ce">变动时间</td>
			<td bgcolor="#a8c7ce">变动前状态</td>
			<td bgcolor="#a8c7ce">变动后状态</td>
			<td bgcolor="#a8c7ce">变动原因</td>

		</tr>

		<%
    					    	List<PaInfo> painfos = (List<PaInfo>)request.getAttribute("painfos");
    					    				if(painfos != null && painfos.size() > 0){
    					    					for(int i = 0;i<painfos.size();i++){
    					    	          	  		PaInfo pf = painfos.get(i);
    					    %>
		<tr class="altrow">

			<td height="30" bgcolor="#FFFFFF" class="STYLE19"><div
					><%=pf.getE_name()%></div></td>
			<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div
					><%=pf.getPost()%></div></td>
			<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div
					><%=pf.getJob()%></div></td>
			<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div
					><%=pf.getPchange_time()%></div></td>
			<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div
					><%=pf.getPchange_pstate()%></div></td>
			<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div
					><%=pf.getPchange_astate()%></div></td>
			<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div
					><%=pf.getPchange_reason()%></div></td>

		</tr>

			<%		} 
						}
					%>
	</table>

</body>
</html>