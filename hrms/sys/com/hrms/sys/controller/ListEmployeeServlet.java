package com.hrms.sys.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hrms.sys.dao.EmployeeDao;
import com.hrms.sys.entity.Employee;
import com.hrms.sys.entity.Page;
import com.hrms.sys.manager.RoleEmpManager;

public class ListEmployeeServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	/**
	 * Constructor of the object.
	 */
	public ListEmployeeServlet() {
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

		doPost(request, response);
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
		RoleEmpManager roleEmpManager = new RoleEmpManager();
		int pagenum = 1;
		int pagesize = 10;
		
		if(request.getParameter("pagenum")!=null) {
			pagenum = Integer.parseInt(request.getParameter("pagenum"));
		}
		if(request.getParameter("pagesize")!=null) {
			pagesize = Integer.parseInt(request.getParameter("pagesize"));
		}
		
		int start = pagesize * pagenum - pagesize;
		int end = pagesize * pagenum;
		EmployeeDao pDao = new EmployeeDao();
		List<Employee> pList = pDao.pageQueryPerson(start, end);
		
		int recordcount = pDao.getRecordCount();//调用dao返回总记录数
		int pagecount = recordcount / pagesize;//计算页数
		if(recordcount%pagesize!=0) {
			pagecount++;
		}
		//填充page对象
		Page page = new Page();
		page.setPagesize(pagesize);
		page.setPagenum(pagenum);
		page.setPagecount(pagecount);
		page.setRecordcount(recordcount);
		
		for (Employee employee : pList) {
			String emp_role_id2 = employee.getRole_id();
			String emp_role_name = roleEmpManager.queryRoleName(emp_role_id2);
			employee.setEmp_role_name(emp_role_name);
		}
		
		request.setAttribute("pList", pList);
		request.setAttribute("page", page);
		request.getRequestDispatcher("/WEB-INF/sys/listEmp.jsp").forward(request, response);
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
