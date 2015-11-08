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

public class DeletepChange extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public DeletepChange() {
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
		this.doPost(request, response);
	}

	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String pchange_id = request.getParameter("pchange_id");
		UserManager hm = new UserManager();
		hm.deletepChangeById(pchange_id);
		List<pChange> pcs = hm.queryAllpChanges();
		/*if(pcs.size()>0 && pcs != null){*/
			request.setAttribute("pcs", pcs);
			request.getRequestDispatcher("/WEB-INF/pa/listpChange.jsp").forward(request, response);
		/*}*/
	}

	public void init() throws ServletException {
		// Put your code here
	}

}
