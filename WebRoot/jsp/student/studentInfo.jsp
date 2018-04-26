<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>
    <head>
    	<meta charset="utf-8">
  		<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script type="text/javascript" src="../../js/jquery-2.2.4.min.js"></script>
		<link rel="stylesheet" href="../../layui/css/layui.css">
		<script src="../../layui/layui.js"></script>
	
    </head>
    <body>
    	
	<form class="layui-form" action="selcetStudent" method="post">
	  <div class="layui-form-item">
	    <label class="layui-form-label">用户名</label>
	    <div class="layui-input-block">
	      <input type="text" name="title" required  lay-verify="required" placeholder="请输入用户名" autocomplete="off" class="layui-input">
	    </div>
	  </div>
	  <div class="layui-form-item">
	    <label class="layui-form-label">姓名</label>
	    <div class="layui-input-block">
	      <input type="text" name="title" required  lay-verify="required" placeholder="请输入姓名" autocomplete="off" class="layui-input">
	    </div>
	  </div>
	  <div class="layui-form-item">
	    <label class="layui-form-label">所属系别</label>
	    <div class="layui-input-block">
	      <select name="city" lay-verify="required">
	        <option value=""></option>
	        <option value="0">土木工程</option>
	        <option value="1">计算机</option>
	        <option value="1">工商</option>
	      </select>
	    </div>
	  </div>
	  <div class="layui-form-item">
	    <label class="layui-form-label">入职日期</label>
	    <div class="layui-input-block">
	      <input type="text" name="time" required  lay-verify="required" placeholder="请输入日期" autocomplete="off" class="layui-input">
	    </div>
	  </div>
	  <div class="layui-form-item" style="display: none">
	    <label class="layui-form-label">状态</label>
	    <div class="layui-input-block">
	      <input type="radio" name="sex" value="1" title="激活">
	      <input type="radio" name="sex" value="0" title="禁用" checked>
	    </div>  
	  </div>
	   <div class="layui-form-item layui-form-text">
	    <label class="layui-form-label">教师信息</label>
	    <div class="layui-input-block">
	      <div style="background: white;">
	      	<table class="layui-table teacherinfo">
	      		<tr><th>学生编号</th><th>学生姓名</th><th>身份证号</th><th>入学日期</th><th>所属系别</th></tr>
	      	</table>
	      </div>
	    </div>
	  </div>
	  <div class="layui-form-item" style="text-align: center;">
	    <div class="layui-input-block">
	      <input type="button" id="queryStudent" class="layui-btn layui-btn" value="条件查询"/>
	       <input type="button" onclick="javascrtpt:window.location.href='<%=request.getContextPath() %>/allStudents'" class="layui-btn layui-btn-primary" value="查询所有"/>
	    </div>
	  </div>
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