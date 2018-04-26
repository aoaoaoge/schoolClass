package com.ao.school.entity;

public class Profess {
	private int Pro_id;
	private String Pro_no;
	private String Pro_name;
	private int Pro_depid;
	private String Pro_state;
	public int getPro_id() {
		return Pro_id;
	}
	public void setPro_id(int pro_id) {
		Pro_id = pro_id;
	}
	public String getPro_no() {
		return Pro_no;
	}
	public void setPro_no(String pro_no) {
		Pro_no = pro_no;
	}
	public String getPro_name() {
		return Pro_name;
	}
	public void setPro_name(String pro_name) {
		Pro_name = pro_name;
	}
	public int getPro_depid() {
		return Pro_depid;
	}
	public void setPro_depid(int pro_depid) {
		Pro_depid = pro_depid;
	}
	public String getPro_state() {
		return Pro_state;
	}
	public void setPro_state(String pro_state) {
		Pro_state = pro_state;
	}
	public Profess(int pro_id, String pro_no, String pro_name, int pro_depid,
			String pro_state) {
		super();
		Pro_id = pro_id;
		Pro_no = pro_no;
		Pro_name = pro_name;
		Pro_depid = pro_depid;
		Pro_state = pro_state;
	}
	public Profess() {
		super();
		// TODO Auto-generated constructor stub
	}
	@Override
	public String toString() {
		return "Profess [Pro_id=" + Pro_id + ", Pro_no=" + Pro_no
				+ ", Pro_name=" + Pro_name + ", Pro_depid=" + Pro_depid
				+ ", Pro_state=" + Pro_state + "]";
	}
	
}
