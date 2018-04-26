package com.ao.school.listener;

import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

public class LoginCount implements HttpSessionListener{

	private static int logCount = 0;
	@Override
	public void sessionCreated(HttpSessionEvent arg0) {
		arg0.getSession().getServletContext().setAttribute("logCount", logCount);
	}

	@Override
	public void sessionDestroyed(HttpSessionEvent arg0) {
		arg0.getSession().getServletContext().setAttribute("logCount", logCount);
		
	}
	
}
