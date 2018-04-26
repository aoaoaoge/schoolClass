package com.ao.school.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;

import com.ao.school.entity.Course;
import com.ao.school.util.JdbcUtil;

public class SelectCourse extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		this.doPost(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		int id = Integer.parseInt(req.getParameter("depid"));
		List<Course> departlist = (List<Course>)JdbcUtil.selects(Course.class, "select * from tb_course where c_pro_id=?",id);
		String json = JSONArray.fromObject(departlist).toString();
		resp.setCharacterEncoding("utf-8");
		resp.getWriter().write(json);
		//System.out.println(json);
	}
}
