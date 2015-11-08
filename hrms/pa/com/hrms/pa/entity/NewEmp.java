package com.hrms.pa.entity;

import java.sql.Date;


public class NewEmp{
	private String emp_id;
	private String emp_name;
	private String emp_gender;
	private Date emp_jointime;
	private String emp_education;
    private String emp_degree; 
    private String emp_department;
    private String emp_job;
    private String emp_post;
    private String emp_job_state;
    
	public String getEmp_id() {
		return emp_id;
	}
	public void setEmp_id(String emp_id) {
		this.emp_id = emp_id;
	}
	public String getEmp_name() {
		return emp_name;
	}
	public void setEmp_name(String emp_name) {
		this.emp_name = emp_name;
	}
	public String getEmp_gender() {
		return emp_gender;
	}
	public void setEmp_gender(String emp_gender) {
		this.emp_gender = emp_gender;
	}
	public Date getEmp_jointime() {
		return emp_jointime;
	}
	public void setEmp_jointime(Date emp_jointime) {
		this.emp_jointime = emp_jointime;
	}
	public String getEmp_education() {
		return emp_education;
	}
	public void setEmp_education(String emp_education) {
		this.emp_education = emp_education;
	}
	public String getEmp_degree() {
		return emp_degree;
	}
	public void setEmp_degree(String emp_degree) {
		this.emp_degree = emp_degree;
	}
	public String getEmp_department() {
		return emp_department;
	}
	public void setEmp_department(String emp_department) {
		this.emp_department = emp_department;
	}
	public String getEmp_job() {
		return emp_job;
	}
	public void setEmp_job(String emp_job) {
		this.emp_job = emp_job;
	}
	public String getEmp_post() {
		return emp_post;
	}
	public void setEmp_post(String emp_post) {
		this.emp_post = emp_post;
	}
	public String getEmp_job_state() {
		return emp_job_state;
	}
	public void setEmp_job_state(String emp_job_state) {
		this.emp_job_state = emp_job_state;
	}
    
}
