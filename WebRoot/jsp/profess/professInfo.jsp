<%@page import="com.ao.school.entity.Profess"%>
<%@ page language="java" import="java.util.*" import="com.ao.school.util.JdbcUtil" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
List<Profess> delist = new ArrayList<>();
if(request.getAttribute("professInfo")!=null){
	delist = (List)request.getAttribute("professInfo");
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
  			<tr><th>专业号</th><th>专业名</th><th>系别号</th><th>可选操作<span class="info" style="color: red;text-align: center;hight:30px;"></span></th></tr>
  			<% 
  			if(delist!=null){
	  			for (Profess de : delist) {
					//System.out.println(de);
	  				out.write("<tr><td style='display:none'>"+de.getPro_id()+"</td><td>"+de.getPro_no()+"</td><td>"+de.getPro_name()+"</td><td>"+de.getPro_depid()+"</td><td><button class='layui-btn upDepart'>修改</button><button class='layui-btn layui-btn-danger delete-btn'>删除</button></td></tr>");
	  			}
  			}
  			%>
  		</table>
  	</div>
  	
  	 <form class="layui-form"  style="display:none;width: 400px;padding-top: 10px">
  	 <input type="hidden" name="id">
	  <div class="layui-form-item">
	    <label class="layui-form-label">专业号</label>
	    <div class="layui-input-block">
	      <input type="text" name="no" required  lay-verify="required" placeholder="请输入专业号" autocomplete="off" class="layui-input">
	    </div>
	  </div>
	   <div class="layui-form-item">
	    <label class="layui-form-label">专业名</label>
	    <div class="layui-input-block">
	      <input type="text" name="name" required  lay-verify="required" placeholder="请输入专业名" autocomplete="off" class="layui-input">
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
			id = $(this).parent('td').prev('td').prev('td').prev('td').prev('td').text();
			tr = $(this).parent('td').parent('tr');
			index1 = layer.open({
					type:1,
					title:'确认删除',
					area: ['200px', '100px'],
					content:$('#sureDel')
					});
		});
		
		$('.yes').click(function openUpdata(){
			$.post('<%=request.getContextPath()%>/delPro',{'id':id},function(date){
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
			$("form input[name='name']").val($(this).parent('td').prev('td').prev('td').text());
			$("form input[name='no']").val($(this).parent('td').prev('td').prev('td').prev('td').text());
			$("form input[name='id']").val($(this).parent('td').prev('td').prev('td').prev('td').prev('td').text());
			index = layer.open({
					type:1,
					title:'修改专业',
					area: ['500px', '220px'],
					content:$('form')
					});
		});
		$("#update").click(function(){
			$.post('<%=request.getContextPath()%>/upProfess',$("form").serialize(),function(date){
					if(date == "true"){
						$(".info").html("修改成功！");
						layer.close(index);
					}
					else{
						$(".info").html("修改失败！");
					}							
			},'text');
		});
		$('.noupdate').click(function openUpdata(){
			layer.close(index);
		});
		
	</script>
  </body>
</html>
