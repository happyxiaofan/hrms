package com.hrms.doc.entity;

public class Record {

	private String dept;
	private String job;
	private String edu;
	private String work;
	private String start_time;
	private String end_time;
	
	
	public Record(String dept, String job, String edu, String work,
			String start_time, String end_time) {
		this.dept = dept;
		this.job = job;
		this.edu = edu;
		this.work = work;
		this.start_time = start_time;
		this.end_time = end_time;
	}
	public Record() {
		// TODO Auto-generated constructor stub
	}
	public String getDept() {
		return dept;
	}
	public void setDept(String dept) {
		this.dept = dept;
	}
	public String getJob() {
		return job;
	}
	public void setJob(String job) {
		this.job = job;
	}
	public String getEdu() {
		return edu;
	}
	public void setEdu(String edu) {
		this.edu = edu;
	}
	public String getWork() {
		return work;
	}
	public void setWork(String work) {
		this.work = work;
	}
	public String getStart() {
		return start_time;
	}
	public void setStart(String start_time) {
		this.start_time = start_time;
	}
	public String getEnd() {
		return end_time;
	}
	public void setEnd(String end_time) {
		this.end_time = end_time;
	}
	
	
}
