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

public class UpdateDept extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String dept_id = request.getParameter("dept_id");
		String dept_name = request.getParameter("dept_name");
		String dept_num = request.getParameter("dept_num");
		String status = request.getParameter("status");
		
		Department department = new Department();
		department.setDept_id(dept_id);
		department.setDept_name(dept_name);
		department.setDept_num(Integer.valueOf(dept_num));
		department.setStatus(Integer.valueOf(status));
		
		
		DepartmentManager manager = new DepartmentManager();
		manager.updateDeptInfo(department);
		List<Department> depts = manager.queryAllDepts();
		//添加到Session
		if(depts.size() > 0 && depts != null){
			request.setAttribute("depts", depts);
			request.getRequestDispatcher("/WEB-INF/sys/listDept.jsp").forward(request, response);
		}
		
	}

}
