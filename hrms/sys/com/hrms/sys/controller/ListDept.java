package com.hrms.sys.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hrms.sys.entity.Department;
import com.hrms.sys.manager.DepartmentManager;

public class ListDept extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		DepartmentManager manager = new DepartmentManager();
		List<Department> depts = manager.queryAllDepts();
		//添加到Session
		request.setAttribute("depts", depts);
		request.getRequestDispatcher("/WEB-INF/sys/listDept.jsp").forward(request, response);
	}

}
