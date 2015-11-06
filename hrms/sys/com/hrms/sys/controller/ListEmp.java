package com.hrms.sys.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hrms.sys.entity.Employee;
import com.hrms.sys.manager.RoleEmpManager;
import com.hrms.sys.manager.UserManager;

public class ListEmp extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public ListEmp() {
		super();
	}

	public void destroy() {
		super.destroy();
	}

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		UserManager manager = new UserManager();
		RoleEmpManager roleEmpManager = new RoleEmpManager();
		List<Employee> emps = manager.queryAllEmps();
		for (Employee employee : emps) {
			String emp_role_id2 = employee.getRole_id();
			String emp_role_name = roleEmpManager.queryRoleName(emp_role_id2);
			employee.setEmp_role_name(emp_role_name);
		}
		//添加到request中
		request.setAttribute("pList", emps);
		request.getRequestDispatcher("/WEB-INF/sys/listEmp.jsp").forward(request, response);
	}

	/**
	 * Initialization of the servlet. <br>
	 *
	 * @throws ServletException if an error occurs
	 */
	public void init() throws ServletException {
		// Put your code here
	}

}
