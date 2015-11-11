package com.hrms.pa.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hrms.pa.entity.pChange;
import com.hrms.pa.manager.UserManager;

public class UpdateInfo extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public UpdateInfo() {
		super();
	}

	/**
	 * Destruction of the servlet. <br>
	 */
	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}

	/**
	 * The doGet method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to get.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doPost(request,response);
	}

	/**
	 * The doPost method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to post.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
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
		
		request.setAttribute("pc", pchange);
		request.getRequestDispatcher("/WEB-INF/pa/updatepChange.jsp").forward(request, response);
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
