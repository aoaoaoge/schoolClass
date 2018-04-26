package com.ao.school.entity;

import javax.servlet.http.HttpSessionBindingEvent;
import javax.servlet.http.HttpSessionBindingListener;

public class Loginer implements HttpSessionBindingListener{
	private static int logCount = 0;
	private int id;
	private String UserName;
	private String State;
	private String UserType;
	public Loginer(int id, String userName, String state, String userType) {
		super();
		this.id = id;
		UserName = userName;
		State = state;
		UserType = userType;
	}
	public Loginer() {
		super();
		// TODO Auto-generated constructor stub
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getUserName() {
		return UserName;
	}
	public void setUserName(String userName) {
		UserName = userName;
	}
	public String getState() {
		return State;
	}
	public void setState(String state) {
		State = state;
	}
	public String getUserType() {
		return UserType;
	}
	public void setUserType(String userType) {
		UserType = userType;
	}
	@Override
	public String toString() {
		return "Loginer [id=" + id + ", UserName=" + UserName + ", State="
				+ State + ", UserType=" + UserType + "]";
	}
	@Override
	public void valueBound(HttpSessionBindingEvent arg0) {
		arg0.getSession().getServletContext().setAttribute("logCount", ++logCount);
	}
	@Override
	public void valueUnbound(HttpSessionBindingEvent arg0) {
		arg0.getSession().getServletContext().setAttribute("logCount", --logCount);
	}
	
	
}
