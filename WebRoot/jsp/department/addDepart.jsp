<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
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
    <form class="layui-form" method="post" action="addDepart">
	  <div class="layui-form-item">
	    <label class="layui-form-label">系别号</label>
	    <div class="layui-input-block">
	      <input type="text" name="no" required  lay-verify="required" placeholder="请输入系别号" autocomplete="off" class="layui-input">
	    </div>
	  </div>
	   <div class="layui-form-item">
	    <label class="layui-form-label">系别名</label>
	    <div class="layui-input-block">
	      <input type="text" name="name" required  lay-verify="required" placeholder="请输入系别名" autocomplete="off" class="layui-input">
	    </div>
	  </div>
	  <div class="layui-form-item">
	    <div class="layui-input-block" style="text-align: center;">
	      <input type="submit" class="layui-btn " value="添加"/>
	      <button type="reset" class="layui-btn layui-btn-primary">重置</button>
	    </div>
	  </div>
	  <div style="color: red;text-align: center;"><%
	  if(request.getAttribute("returnInfo")!=null)
	  	out.write((String)request.getAttribute("returnInfo")); 
	  %></div>
	 </form>
	<script>
	//Demo
	layui.use('form', function(){
	  var form = layui.form;
	  
	  //监听提交
	  form.on('submit(formDemo)', function(data){
	    layer.msg(JSON.stringify(data.field));
	    return false;
	  });
	});
	</script>
  </body>
</html>
