package com.hrms.pa.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hrms.pa.entity.pChange;

import com.hrms.pa.manager.UserManager;

public class ListpChange extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		this.doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		/*DepartmentManager manager = new DepartmentManager();
		List<Department> depts = manager.queryAllDepts();*/
		String item = request.getParameter("item");
		if(item.equals("edit")){
			UserManager um =new UserManager();
			List<pChange> pcs = um.queryAllpChanges();
			//添加到Session
			request.setAttribute("pcs", pcs);
			request.getRequestDispatcher("/WEB-INF/pa/listpChange.jsp").forward(request, response);
		}else if(item.equals("add")){
			request.getRequestDispatcher("/WEB-INF/pa/addpChange.jsp").forward(request, response);
		}
	}

}
