package com.hrms.sys.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hrms.sys.entity.Department;
import com.hrms.sys.manager.DepartmentManager;

public class DeleteDept extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String dept_id = request.getParameter("dept_id");
		
		DepartmentManager manager = new DepartmentManager();
		manager.deleteDeptById(dept_id);
		
		List<Department> depts = manager.queryAllDepts();
		if(depts.size() > 0 && depts != null){
			request.setAttribute("depts", depts);
			request.getRequestDispatcher("/WEB-INF/sys/listDept.jsp").forward(request, response);
			
		}
	}

}
