package com.hrms.pa.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hrms.pa.entity.pChange;
import com.hrms.pa.manager.UserManager;



public class AddpChange extends HttpServlet {

	public AddpChange() {
		super();
	}

	public void destroy() {
		super.destroy(); 
	}

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		this.doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
			String pchange_id = request.getParameter("pchange_id");
			String pchange_name = request.getParameter("pchange_name");
			String pchange_time = request.getParameter("pchange_time");
			String pchange_pstate = request.getParameter("pchange_pstate");
			String pchange_astate = request.getParameter("pchange_astate");
			String pchange_class = request.getParameter("pchange_class");
			String pchange_emp_id = request.getParameter("pchange_emp_id");
			
			pChange pchange = new pChange();
			pchange.setPchange_id(pchange_id);
			pchange.setPchange_name(pchange_name);
			pchange.setPchange_time(pchange_time);
			pchange.setPchange_pstate(pchange_pstate);
			pchange.setPchange_astate(pchange_astate);
			pchange.setPchange_class(pchange_class);
			pchange.setPchange_emp_id(pchange_emp_id);
			UserManager um = new UserManager();
			um.addpChange(pchange);
			List<pChange> pcs = um.queryAllpChanges();
			request.setAttribute("pcs",pcs);
			
			request.getRequestDispatcher("/WEB-INF/pa/listpChange.jsp").forward(request, response);
			
		
	}

	
	public void init() throws ServletException {
		// Put your code here
	}

}
