package com.hrms.sys.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hrms.sys.entity.Employee;
import com.hrms.sys.manager.UserManager;

public class UpdateEmp extends HttpServlet {

	public UpdateEmp() {
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

		String e_id = request.getParameter("e_id");
		String e_name = request.getParameter("e_name");
		String passwd = request.getParameter("passwd");
		
		Employee emp = new Employee();
		emp.setE_id(e_id);
		emp.setEname(e_name);
		emp.setPwd(passwd);
		
		UserManager manager = new UserManager();
		manager.updateEmp(emp);
		
		List<Employee> emps = manager.queryAllEmps();
		if(emps.size() > 0 && emps !=null){
			request.setAttribute("emps1", emps);
			request.getRequestDispatcher("/WEB-INF/sys/listEmp.jsp").forward(request, response);
		}
	}

}
