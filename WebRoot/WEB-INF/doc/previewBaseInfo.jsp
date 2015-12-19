<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="com.hrms.doc.entity.*" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath%>">

<title>My JSP 'baseInfoAdd.jsp' starting page</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style type="text/css">
	table.altrowstable {
		font-family: verdana, arial, sans-serif;
		font-size: 11px;
		color: #333333;
		border-width: 1px;
		border-color: #a9c6c9;
		border-collapse: collapse;
	}
	
	table.altrowstable th {
		border-width: 1px;
		padding: 8px;
		border-style: solid;
		border-color: #a9c6c9;
	}
	
	table.altrowstable td {
		border-width: 1px;
		padding: 8px;
		border-style: solid;
		border-color: #a9c6c9;
	}
	
	.oddrowcolor {
		background-color: #d4e3e5;
	}
	
	.evenrowcolor {
		background-color: #c3dde0;
	}
	
</style>
</head>

<body>
	<form>
		<table align="center" class="altrowstable">
			<tr>
				<td height="47" colspan="5"><h2>基本信息</h2></td>
			</tr>
			<tr>
				<td height="158">姓名</td>
				<td>${baseInfo.e_name }</td>
				<td>性别</td>
				<td width="">${baseInfo.gender }
				<td rowspan="2">
					<img src="${baseInfo.pic_path }"/>
				</td>
			</tr>
			<tr>
				<td height="141">学历</td>
				<td>${baseInfo.edu }</td>
				<td>学位</td>
				<td>${baseInfo.degree }</td>
			</tr>
			<tr>
				<td height="44">部门</td>
				<td>${baseInfo.dept }</td>
				<td>职位</td>
				<td>${baseInfo.job }</td>
                <td height="44"></td>
			</tr>
			<tr>
				<td height="140">职称</td>
				<td>${baseInfo.title }</td>
				<td>人员状态</td>
				<td>${baseInfo.status }</td>
				<td><%BaseInfoVo vo  = (BaseInfoVo)request.getSession().getAttribute("baseInfo"); 
						%>
						<%=vo.getPic_path() %></td>
			</tr>
		</table>
	</form>
</body>
</html>

