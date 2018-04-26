package com.ao.school.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ao.school.entity.Profess;
import com.ao.school.util.JdbcUtil;

public class SelectProfess extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		this.doPost(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		RequestDispatcher rd = req.getRequestDispatcher("/jsp/profess/professInfo.jsp");
		List<Profess> delist = new ArrayList<>();
		List<Object> list =JdbcUtil.selects(Profess.class, "select * from tb_profess");
		for (Object object : list) {
			Profess de = (Profess)object;
			//System.out.println(de);
			delist.add(de);
		}
		req.setAttribute("professInfo", delist);
		rd.forward(req, resp);
		
	}
}
