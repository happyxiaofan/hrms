package com.hrms.pa.controller;


import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hrms.pa.entity.Employee;
import com.hrms.pa.manager.UserManager;


public class LoginServlet extends HttpServlet {

	public LoginServlet() {
		super();
	}

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String uname = request.getParameter("userName");
		String pwd = request.getParameter("passwd");
		
		//验证用户名
		UserManager userManager = new UserManager();
		Employee emp = new Employee();
		emp.setEname(uname);
		emp.setPwd(pwd);
		boolean isValid = userManager.isValid(emp);
		if(isValid){//验证成功
			request.setAttribute("ename", uname);
			request.getRequestDispatcher("/main.html").forward(request, response);
		}else{//验证失败
			request.getRequestDispatcher("/WEB-INF/demo/login.jsp").forward(request, response);
		}
	}

}
