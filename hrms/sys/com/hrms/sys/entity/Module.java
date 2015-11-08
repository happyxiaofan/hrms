package com.hrms.sys.entity;

public class Module {

	private String m_id;
	
	private String m_name;
	
	private String role_id;
	
	private String module_role_name;
	
	

	public String getRole_id() {
		return role_id;
	}

	public void setRole_id(String role_id) {
		this.role_id = role_id;
	}

	public String getModule_role_name() {
		return module_role_name;
	}

	public void setModule_role_name(String module_role_name) {
		this.module_role_name = module_role_name;
	}

	public Module(String m_id, String m_name) {
		this.m_id = m_id;
		this.m_name = m_name;
	}
	
	public Module(){
		
	}

	public String getM_id() {
		return m_id;
	}

	public void setM_id(String m_id) {
		this.m_id = m_id;
	}

	public String getM_name() {
		return m_name;
	}

	public void setM_name(String m_name) {
		this.m_name = m_name;
	}
	
	
}
