<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<%@ page import="com.hrms.doc.manager.*"  %>
<%@ page import="com.hrms.doc.entity.Reward" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
<style type="text/css">
<!--
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
.STYLE6 {color: #000000; font-size: 12; }
.STYLE10 {color: #000000; font-size: 12px; }
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
-->
</style>
</head>

<body>
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td><table width="80%" border="0" cellpadding="0" cellspacing="1" bgcolor="#a8c7ce" style="margin-top:30px" align="center">
      <tr>
        <td width="4%" height="30" bgcolor="d3eaef" class="STYLE10"><div align="center">
          <input type="checkbox" name="checkbox" id="checkbox" />
        </div></td>
        <td width="10%" height="20" bgcolor="d3eaef" class="STYLE6"><div align="center">奖惩人员</div></td>
        <td width="10%" height="20" bgcolor="d3eaef" class="STYLE6"><div align="center">奖惩类型</div></td>
        <td width="10%" height="20" bgcolor="d3eaef" class="STYLE6"><div align="center">奖惩时间</div></td>
        <td width="15%" height="20" bgcolor="d3eaef" class="STYLE6"><div align="center">奖惩标题</div></td>
        <td width="15%" height="20" bgcolor="d3eaef" class="STYLE6"><div align="center">奖惩内容</div></td>
        <td width="15%" height="20" bgcolor="d3eaef" class="STYLE6"><div align="center">奖金类别</div></td>
        <td width="20%" height="20" bgcolor="d3eaef" class="STYLE6"><div align="center"><span class="STYLE10">基本操作</span></div></td>
      </tr>
        
     <%
			List<Reward> res = (List<Reward>)request.getAttribute("res");
			if(res != null && res.size() > 0){
				for(int i = 0;i<res.size();i++){
	         	  		Reward reward1 = res.get(i);
	 %>
      <tr>
        <td height="30" bgcolor="#FFFFFF"><div align="center">
          <input type="checkbox" name="checkbox1" id="checkbox1" />
        </div></td>
        <td height="20" bgcolor="#FFFFFF" class="STYLE19"><div align="center"><%= reward1.getRewname()%></div></td>
        <td height="20" bgcolor="#FFFFFF" class="STYLE19"><div align="center"><%= reward1.getRewtype()%></div></td>
        <td height="20" bgcolor="#FFFFFF" class="STYLE19"><div align="center"><%= reward1.getRewdate()%></div></td>
        <td height="20" bgcolor="#FFFFFF" class="STYLE19"><div align="center"><%= reward1.getRewtitle()%></div></td>
        <td height="20" bgcolor="#FFFFFF" class="STYLE19"><div align="center"><%= reward1.getRewcontent()%></div></td>
        <td height="20" bgcolor="#FFFFFF" class="STYLE19"><div align="center"><%= reward1.getRewlevel()%></div></td>
        <td height="20" bgcolor="#FFFFFF"><div align="center"><div class="STYLE21">
			<a href="${pageContext.request.contextPath }/listRewardServlet?item=delete&id=<%=reward1.getRewid()%>">删除</a>| 
			<a href="${pageContext.request.contextPath }/listRewardServlet?item=update&rewid=<%= reward1.getRewid()%>">修改</a>
		</div></td>
      </tr>
           <% } 
				}%> 
  
    </table></td>
  </tr>
</table>
</body>
</html>
