<%@page import="com.ao.school.entity.Department"%>
<%@ page language="java" import="java.util.*" import="com.ao.school.util.JdbcUtil" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
List<Department> delist = new ArrayList<>();
if(request.getAttribute("departInfo")!=null){
	delist = (List)request.getAttribute("departInfo");
}

%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>addDepart</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-2.2.4.min.js"></script>
	<link rel="stylesheet" href="<%=request.getContextPath()%>/layui/css/layui.css">
	<script src="<%=request.getContextPath()%>/layui/layui.js"></script>
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
  		<table class="layui-table" width="300px">
  			<thead><tr><th>系别号</th><th>系别名</th><th>可选操作<span class="info" style="color: red;text-align: center;hight:30px;"></span></th></tr></thead>
  			<% 
  			if(delist!=null){
	  			for (Department de : delist) {
					//System.out.println(de);
	  				out.write("<tr><td style='display:none'>"+de.getDep_id()+"</td><td>"+de.getDep_no()+"</td><td>"+de.getDep_name()+"</td><td><button class='layui-btn upDepart'>修改</button><button class='layui-btn layui-btn-danger delete-btn'>删除</button></td></tr>");
	  			}
  			}
  			%>
  		</table>
  	</div>
  	
  	 <form id="updateform" class="layui-form"  style="display:none; width: 400px;padding-top: 10px">
	  	 <input type="hidden" name="id">
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
		      <input type="submit" id="update" class="layui-btn " value="修改"/>
		      <button class='layui-btn noupdate'>取消</button>
		    </div>
		  </div>
	 </form>
	 
	 <div id="sureDel" style="display: none;padding-left: 30px;">
	 	<button class='layui-btn layui-btn-danger yes'>确定</button><button class='layui-btn no'>取消</button>
	 </div>
	 
	<script type="text/javascript">
		info = "";
		
		$(function(){
				$(".info").html(info);
		});
		
		layui.use('form','laydate', function(){
	  		var form = layui.form;
	  		layer = layui.layer;
  			//监听提交
			form.on('submit(formDemo)', function(data){
			    layer.msg(JSON.stringify(data.field));
			    return false;
		});
		  
			 form.render();
		});
		
		$('.delete-btn').click(function openUpdata(){
			id = $(this).parent('td').prev('td').prev('td').prev('td').text();
			tr = $(this).parent('td').parent('tr');
			index1 = layer.open({
					type:1,
					title:'确认删除',
					area: ['200px', '100px'],
					content:$('#sureDel')
					});
		});
		
		$('.yes').click(function delt(){
			$.post('<%=request.getContextPath()%>/delDepart',{'id':id},function(date){
				if(date == "true"){
						info = "删除成功！";
						tr.empty();
					}
					else{
						info = "删除失败！";
					}
					layer.close(index1);				
			});
		});
		
		$('.no').click(function openUpdata(){
			layer.close(index1);
		});
		
		$('.upDepart').click(function openUpdata(){
			//debugger;
			$("form input[name='name']").val($(this).parent('td').prev('td').text());
			$("form input[name='no']").val($(this).parent('td').prev('td').prev('td').text());
			$("form input[name='id']").val($(this).parent('td').prev('td').prev('td').prev('td').text());
			index = layer.open({
					type:1,
					title:'修改系别',
					area: ['450px', '220px'],
					content:$('#updateform')
					});
		});
		$("#update").click(function(){
			$.post('<%=request.getContextPath()%>/upDepart',$("#updateform").serialize(),function(date){
					if(date == "true"){
						info = "修改成功！";
					}
					else{
						info = "修改失败！";
					}
					layer.close(index);							
			},'text');
		});
		$('.noupdate').click(function openUpdata(){
			layer.close(index);
		});
		
	</script>
  </body>
</html>
