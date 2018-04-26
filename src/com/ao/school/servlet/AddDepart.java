package com.ao.school.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ao.school.entity.Department;
import com.ao.school.util.JdbcUtil;

public class AddDepart extends HttpServlet{

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
		Connection conn = null;
		RequestDispatcher re = req.getRequestDispatcher("/jsp/department/addDepart.jsp");
		String depno = req.getParameter("no");
		String depname = req.getParameter("name");
		List<Object> list = JdbcUtil.selects(Department.class, "select * from tb_depart");
		for (Object obj : list) {
			Department de = (Department)obj;
			//System.out.println(de);
			if(de.getDep_no().equals(depno)){
				req.setAttribute("returnInfo", "系别号已存在，添加失败！");
				re.forward(req, resp);
				return;
			}
		}
		boolean resu = JdbcUtil.update("insert into tb_depart(dep_no,dep_name) values(?,?)",depno,depname);
		if(resu){
			req.setAttribute("returnInfo", "添加成功！");
		}
		else{
			req.setAttribute("returnInfo", "系统错误,添加失败！");
		}
		re.forward(req, resp);
	}
	
}
