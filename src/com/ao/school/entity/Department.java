package com.ao.school.entity;

public class Department {
	private int Dep_id;
	private String Dep_no;
	private String Dep_name;
	public int getDep_id() {
		return Dep_id;
	}
	public void setDep_id(int dep_id) {
		Dep_id = dep_id;
	}
	public String getDep_no() {
		return Dep_no;
	}
	public void setDep_no(String dep_no) {
		Dep_no = dep_no;
	}
	public String getDep_name() {
		return Dep_name;
	}
	public void setDep_name(String dep_name) {
		Dep_name = dep_name;
	}
	public Department(int dep_id, String dep_no, String dep_name) {
		super();
		Dep_id = dep_id;
		Dep_no = dep_no;
		Dep_name = dep_name;
	}
	public Department() {
		super();
		// TODO Auto-generated constructor stub
	}
	@Override
	public String toString() {
		return "Department [Dep_id=" + Dep_id + ", Dep_no=" + Dep_no
				+ ", Dep_name=" + Dep_name + "]";
	}
	
}
