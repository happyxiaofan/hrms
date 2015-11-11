<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.hrms.edu.entity.Cert" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<% 
List<Cert> certs = (List<Cert>)request.getAttribute("certs");
int lastCertLine = certs.size() - 1;
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>添加修改证书</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script type="text/javascript">
		window.onload = getLen();
		function getLen(){
			var va = document.getElementById("len").value;
			return va;
		}
		
		function addCert(){
			var va = getLen();
			var v = parseInt(va);
			v = v +1;
			var tableCert = document.getElementById("tableCert");
			var nextTr = document.createElement("tr");
			
			var tdC = document.getElementById("tdC");
			var nextTd1 = tdC.cloneNode(true);
			var nextTd2 = tdC.cloneNode(true);
			var nextTd3 = tdC.cloneNode(true);
			var nextTd4 = tdC.cloneNode(true);
			var nextTd5 = tdC.cloneNode(true);
			
			nextTd1.childNodes[0].setAttribute("type","text");
			nextTd2.childNodes[0].setAttribute("type","text");
			nextTd3.childNodes[0].setAttribute("type","text");
			nextTd4.childNodes[0].setAttribute("type","text");
			nextTd5.childNodes[0].setAttribute("type","text");
			
			nextTd1.removeAttribute("value");
			nextTd2.removeAttribute("value");
			nextTd3.removeAttribute("value");
			nextTd4.removeAttribute("value");
			nextTd5.removeAttribute("value");
			
			nextTd1.removeChild(nextTd1.firstChild);
			nextTd1.childNodes[0].textContent=v+1;
			
			nextTd2.removeChild(nextTd2.childNodes[1]);
			nextTd3.removeChild(nextTd3.childNodes[1]);
			nextTd4.removeChild(nextTd4.childNodes[1]);
			nextTd5.removeChild(nextTd5.childNodes[1]);
			
			nextTr.appendChild(nextTd1);
			nextTr.appendChild(nextTd2);
			nextTr.appendChild(nextTd3);
			nextTr.appendChild(nextTd4);
			nextTr.appendChild(nextTd5);
			
			nextTr.setAttribute("id", "nextTr"+v);
			alert(nextTr.getAttribute("id"));
			
			tableCert.appendChild(nextTr);
			var tt = nextTr.getAttribute("id");
			return tt;
		}
		
		function submit(){
			 var nextTr= addCert();
			 alert(nextTr);
			 var tds = nextTr.childNodes;
				int len= tds.length;
				for(var i=0;i<len;i++){
					var flag = true;
					if(tds[i].firstChild.value==""){
						flag = false;
					}
					if(flag){
						document.forms[0].submit();
					}
			}
		} 
	</script>
  </head>
  <body>
  	<form action="listCertServlet?item=addCert" method="post">
  	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  	
  	<input type="button" value="添加" onclick="addCert()"></input>
  	<input type="button" value="提交" onclick="submit()"></input>
  		<table width="80%" align="center" border="1" cellspacing="0" id="tableCert">
  			<tr>
  				<td colspan="6" align="center">所有证书信息</td>
  			</tr>
  			<tr>
  				<td>证书编号</td>
  				<td>证书名称</td>
  				<td>培训学员</td>
  				<td>培训老师</td>
  				<td>获取证书时间</td>
  			</tr>
  			<%
				for(int i = 0;i<certs.size();i++){
	          	  Cert cert = certs.get(i);
			%>
  			<tr id="certLine<%=i %>">
  				<td id="tdC"><input type="hidden" name="cId" value="<%=cert.getcId() %>"><%=cert.getcId() %></td>
  				<td><input type="hidden" name="cName" value="<%=cert.getcName() %>"><%=cert.getcName() %></td>
  				<td><input type="hidden" name="cStu" value="<%=cert.getcStu() %>"><%=cert.getcStu() %></td>
  				<td><input type="hidden" name="cTec" value="<%=cert.getcTec() %>"><%=cert.getcTec() %></td>
  				<td><input type="hidden" name="cDate" value="<%=cert.getcDate() %>"><%=cert.getcDate() %></td>
  			</tr>
  			<%} %>
  		</table>
  	</form>
  </body>
</html>
