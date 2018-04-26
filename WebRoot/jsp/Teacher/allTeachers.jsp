<%@page import="com.ao.school.entity.Teacher"%>
<%@ page language="java" import="java.util.*" import="com.ao.school.util.JdbcUtil" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
List<Teacher> delist = new ArrayList<>();
if(request.getAttribute("teacherInfo")!=null){
	delist = (List)request.getAttribute("teacherInfo");
}

%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>addDepart</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	<script type="text/javascript" src="js/jquery-2.2.4.min.js"></script>
	<link rel="stylesheet" href="layui/css/layui.css">
	<script src="layui/layui.js"></script>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
  	<div>
  		<table class="layui-table" style="width: 600px">
  			<tr><th>教师号</th><th>教师名</th><th>身份证号</th><th>入职日期</th><th>系别号</th></tr>
  			<% 
  			if(delist!=null){
	  			for (Teacher de : delist) {
					//System.out.println(de);
	  				out.write("<tr><td style='display:none;'>"+de.getT_id()+"</td><td>"+de.getT_no()+"</td><td>"+de.getT_name()+"</td><td>"+de.getT_zip()+"</td><td>"+de.getT_date()+"</td><td>"+de.getT_depno()+"</td></tr>");
	  			}
  			}
  			%>
  		</table>
  	</div>

  </body>
</html>
