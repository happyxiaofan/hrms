<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'left.jsp' starting page</title>
    
	<script type="text/javascript" src="res/js/jquery.js"></script>
	<script type="text/javascript" src="res/js/chili-1.7.pack.js"></script>
	<script type="text/javascript" src="res/js/jquery.easing.js"></script>
	<script type="text/javascript" src="res/js/jquery.dimensions.js"></script>
	<script type="text/javascript" src="res/js/jquery.accordion.js"></script>
	<script language="javascript">
	
	jQuery().ready(function(){
		jQuery('#navigation').accordion({
			header: '.head',
			navigation1: true, 
			event: 'click',
			fillSpace: true,
			animated: 'bounceslide'
		});
	});
</script>
<style type="text/css">
<!--
body {
	margin:0px;
	padding:0px;
	font-size: 12px;
}
#navigation {
	margin:0px;
	padding:0px;
	width:147px;
}
#navigation a.head {
	cursor:pointer;
	background:url(res/images/main_34.gif) no-repeat scroll;
	display:block;
	font-weight:bold;
	margin:0px;
	padding:5px 0 5px;
	text-align:center;
	font-size:12px;
	text-decoration:none;
}
#navigation ul {
	border-width:0px;
	margin:0px;
	padding:0px;
	text-indent:0px;
}
#navigation li {
	list-style:none; display:inline;
}
#navigation li li a {
	display:block;
	font-size:12px;
	text-decoration: none;
	text-align:center;
	padding:3px;
}
#navigation li li a:hover {
	background:url(res/images/tab_bg.gif) repeat-x;
		border:solid 1px #adb9c2;
}
-->
</style>
  </head>
  
  <body>
 <div height="100%">
  <ul id="navigation">
  
  <!-- 常用功能 -->
  <li> <a class="head">常用操作</a>
	      <ul>
	        <li><a href="${pageContext.request.contextPath}/addDept?item=query" target="rightFrame">回到首页</a></li>
	        <li><a href="${pageContext.request.contextPath}/listDept" target="rightFrame">我的信息</a></li>
	        <li><a href="${pageContext.request.contextPath}/listDept" target="rightFrame">修改密码</a></li>
	        <li><a href="${pageContext.request.contextPath}/listDept" target="rightFrame">退出系统</a></li>
	      </ul>
	    </li>
  <!-- 系统管理模块 -->
	      <li> <a class="head">机构信息维护</a>
	      <ul>
	        <li><a href="${pageContext.request.contextPath}/addDept?item=query" target="rightFrame">添加部门</a></li>
	        <li><a href="${pageContext.request.contextPath}/listDept" target="rightFrame">查看/修改部门</a></li>
	        
	      </ul>
	    </li>
	    <li> <a class="head">用户管理</a>
	      <ul>
	        <li><a href="${pageContext.request.contextPath}/addEmp?item=query" target="rightFrame">添加新雇员</a></li>
	        <li><a href="${pageContext.request.contextPath}/listEmployeeServlet" target="rightFrame">查看/修该雇员信息</a></li>
	      </ul>
	    </li>
	    <li> <a class="head">角色管理</a>
	      <ul>
	        <li><a href="${pageContext.request.contextPath}/roleServlet?item=add" target="rightFrame">添加角色</a></li>
	        <li><a href="${pageContext.request.contextPath}/roleServlet?item=query" target="rightFrame">查看/修改角色</a></li>
	      </ul>
	    </li>
	    <li> <a class="head">模块管理</a>
	      <ul>
	        <li><a href="${pageContext.request.contextPath}/moduleServlet?item=add" target="rightFrame">添加模块</a></li>
			<li><a href="${pageContext.request.contextPath}/moduleServlet?item=query" target="rightFrame">查看/修改模块</a></li>
	      </ul>
	    </li>
	    <li> <a class="head">角色模块分配</a>
	      <ul>
	        <li><a href="${pageContext.request.contextPath}/disModuleRoleServlet?item=dis" target="rightFrame">分配模块</a></li>
	      </ul>
	    </li>
	    <li> <a class="head">用户角色分配</a>
	      <ul>
	        <li><a href="${pageContext.request.contextPath}/disEmpRoleServlet?item=dis" target="rightFrame">用户角色分配</a></li>
	      </ul>
	    </li>
    
  </ul>
</div>
  </body>
</html>
