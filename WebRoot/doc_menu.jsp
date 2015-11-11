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
  
  	
    <li> <a class="head">基本信息管理</a>
      <ul>
        <li><a href="${pageContext.request.contextPath }/docBaseInfoServlet?item=add" target="rightFrame">信息录入</a></li>
		<li><a href="${pageContext.request.contextPath }/docBaseInfoServlet?item=edit" target="rightFrame">信息编辑</a></li>
		<li><a href="${pageContext.request.contextPath }/docBaseInfoServlet?item=view" target="rightFrame">信息查看</a></li>
      </ul>
    </li>
    <li> <a class="head">员工档案管理</a>
      <ul>
        <li><a href="${pageContext.request.contextPath }/archiveServlet?item=add" target="rightFrame">档案录入</a></li>
		<li><a href="${pageContext.request.contextPath }/archiveServlet?item=edit" target="rightFrame">档案编辑</a></li>
		<li><a href="${pageContext.request.contextPath }/archiveServlet?item=view" target="rightFrame">档案查看</a></li>
      </ul>
    </li>
    <li> <a class="head">员工履历</a>
      <ul>
        <li><a href="${pageContext.request.contextPath }/RecordActionServlet?method=add&entity=record" target="rightFrame">记录履历</a></li>
		<li><a href="${pageContext.request.contextPath }/RecordActionServlet?method=edit&entity=record" target="rightFrame">修改履历信息</a></li>
		<li><a href="${pageContext.request.contextPath }/RecordActionServlet?method=view&entity=record" target="rightFrame">查看履历信息</a></li>
      </ul>
    </li>
    <li> <a class="head">奖惩管理</a>
      <ul>
        <li><a href="${pageContext.request.contextPath }/listRewardServlet?item=add" target="rightFrame">奖惩信息记录</a></li>
		<li><a href="${pageContext.request.contextPath }/listRewardServlet?item=edit" target="rightFrame">奖惩信息编辑</a></li>
		<li><a href="${pageContext.request.contextPath }/listRewardServlet?item=view" target="rightFrame">奖惩信息查看</a></li>
      </ul>
    </li>
    <li> <a class="head">查询系统</a>
      <ul>
        <li><a href="${pageContext.request.contextPath }/baseInfoSearch?item=enter" target="rightFrame">普通查询</a></li>
        <li><a href="${pageContext.request.contextPath }/baseInfoSearch?item=soso" target="rightFrame">条件查询</a></li>
      </ul>
    </li>
  </ul>
</div>
  </body>
</html>
