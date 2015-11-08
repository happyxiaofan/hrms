package com.hrms.pa.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hrms.pa.entity.NewEmployee;
import com.hrms.pa.manager.UserManager;





public class NewEmp extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public NewEmp() {
		super();
	}

	/**
	 * Destruction of the servlet. <br>
	 */
	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}

	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
		
	}

	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		UserManager manager = new UserManager();
		
		List<NewEmployee> newemps = manager.queryNewEmployees();
		
		request.setAttribute("newemps", newemps);
		request.getRequestDispatcher("/WEB-INF/pa/newEmp.jsp").forward(request, response);
			
	}

	
	public void init() throws ServletException {
		// Put your code here
	}

}
