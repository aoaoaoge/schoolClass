package com.ao.school.servlet;

import java.io.IOException;
import java.util.List;

import javax.json.JsonArray;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;

import com.ao.school.entity.Department;
import com.ao.school.util.JdbcUtil;

public class SelectXb extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		this.doPost(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		List<Department> departlist = (List<Department>)JdbcUtil.selects(Department.class, "select * from tb_depart");
		String json = JSONArray.fromObject(departlist).toString();
		resp.setCharacterEncoding("utf-8");
		resp.getWriter().write(json);
		//System.out.println(json);
	}
	
}
