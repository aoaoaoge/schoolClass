package com.ao.school.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ao.school.entity.Department;
import com.ao.school.entity.Teacher;
import com.ao.school.util.JdbcUtil;

public class SelectAllTeacher extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		this.doPost(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		RequestDispatcher rd = req.getRequestDispatcher("/jsp/Teacher/allTeachers.jsp");
		List<Teacher> delist = new ArrayList<>();
		List<Object> list =JdbcUtil.selects(Teacher.class, "select * from tb_teachers");
		for (Object object : list) {
			Teacher de = (Teacher)object;
			//System.out.println(de);
			delist.add(de);
		}
		req.setAttribute("teacherInfo", delist);
		rd.forward(req, resp);
	}
	
}
