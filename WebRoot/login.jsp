<%@ page language="java" import="java.util.*" pageEncoding="utf-8" session="false"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML>
<html>
  <head>
    <base href="<%=basePath%>">
    
   		<meta charset="utf-8">
		<title>login</title>
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">    
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css"/>
		<script type="text/javascript" src="js/jquery-2.2.4.min.js"></script>
		<script type="text/javascript" src="js/bootstrap.js"></script>

  </head>
  
  <body>
   <div style="text-align: center;margin-top: 100px;">
			<form method="post" class="form-inline" action="login">
				<div class="form-group" style="margin-bottom: 20px;">
					<label style="margin-top: 6px;">用户名</label>
					<input type="text" class="form-control input-xlarge" name="username" placeholder="请输入用户名"/>
				</div>
				<br/>
				<div class="form-group" style="margin-bottom: 20px;">
					<label style="margin-top: 6px;">密　码</label>
					<input type="password" name="pwd" class="form-control" placeholder="请输入密码"/><br /></div>
				</div>
				<div class="form-group" style="text-align: center;"><input class="btn btn-primary" type="submit" value="登录" style="width: 100px;"/></div>
				<div style="color: red;text-align: center;" class="danger"><% 
				if(request.getAttribute("error")!=null){
					out.write((String)request.getAttribute("error")); 
				}%></div>
			</form>
		</div>
  </body>
</html>
