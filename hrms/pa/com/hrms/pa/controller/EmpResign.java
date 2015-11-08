package com.hrms.pa.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hrms.pa.entity.ResignEmployee;
import com.hrms.pa.manager.UserManager;

public class EmpResign extends HttpServlet {

	public EmpResign() {
		super();
	}

	
	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}

	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doPost(request, response);
		
	}

	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		UserManager um = new UserManager();
		
		List<ResignEmployee> resignEmps = um.queryrResignEmployees();
		
		request.setAttribute("resignEmps",resignEmps);
		request.getRequestDispatcher("/WEB-INF/pa/empResign.jsp").forward(request, response);
		
	}

	public void init() throws ServletException {
		// Put your code here
	}

}
