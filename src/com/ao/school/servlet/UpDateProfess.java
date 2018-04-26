package com.ao.school.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ao.school.util.JdbcUtil;

public class UpDateProfess extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		this.doPost(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		int id = Integer.parseInt(req.getParameter("id"));
		String no = req.getParameter("no");
		String name = req.getParameter("name");
		boolean res = JdbcUtil.update("update tb_profess set pro_no=?,pro_name=? where pro_id=?", no,name,id);
		resp.getWriter().write(String.valueOf(res));
	}
}
