package com.hrms.pa.controller;


import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hrms.pa.entity.RetireEmployee;
import com.hrms.pa.manager.UserManager;

public class EmpRetire extends HttpServlet {

	
	public EmpRetire() {
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
		UserManager userManager = new UserManager();
		
		List<RetireEmployee> remps = userManager.queryrRetireEmployees();
		
		request.setAttribute("remps", remps);
		request.getRequestDispatcher("/WEB-INF/pa/empRetire.jsp").forward(request, response);
		
	}

	
	public void init() throws ServletException {
		// Put your code here
	}

}
