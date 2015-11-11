<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="com.hrms.doc.entity.*"%>

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
form{ margin:0 auto; width:300px;}
input{margin-top:10px;
font-size:18px;}
.altrow td{
	text-align:center;
}
</style>
</head>

<body>
	<form action="${pageContext.request.contextPath}/baseInfoSearch?item=so" method="post">
	<table>
		<tr>
			<td><select id = "str" name="str">
            	<option  value="e_name">--请选择查询条件--</option>
                <option value="degree">学位</option>
              
                <option value="edu">学历</option>
                <option value="gender">性别</option>
                <option value="status">状态</option>
            </select></td>
			<td><input type="text" name="key" onclick="value='';focus()"/></td>
            <td><input type="submit" value="搜索" onclick="search()"/></td>
		</tr>
		
		
	</table>
	</form>
  
    	<table width="80%" class="datalist" onmouseup="inds()" align="center" border="1px" cellspacing="0px">
    		<tr class="altrow">
    			<td height="30px" bgcolor="#a8c7ce">姓名</td>
    			<td bgcolor="#a8c7ce" >性别</td>
    			<td bgcolor="#a8c7ce" >学历</td>
    			<td bgcolor="#a8c7ce" >学位</td>
    			<td bgcolor="#a8c7ce" >状态</td>
    		</tr>
    		
			    <%
						List<BaseInfo> infos = (List<BaseInfo>)request.getAttribute("infos");
						if(infos != null && infos.size() > 0){
							for(int i = 0;i<infos.size();i++){
			          	  		BaseInfo bi = infos.get(i);
			          %>
					<tr class="altrow">
						<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div
								><%=bi.getE_name()%></div></td>
						<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div
								><%=bi.getGender()%></div></td>
						<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div
							><%=bi.getEducation()%></div></td>
						<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div
								><%=bi.getDegree()%></div></td>
						<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div
							><%=bi.getStatus()%></div></td>
						
					
					<%		} 
						}
					%>
		    	
    	</table>
   
</body>

</html>