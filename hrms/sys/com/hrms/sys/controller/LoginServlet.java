package com.hrms.sys.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.hrms.sys.entity.Employee;
import com.hrms.sys.manager.RoleEmpManager;
import com.hrms.sys.manager.UserManager;

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
		RoleEmpManager roleEmpManager = new RoleEmpManager();
		
		Employee emp = new Employee();
		emp.setEname(uname);
		emp.setPwd(pwd);
		boolean isValid = userManager.isValid(emp);
		if(isValid){//验证成功
//			request.setAttribute("ename", uname);
			
			//根据登录账号判断当前登录用户的角色
			String e_id = userManager.queryEmpByName(uname);
			String emp_role_id = userManager.queryEmpRoleIdByEId(e_id);
			String role_name = roleEmpManager.queryRoleName(emp_role_id);
			
			//把用户信息添加到Session中
			HttpSession session = request.getSession();
			session.setAttribute("e_name", uname);
			session.setAttribute("role_name", role_name);
			if(role_name.equals("系统管理员")){
				request.getRequestDispatcher("/main.html").forward(request, response);
			}else if(role_name.equals("HR")){
				request.getRequestDispatcher("/pa_main.jsp").forward(request, response);
			}else if(role_name.equals("档案管理员")){
				request.getRequestDispatcher("/doc_main.jsp").forward(request, response);
			}else if(role_name.equals("培训人员")){
				
			}
			
		}else{//验证失败
			request.getRequestDispatcher("/index2.jsp").forward(request, response);
		}
	}

}
