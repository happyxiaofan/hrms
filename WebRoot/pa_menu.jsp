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
  
    <li> <a class="head">人事变动</a>
        <ul>
        <li><a href="${pageContext.request.contextPath}/listpChange?item=edit" target="rightFrame">人事调动管理</a></li>
        <li><a href="${pageContext.request.contextPath}/listpChange?item=add" target="rightFrame">增加信息</a></li>
      </ul>
    </li>
    <li> <a class="head">职称聘任管理</a>
      <ul>
        <li><a href="" target="rightFrame">增加信息</a></li>
        <li>
	        <a href="${pageContext.request.contextPath}/engageRecord" target="rightFrame">编辑聘任信息</a>
        </li>
      </ul>
    </li>
    <li> <a class="head">人事信息查看</a>
      <ul>
        <li><a href="${pageContext.request.contextPath}/newEmp" target="rightFrame">新进员工信息</a></li>
        <li><a href="${pageContext.request.contextPath}/empRetire" target="rightFrame">符合退休员工</a></li>
        <li><a href="${pageContext.request.contextPath}/empResign" target="rightFrame">离职员工信息</a></li>
      </ul>
    </li>
  </ul>
</div>
  </body>
</html>
