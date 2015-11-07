package com.hrms.doc.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface Action {

	String execute(HttpServletRequest request,HttpServletResponse response) throws Exception;
	
	List execute(String method,HttpServletRequest request,HttpServletResponse response);
}
