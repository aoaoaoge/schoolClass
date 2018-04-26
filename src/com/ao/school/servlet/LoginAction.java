package com.ao.school.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ao.school.entity.Department;
import com.ao.school.entity.Loginer;
import com.ao.school.util.JdbcUtil;

public class LoginAction extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		
		req.setCharacterEncoding("utf-8");
		String getusername = req.getParameter("username");
		String getpwd = req.getParameter("pwd");
		
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet res = null;
		JdbcUtil jdbc =  new JdbcUtil();
		try {
			RequestDispatcher rd = null;
			Object obj = jdbc.select(Loginer.class, "select * from TB_login where username=? and password=?", getusername,getpwd);
			if(obj!=null){
				Loginer user = (Loginer)obj;
				req.getSession().setAttribute("countUser", user);
				req.getSession().setAttribute("username", user.getUserName());
				//System.out.println(user);
				switch (user.getUserType()) {
				case "0":
					rd = req.getRequestDispatcher("/jsp/adminMain.jsp");
					req.setAttribute("name", user.getUserName());
					rd.forward(req, resp);
					break;
				case "1":
					rd = req.getRequestDispatcher("/jsp/student/adminMain.jsp");
					req.setAttribute("name", user.getUserName());
					rd.forward(req, resp);
					break;
				case "2":
					rd = req.getRequestDispatcher("/jsp/Teacher/adminMain.jsp");
					req.setAttribute("name", user.getUserName());
					rd.forward(req, resp);
					break;
				}
				
			}
			else{
				req.setAttribute("error", "账号或用户名错误，请重新登录！");
				rd = req.getRequestDispatcher("/login.jsp");
				rd.forward(req, resp);
			}

		}finally{
			
			try {
				if(conn!=null)
					conn.close();
				if(ps!=null)
					ps.close();
				if(res!=null)
					res.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
	}
	
}
