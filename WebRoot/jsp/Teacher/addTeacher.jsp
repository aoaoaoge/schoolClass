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
        <script type="text/javascript" src="<%=request.getContextPath() %>/js/jquery-2.2.4.min.js"></script>
		<link rel="stylesheet" href="<%=request.getContextPath() %>/layui/css/layui.css">
		<script src="<%=request.getContextPath() %>/layui/layui.js"></script>
	
    </head>
    <body>
    	
	<form class="layui-form" method="post" action="<%=request.getContextPath() %>/addTeacher">
	  <div class="layui-form-item">
	    <label class="layui-form-label">用户名</label>
	    <div class="layui-input-block">
	      <input type="text" name="id" required  lay-verify="required" placeholder="请输入用户名" autocomplete="off" class="layui-input">
	    </div>
	  </div>
	  
	   <div class="layui-form-item">
	    	 <label class="layui-form-label">密码框</label>
		    <div class="layui-input-inline">
		      <input type="password" name="password" required lay-verify="required" placeholder="请输入密码" autocomplete="off" class="layui-input">
		    </div>
    		<div class="layui-form-mid layui-word-aux">密码输入</div>
	  </div>
	     
	  <div class="layui-form-item">
	    <label class="layui-form-label">姓名</label>
	    <div class="layui-input-block">
	      <input type="text" name="name" required  lay-verify="required" placeholder="请输入姓名" autocomplete="off" class="layui-input">
	    </div>
	  </div>
	  
	  <div class="layui-form-item">
	    <label class="layui-form-label">所属系别</label>
	    <div class="layui-input-block">
	      <select name="xb" lay-verify="required">
	      	<option value=""></option>
	      </select>
	    </div>
	  </div>
	  <div class="layui-form-item">
	    <label class="layui-form-label">入职日期</label>
	    <div class="layui-input-block">
	      <input type="text" name="date" id="time" required  lay-verify="required" placeholder="请输入日期" autocomplete="off" class="layui-input">
	    </div>
	  </div>
	   <div class="layui-form-item">
	    <label class="layui-form-label">身份证号</label>
	    <div class="layui-input-block">
	      <input type="text" name="idcard" required  lay-verify="required" placeholder="请输入身份证号" autocomplete="off" class="layui-input">
	    </div>
	  </div>
	  <div class="layui-form-item">
	    <label class="layui-form-label">状态</label>
	    <div class="layui-input-block">
	      <input type="radio" name="sex" value="1" title="激活">
	      <input type="radio" name="sex" value="0" title="禁用" checked>
	    </div>
	    
	  </div>
	  <div class="layui-form-item">
	  	<label class="layui-form-label">类别</label>
	  	<div class="layui-input-block">
	      <input type="radio" name="type" value="2" title="教师" checked>
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
layui.use('form','laydate', function(){
	  var form = layui.form;
	  var laydate = layui.laydate;
  
  //监听提交
	  form.on('submit(formDemo)', function(data){
	    layer.msg(JSON.stringify(data.field));
	    return false;
	  });
	  
	  //执行一个laydate实例
		 laydate.render({
		   elem: '#time' //指定元素
		 });
		 
		 form.render();
	});
	
/* layui.use('laydate', function(){
	  var laydate = layui.laydate;
	  
	  //执行一个laydate实例
	  laydate.render({
	    elem: '#time' //指定元素
	  });
	});   */
</script>
<script type="text/javascript">
	//post异步请求获取系别
	$(function(){
		$.post('<%=request.getContextPath() %>/selectXb',function(data){
			for(var i=0;i<data.length;i++){
				$('select').append("<option value='"+data[i].dep_id+"'>"+data[i].dep_name+"</option>");
			}
			form.render();
		},'json');
	});
</script>
 	</body>
</html>