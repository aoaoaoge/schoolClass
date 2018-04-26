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
	
		<style type="text/css">
			.pagebar{
				padding-left: 140px;
			}
			.pagebar a{
				padding-left: 10px;
			}
		</style>
    </head>
    <body>
    	
	<form class="layui-form"  id="queryTeacherForm">
	  <div class="layui-form-item">
	    <label class="layui-form-label">用户编号查</label>
	    <div class="layui-input-block">
	      <input type="text" name="tno" placeholder="请输入用户编号" autocomplete="off" class="layui-input">
	    </div>
	  </div>
	  <div class="layui-form-item">
	    <label class="layui-form-label">姓名查</label>
	    <div class="layui-input-block">
	      <input type="text" name="tname" placeholder="请输入姓名" autocomplete="off" class="layui-input">
	    </div>
	  </div>
	  <div class="layui-form-item">
	    <label class="layui-form-label">身份证查</label>
	    <div class="layui-input-block">
	      <input type="text" name="zip" placeholder="请输入身份证号" autocomplete="off" class="layui-input">
	    </div>
	  </div>
	  <div class="layui-form-item">
	    <label class="layui-form-label">所属系别查</label>
	    <div class="layui-input-block">
	      <select name="depart">
	        <option value=""></option>
	      </select>
	    </div>
	  </div>
	  <div class="layui-form-item">
	    <label class="layui-form-label">入职日期查</label>
	    <div class="layui-input-block">
	      <input type="text" name="time" placeholder="请输入日期" autocomplete="off" class="layui-input time">
	    </div>
	  </div>
	  <div class="layui-form-item" style="display: none">
	    <label class="layui-form-label">状态查</label>
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
	      		<thead><tr><th>教师编号</th><th>教师姓名</th><th>身份证号</th><th>入职日期</th><th>所属系别</th><th>可选操作</th></tr></thead>
	      	</table>
	      </div>
	      <div class="layui-input-block pagebar">
	      	<a href="javascript:firstPage()">首页</a><a href="javascript:backPage()">上一页</a><a href="javascript:nextPage()">下一页</a><a href="javascript:lastPage()">末页</a>
	      </div>
	    </div>
	  </div>
	  <div class="layui-form-item" style=" margin-top: -20px;">
	    <div class="layui-input-block" style="text-align: center;">
	      <input type="button" onclick="queryTeacher()" class="layui-btn layui-btn" value="条件查询"/>
	      <input type="button" onclick="javascript:window.location.href='<%=request.getContextPath() %>/allTeachers'" class="layui-btn layui-btn-primary" value="查询所有"/>
	    </div>
	  </div>
</form>
 
 <form id="updateform" class="layui-form"  style="display:none; width: 400px;padding-top: 10px">
	  	 <input type="hidden" name="id">
		  <div class="layui-form-item">
		    <label class="layui-form-label">教师编号</label>
		    <div class="layui-input-block">
		      <input type="text" name="no" required  lay-verify="required" placeholder="请输入系别号" autocomplete="off" class="layui-input">
		    </div>
		  </div>
		  
		  <div class="layui-form-item">
		    <label class="layui-form-label">教师姓名</label>
		    <div class="layui-input-block">
		      <input type="text" name="name" required  lay-verify="required" placeholder="请输入系别名" autocomplete="off" class="layui-input">
		    </div>
		  </div>
		  
		  <div class="layui-form-item">
		    <label class="layui-form-label">身份证号</label>
		    <div class="layui-input-block">
		      <input type="text" name="name" required  lay-verify="required" placeholder="请输入系别名" autocomplete="off" class="layui-input">
		    </div>
		  </div>
		  
		<div class="layui-form-item">
		    <label class="layui-form-label">所属系别</label>
		    <div class="layui-input-block">
		      <select name="depart">
		        <option value=""></option>
		      </select>
		    </div>
		 </div>
		  
		  <div class="layui-form-item">
		    <label class="layui-form-label">入职日期</label>
		    <div class="layui-input-block">
		      <input type="text" name="time" required  lay-verify="required" placeholder="请输入系别名" autocomplete="off" class="layui-input time">
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
 
<script  type="text/javascript">

	var pageno = 1;
	var maxpage = 0;
	
	layui.use('form','laydate', function(){
	  var form = layui.form;
	  var laydate = layui.laydate;
	  layer = layui.layer;
  
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
//加载第一页教师信息
function queryTeacher(){
	queryTeachers(1);
	pageno = 1;
}

//条件查询教师信息
function queryTeachers(page){
	var tno = $('#queryTeacherForm input[name="tno"]').val();
	var tname = $('#queryTeacherForm input[name="tname"]').val();
	var zip = $('#queryTeacherForm input[name="zip"]').val();
	var time = $('#queryTeacherForm input[name="time"]').val();
	var depart = $('#queryTeacherForm select').val();
  	$('table tr:not(tr:eq(0))').empty();
   	 $.post('<%=request.getContextPath() %>/selectTeacher',{tno:tno,tname:tname,zip:zip,time:time,depart:depart,pageno:pageno},function(data){
    	var teacher = data.teachers;
    	for(var i=0;i<teacher.length;i++){
    		$('.teacherinfo').append("<tr>"+
    										"<td style='display:none;'>"+teacher[i].t_id+"</td>"+
    										"<td>"+teacher[i].t_no+"</td>"+
    										"<td>"+teacher[i].t_name+"</td>"+
    										"<td>"+teacher[i].t_zip+"</td>"+
    										"<td>"+matetime(teacher[i].formatedate)+"</td>"+
    										"<td>"+teacher[i].t_depno+"</td>"+
    										"<td style='text-align: center;'><button class='layui-btn layui-btn-xs' onclick='updateTeacher()' id='update-btn' >修改</button><button class='layui-btn layui-btn-danger layui-btn-xs' onclick='delTeacher()' id='delete-btn'>删除</button></td>"+
    								"</tr>");
    		}
    		//总条目数
				var count = data.count;
				//计算总页数
				maxpage = Math.ceil(count*1.0/2);
   	 },'json');
   	
    };
    
	//首页方法
	function firstPage(){
		pageno = 1;
		queryTeachers(1);
	}
	
	//末页方法
	function lastPage(){
		pageno = maxpage;
		queryTeachers(maxpage);
	}
	
	//上一页方法
	function backPage(){
		if(pageno == 1)
			return;
		else{
			queryTeachers(--pageno);
		}
	}
	
	//下一页方法
	function nextPage(){
		if(pageno == maxpage)
			return;
		else{
			queryTeachers(++pageno);
		}
	}
	
	//设置时间格式
	function matetime(time){
		return time.substring(0,10);
	}
	
	//post异步请求获取系别
	$(function(){
		$.post('<%=request.getContextPath() %>/selectXb',function(data){
			for(var i=0;i<data.length;i++){
				$('select').append("<option value='"+data[i].dep_id+"'>"+data[i].dep_name+"</option>");
			}
		},'json');
	});
	
	//弹出确认删除框
	function delTeacher(){
			id = $(this).parent('td').prev('td').prev('td').prev('td').prev('td').prev('td').prev('td').text();
			tr = $(this).parent('td').parent('tr');
			index1 = layer.open({
				type:1,
				title:'确认删除',
				area: ['200px', '100px'],
				content:$('#sureDel')
			});
		};
		//确认删除，发送删除请求
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
		//取消删除，关闭弹出框
		$('.no').click(function openUpdata(){
			layer.close(index1);
		});
		//弹出修改框
		
		function updateTeacher(){
			//debugger;
			$("#updateform input[name='name']").val($(this).parent('td').prev('td').text());
			$("#updateform input[name='no']").val($(this).parent('td').prev('td').prev('td').text());
			$("#updateform input[name='id']").val($(this).parent('td').prev('td').prev('td').prev('td').text());
			index = layer.open({
					type:1,
					title:'修改系别',
					area: ['450px', '220px'],
					content:$('#updateform')
					});
		};
		//确认修改，发送请求
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
		//取消修改，关闭修改框
		$('.noupdate').click(function openUpdata(){
			layer.close(index);
		});
		
	
</script>

 	</body>
</html>