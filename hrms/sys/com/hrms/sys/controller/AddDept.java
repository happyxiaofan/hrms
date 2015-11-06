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

public class AddDept extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String item = request.getParameter("item");
		if(item.equals("query")){
			request.getRequestDispatcher("/WEB-INF/sys/addDept.jsp").forward(request, response);
		}else if(item.equals("add")){
			
			String dept_status = request.getParameter("dept_status");
			String dept_name = request.getParameter("dept_name");
			String dept_num = request.getParameter("dept_num");
			String dept_id = request.getParameter("dept_id");
			
			Department dept = new Department();
			dept.setDept_id(dept_id);
			dept.setDept_name(dept_name);
			dept.setDept_num(Integer.valueOf(dept_num));
			dept.setStatus(Integer.valueOf(dept_status));
			
			DepartmentManager manager = new DepartmentManager();
			manager.addDept(dept);
			List<Department> depts = manager.queryAllDepts();
			request.setAttribute("depts", depts);
			request.getRequestDispatcher("/WEB-INF/sys/listDept.jsp").forward(request, response);
		}else if(item.equals("view")){
			
			String dept_id = request.getParameter("dept_id");
			String dept_name = request.getParameter("dept_name");
			String dept_num = request.getParameter("dept_num");
			String status = request.getParameter("status");
			
			Department dept = new Department();
			dept.setDept_id(dept_id);
			dept.setDept_name(dept_name);
			dept.setDept_num(Integer.parseInt(dept_num));
			dept.setStatus(Integer.parseInt(status));
			
			request.setAttribute("dept", dept);
			request.getRequestDispatcher("/WEB-INF/sys/updateDept.jsp").forward(request, response);
		}
		
	}

}
