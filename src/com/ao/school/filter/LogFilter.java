package com.ao.school.filter;

import java.io.IOException;


import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LogFilter implements Filter{

	@Override
	public void doFilter(ServletRequest arg0, ServletResponse arg1,
			FilterChain arg2) throws IOException, ServletException {
		System.out.println("拦截进来了");
		HttpServletRequest req = (HttpServletRequest) arg0;
		HttpServletResponse resp = (HttpServletResponse) arg1;
		HttpSession session  = req.getSession();
		String url = req.getRequestURI();
		if(url.endsWith("/login") || url.endsWith("/login.jsp") || url.endsWith(".js") || url.endsWith(".css")){
			arg2.doFilter(arg0, arg1);
		}
		else if (session != null && session.getAttribute("username") != null) {
			arg2.doFilter(arg0, arg1);
		}
		else{
			System.out.println("响应了");
			//resp.setHeader("refresh", "5;url="+req.getContextPath()+"/login.jsp");
			resp.setContentType("text/html;charset=utf-8");
			resp.getWriter().write("<script>top.location.href="+req.getContextPath()+"/login.jsp</script>");
		}
		System.out.println("拦截出去了");
		
	}

	@Override
	public void destroy() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void init(FilterConfig arg0) throws ServletException {
		// TODO Auto-generated method stub
		
	}


	
}
