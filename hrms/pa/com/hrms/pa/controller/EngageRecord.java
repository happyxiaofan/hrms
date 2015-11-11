package com.hrms.pa.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hrms.pa.entity.EngageRecordEmp;
import com.hrms.pa.manager.UserManager;

public class EngageRecord extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String item = request.getParameter("item");
		if(item.equals("edit")){
			UserManager uManager = new UserManager();
			List<EngageRecordEmp> eremps = uManager.queryEngageRecordEmps();
			request.setAttribute("eremps", eremps);
			request.getRequestDispatcher("/WEB-INF/pa/engageRecord.jsp").forward(request, response);
		}else if(item.equals("add")){
			request.getRequestDispatcher("/WEB-INF/pa/addEngageRecord.jsp").forward(request, response);
		}else if(item.equals("view")){
			UserManager uManager = new UserManager();
			List<EngageRecordEmp> eremps = uManager.queryEngageRecordEmps();
			request.setAttribute("eremps", eremps);
			request.getRequestDispatcher("/WEB-INF/pa/engageRecordView.jsp").forward(request, response);
		}
	}

	public void init() throws ServletException {
		// Put your code here
	}

}
