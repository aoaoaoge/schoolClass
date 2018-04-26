package com.ao.school.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ao.school.entity.Profess;
import com.ao.school.util.JdbcUtil;

public class AddProfess extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		this.doPost(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		resp.setContentType("utf-8");
		RequestDispatcher re = req.getRequestDispatcher("/jsp/profess/addProfess.jsp");
		String propno = req.getParameter("no");
		String proname = req.getParameter("name");
		String depid = req.getParameter("depid");
		List<Object> list = JdbcUtil.selects(Profess.class, "select * from tb_profess");
		for (Object obj : list) {
			Profess de = (Profess)obj;
			//System.out.println(de);
			if(de.getPro_no().equals(propno)){
				req.setAttribute("returnInfo", "系别号已存在，添加失败！");
				re.forward(req, resp);
				return;
			}
		}
		boolean resu = JdbcUtil.update("insert into tb_profess(pro_no,pro_name,pro_depid,pro_state) values(?,?,?,'1')",propno,proname,depid);
		if(resu){
			req.setAttribute("returnInfo", "添加成功！");
		}
		else{
			req.setAttribute("returnInfo", "系别号不存在,添加失败！");
		}
		re.forward(req, resp);
	}
}
