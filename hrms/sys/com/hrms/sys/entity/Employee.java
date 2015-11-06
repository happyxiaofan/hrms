package com.hrms.sys.entity;

public class Employee {

	private String e_id;
	private String ename;
	private String pwd;
	private String role_id;
	
	private String emp_role_name;

	public String getEmp_role_name() {
		return emp_role_name;
	}

	public void setEmp_role_name(String emp_role_name) {
		this.emp_role_name = emp_role_name;
	}
	
	/**
	 * @return the ename
	 */
	public String getEname() {
		return ename;
	}
	/**
	 * @param ename the ename to set
	 */
	public void setEname(String ename) {
		this.ename = ename;
	}
	/**
	 * @return the pwd
	 */
	public String getPwd() {
		return pwd;
	}
	/**
	 * @param pwd the pwd to set
	 */
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getE_id() {
		return e_id;
	}
	public void setE_id(String e_id) {
		this.e_id = e_id;
	}
	public String getRole_id() {
		return role_id;
	}
	public void setRole_id(String role_id) {
		this.role_id = role_id;
	}
	
	
}
