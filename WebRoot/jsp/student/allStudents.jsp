<%@page import="com.ao.school.entity.Student"%>
<%@ page language="java" import="java.util.*" import="com.ao.school.util.JdbcUtil" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
List<Student> delist = new ArrayList<>();
if(request.getAttribute("studentInfo")!=null){
	delist = (List)request.getAttribute("studentInfo");
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
  		<table class="layui-table" style="width: 800px">
  			<tr><th>学生id</th><th>学生号</th><th>学生名</th><th>身份证号</th><th>入学日期</th><th>系别号</th><th>课程号</th></tr>
  			<% 
  			if(delist!=null){
	  			for (Student de : delist) {
					//System.out.println(de);
	  				out.write("<tr><td>"+de.getS_id()+"</td><td>"+de.getS_no()+"</td><td>"+de.getS_name()+"</td><td>"+de.getS_zip()+"</td><td>"+de.getS_indate()+"</td><td>"+de.getS_dep_no()+"</td><td>"+de.getS_pro_id()+"</td></tr>");
	  			}
  			}
  			%>
  		</table>
  	</div>

  </body>
</html>
