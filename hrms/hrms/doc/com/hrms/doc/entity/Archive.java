package com.hrms.doc.entity;

public class Archive {

	private String a_id;
	private String e_id;
	private String a_num;
	private String a_name;
	private String a_sum;
	private String a_note;
	
	public Archive(){}
	
	public Archive(String a_id, String e_id, String a_num, String a_name,
			String a_sum, String a_note) {
		super();
		this.a_id = a_id;
		this.e_id = e_id;
		this.a_num = a_num;
		this.a_name = a_name;
		this.a_sum = a_sum;
		this.a_note = a_note;
	}
	public String getA_id() {
		return a_id;
	}
	public void setA_id(String a_id) {
		this.a_id = a_id;
	}
	public String getE_id() {
		return e_id;
	}
	public void setE_id(String e_id) {
		this.e_id = e_id;
	}
	public String getA_num() {
		return a_num;
	}
	public void setA_num(String a_num) {
		this.a_num = a_num;
	}
	public String getA_name() {
		return a_name;
	}
	public void setA_name(String a_name) {
		this.a_name = a_name;
	}
	public String getA_sum() {
		return a_sum;
	}
	public void setA_sum(String a_sum) {
		this.a_sum = a_sum;
	}
	public String getA_note() {
		return a_note;
	}
	public void setA_note(String a_note) {
		this.a_note = a_note;
	}
	
	
}
