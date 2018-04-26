<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>adminmain</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	<script type="text/javascript" src="js/jquery-2.2.4.min.js"></script>
	<link rel="stylesheet" href="layui/css/layui.css">
	<script src="layui/layui.js"></script>
	
	<style type="text/css">
			.top{
				background: #393D49;
				width: 100%;
				height: 60px;
			}
			.top-left{
				float: left;
			}
			.top-right{
				float: right;
			}
			.mid{
				position: relative;
				top: 10px;
				left: 0;
				right: 0;
				height: 600px;
				width: 100%;
			}
			.mid-left{
				position: absolute;
				background: #393D49;
				width: 200px;	
				height: 600px;
				margin-top: -10px;
			}
			.mid-right{
				padding: 50px 0;
				position: absolute;
				left: 200px;
				right: 0px;
				top: -10px;
				text-align: center;
				background: #7FCAFF;
				
			}
			.mid-right iframe{
				border: none;
				position: relative;
				left: 0px;
			}
			.botton{
				position: absolute;
				bottom: 0;
				left: 0;
				right: 0;
				top: 660px;
				text-align: center;
				background: #282B33;
				height: 100px;
			}
			.botton a{
				color: #fff;
				line-height: 110px;
			}
			a{
				cursor: pointer;
			}
	</style>

  </head>
  
  <body>
  	
  	<div class="top">
  		<div class="top-left">
  			<label class="layui-form-label" style="width: 170px;line-height: 50px"><a href="#" style="color: #fff;font-size: 18px;float: left;margin-left: 20px">选课管理系统</a></label>
  			<ul class="layui-nav" lay-filter="" style="margin-left: 180px;">
  				 <li class="layui-nav-item  layui-this"><a href="">首页</a></li>
				  <li class="layui-nav-item"><a href="">前进</a></li>
				  <li class="layui-nav-item"><a href="">后退</a></li>
				  <li class="layui-nav-item"><a href="">刷新</a></li>
				 <!-- <li class="layui-nav-item">
				    <a href="javascript:;">解决方案</a>
				    <dl class="layui-nav-child">
				      <dd><a href="">移动模块</a></dd>
				      <dd><a href="">后台模版</a></dd>
				      <dd><a href="">电商平台</a></dd>
				    </dl>
				  </li>-->
				  <li class="layui-nav-item"><a href="">社区</a></li>
				</ul>
  		</div>
  		<div class="top-right">
  			<ul class="layui-nav">
			  <li class="layui-nav-item">
			    <a href="#">在线人数<span  id="count"  class="layui-badge"></span></a>
			  </li>
			  <li class="layui-nav-item">
			    <a href="#">个人中心<span class="layui-badge-dot"></span></a>
			  </li>
			  <li class="layui-nav-item">
			    <a href=""><img src="http://t.cn/RCzsdCq" class="layui-nav-img"><% out.write((String)request.getAttribute("name"));%></a>
			    <dl class="layui-nav-child">
			      <dd><a href="#">修改信息</a></dd>
			      <dd><a href="#">安全管理</a></dd>
			      <dd><a href="<%=request.getContextPath() %>/login.jsp">退出</a></dd>
			    </dl>
			  </li>
			</ul>
  		</div>
  	</div>
  	
  	
  	<div class="mid">
  		<div class="mid-left">
  			<ul class="layui-nav layui-nav-tree" lay-filter="test">
			<!-- 侧边导航: <ul class="layui-nav layui-nav-tree layui-nav-side"> -->
				 <li class="layui-nav-item  layui-nav-itemed">
			    <a href="javascript:;">老师信息管理</a>
			    <dl class="layui-nav-child">
			      <dd><a href="jsp/Teacher/addTeacher.jsp" target="iframes">新增老师</a></dd>
			      <dd><a href="<%=request.getContextPath() %>/jsp/Teacher/teacherInfo.jsp" target="iframes">查询老师</a></dd>
			    </dl>
			  </li>
			  <li class="layui-nav-item">
			    <a href="javascript:;">学生信息管理</a>
			    <dl class="layui-nav-child">
			      <dd><a href="jsp/student/addStudent.jsp" target="iframes">新增学生</a></dd>
			      <dd><a href="<%=request.getContextPath() %>/jsp/student/studentInfo.jsp" target="iframes">查询学生</a></dd>
			    </dl>
			  </li>
			   <li class="layui-nav-item">
			    <a href="javascript:;">课程信息管理</a>
			    <dl class="layui-nav-child">
			      <dd><a>新增课程</a></dd>
			      <dd><a>查询课程</a></dd>
			    </dl>
			  </li>
			   <li class="layui-nav-item">
			    <a href="javascript:;">专业信息管理</a>
			    <dl class="layui-nav-child">
			      <dd><a  href="jsp/profess/addProfess.jsp" target="iframes">新增专业</a></dd>
			      <dd><a  href="<%=request.getContextPath() %>/selectProfess" target="iframes">查询专业</a></dd>
			    </dl>
			  </li>
			  <li class="layui-nav-item">
			    <a href="javascript:;">系别信息管理</a>
			    <dl class="layui-nav-child">
			      <dd><a href="jsp/department/addDepart.jsp" target="iframes">新增系别</a></dd>
			      <dd><a href="<%=request.getContextPath() %>/selectDepart" target="iframes">查询系别</a></dd>
			    </dl>
			  </li>
			</ul>
  		</div>
  		<div class="mid-right">
  			<iframe name="iframes" src="jsp/Teacher/addTeacher.jsp" width="800px" height="500px" id="ifr"></iframe>
  		</div>
  		
  	</div>
  	<div class="botton"><a>版本V1.2.2&copy;aoao所有</a></div>
  	
    


 
<script>
//注意：导航 依赖 element 模块，否则无法进行功能性操作
	layui.use('element', function(){
	  var element = layui.element;
	  
	  //…
	});
	
</script>
<script>
	window.onbeforeunload = function(e){
	  		$.ajax('<%=request.getContextPath()%>/loginOut',{
	  			async:false
	  		});
	  	};
	<%-- setInterval(function(){
		$.post('<%=request.getContextPath()%>/loginCount',function(date){
			$("#count").html(date);
		},'text');
	}, 1000); --%>
	$(function(){
		$.post('<%=request.getContextPath()%>/loginCount',function(date){
			$("#count").html(date);
		},'text');
	});
</script>
  </body>
</html>
