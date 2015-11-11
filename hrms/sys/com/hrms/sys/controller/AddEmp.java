package com.hrms.sys.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hrms.sys.entity.Employee;
import com.hrms.sys.manager.UserManager;

public class AddEmp extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public AddEmp() {
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

		doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String item = request.getParameter("item");
		UserManager manager = new UserManager();
		if(item.equals("query")){
			request.getRequestDispatcher("/WEB-INF/sys/addEmp.jsp").forward(request, response);
		}else if(item.equals("add")){
			String e_id = request.getParameter("e_id");
			String e_name = request.getParameter("e_name");
			String passwd = request.getParameter("passwd");
			
			Employee emp = new Employee();
			emp.setE_id(e_id);
			emp.setEname(e_name);
			emp.setPwd(passwd);
			
			boolean isExist = manager.isValid(emp);
			if(!isExist){
				manager.addEmp(emp);
				List<Employee> emps = manager.queryAllEmps();
				request.setAttribute("emps1", emps);
				request.getRequestDispatcher("/WEB-INF/sys/listEmp.jsp").forward(request, response);
			}
		}else if(item.equals("view")){
			String e_id = request.getParameter("e_id");
			String e_name = request.getParameter("e_name");
			String passwd = request.getParameter("passwd");
			
			Employee emp = new Employee();
			emp.setE_id(e_id);
			emp.setEname(e_name);
			emp.setPwd(passwd);
			
			request.setAttribute("emp", emp);
			request.getRequestDispatcher("/WEB-INF/sys/updateEmp.jsp").forward(request, response);
		}else if(item.equals("up")){
			request.getRequestDispatcher("/WEB-INF/sys/updatePwd.jsp").forward(request, response);
		}else if(item.equals("updatePwd")){
			String pwd = request.getParameter("passwd1");
			String e_name = new String(request.getParameter("e_name").getBytes("ISO-8859-1"),"utf-8");
			
			manager.updatePwdByName(e_name,pwd);
			request.setAttribute("success", "修改成功");
			request.getRequestDispatcher("/WEB-INF/sys/forward.jsp").forward(request, response);
		}
	}
}

