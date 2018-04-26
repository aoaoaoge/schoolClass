package com.ao.school.listener;

import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

public class LoginOut implements HttpSessionListener{
	private static int logCount;
	@Override
	public void sessionCreated(HttpSessionEvent arg0) {
		// TODO Auto-generated method stub
		arg0.getSession().getServletContext().setAttribute("logCount", logCount);
	}

	@Override
	public void sessionDestroyed(HttpSessionEvent arg0) {
		// TODO Auto-generated method stub
		System.out.println("退了!");
		arg0.getSession().getServletContext().setAttribute("logCount", --logCount);
	}
	
}
