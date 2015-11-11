package com.hrms.pa.entity;

public class PaInfo {
	private String e_name;
	private String post;
	private String job;
	private String pchange_time;
	private String pchange_pstate;
	private String pchange_astate;
	private String pchange_reason;
	public String getE_name() {
		return e_name;
	}
	public void setE_name(String eName) {
		e_name = eName;
	}
	public String getPost() {
		return post;
	}
	public void setPost(String post) {
		this.post = post;
	}
	public String getJob() {
		return job;
	}
	public void setJob(String job) {
		this.job = job;
	}
	public String getPchange_time() {
		return pchange_time;
	}
	public void setPchange_time(String pchangeTime) {
		pchange_time = pchangeTime;
	}
	public String getPchange_pstate() {
		return pchange_pstate;
	}
	public void setPchange_pstate(String pchangePstate) {
		pchange_pstate = pchangePstate;
	}
	public String getPchange_astate() {
		return pchange_astate;
	}
	public void setPchange_astate(String pchangeAstate) {
		pchange_astate = pchangeAstate;
	}
	public String getPchange_reason() {
		return pchange_reason;
	}
	public void setPchange_reason(String pchangeReason) {
		pchange_reason = pchangeReason;
	}
}
