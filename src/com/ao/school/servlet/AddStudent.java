package com.ao.school.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ao.school.entity.Student;
import com.ao.school.util.JdbcUtil;

public class AddStudent extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		this.doPost(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		Connection conn = null;
		RequestDispatcher re = req.getRequestDispatcher("/jsp/student/addStudent.jsp");
		String sid = req.getParameter("sid");
		String sname = req.getParameter("name");
		String spwd = req.getParameter("password");
		int xb = Integer.parseInt(req.getParameter("depart"));
		String date = req.getParameter("date");
		String idcard = req.getParameter("idcard");
		String sex = req.getParameterValues("sex")[0];
		String type = req.getParameter("type");
		conn = JdbcUtil.conn();
		
		if(!(JdbcUtil.update("INSERT INTO tb_login(UserName,password,state,usertype) VALUES(?,?,'1','1');",sid,spwd))){
			req.setAttribute("returnInfo", "用户名已存在，请重新输入！");
			re.forward(req, resp);
			return;
		}
		
		List<Object> tealist = JdbcUtil.selects(Student.class, "select * from tb_students");
		for (Object obj : tealist) {
			Student tea = (Student)obj;
			System.out.println(tea);
			if(idcard.equals(tea.getS_zip())){
				req.setAttribute("returnInfo", "身份证号已存在！");
				re.forward(req, resp);
				return;
			}
		}
		boolean resu = JdbcUtil.update("INSERT INTO tb_students(t_no,t_name,t_zip,t_date,t_depno,s_pro_id) VALUES(?,?,?,?,?,2);",sid,sname,idcard,date,xb);
		if(resu){
			req.setAttribute("returnInfo", "添加成功！");
		}
		else{
			req.setAttribute("returnInfo", "系统错误,添加失败！");
		}
		re.forward(req, resp);
	}
	
}
