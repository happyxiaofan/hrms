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
  
    <!-- 人事调配模块 -->
    <li> <a class="head">人事调动管理</a>
        <ul>
        <li><a href="pa/pa_search.jsp" target="rightFrame">人事信息查询</a></li>
       
        <li><a href="pa/pa_viewEmp.jsp" target="rightFrame">人事信息变动</a></li>
      </ul>
    </li>
    <li> <a class="head">新进员工</a>
      <ul>
        <li><a href="pa/pa_newEmp.jsp" target="rightFrame">查看信息</a></li>
        <li></li>
      </ul>
    </li>
    <li> <a class="head">离退员工</a>
      <ul>
        <li><a href="pa/pa_lefEmp.jsp" target="rightFrame">退休员工</a></li>
        <li><a href="pa/pa_leftEmp.jsp" target="rightFrame">离职员工</a></li>
      </ul>
    </li>
    <li> <a class="head">职称聘任记录</a>
      <ul>
        <li><a href="pa/pa_pp.jsp" target="rightFrame">聘任记录</a></li>
		<li><a href="pa/pa_pt.jsp" target="rightFrame">增加/删除</a></li>
      </ul>
    </li>
    
    <!-- 人员档案模块 -->
    
    
  </ul>
</div>
  </body>
</html>
