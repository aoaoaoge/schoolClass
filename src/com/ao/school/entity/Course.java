package com.ao.school.entity;

public class Course {
	private int c_id;
	private String c_no;
	private String c_name;
	private int c_pro_id;
	public int getC_id() {
		return c_id;
	}
	public void setC_id(int c_id) {
		this.c_id = c_id;
	}
	public String getC_no() {
		return c_no;
	}
	public void setC_no(String c_no) {
		this.c_no = c_no;
	}
	public String getC_name() {
		return c_name;
	}
	public void setC_name(String c_name) {
		this.c_name = c_name;
	}
	public int getC_pro_id() {
		return c_pro_id;
	}
	public void setC_pro_id(int c_pro_id) {
		this.c_pro_id = c_pro_id;
	}
	public Course(int c_id, String c_no, String c_name, int c_pro_id) {
		super();
		this.c_id = c_id;
		this.c_no = c_no;
		this.c_name = c_name;
		this.c_pro_id = c_pro_id;
	}
	public Course() {
		super();
	}
	
}
