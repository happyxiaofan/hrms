package com.hrms.sys.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hrms.sys.entity.Employee;
import com.hrms.sys.manager.UserManager;

public class DeleteEmp extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public DeleteEmp() {
		super();
	}

	public void destroy() {
		super.destroy();
	}

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	@SuppressWarnings("null")
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String e_id = request.getParameter("e_id");
		System.out.println(e_id);
		
		UserManager manager = new UserManager();
		manager.deleteUserByUserId(e_id);
		
		List<Employee> emps = manager.queryAllEmps();
		if(emps!=null && emps.size() > 0){
			request.setAttribute("emps1", emps);
			request.getRequestDispatcher("/WEB-INF/sys/listEmp.jsp").forward(request, response);
		}
	}

	public void init() throws ServletException {
		
	}

}
