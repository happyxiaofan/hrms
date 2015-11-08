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
import com.hrms.sys.entity.Role;
import com.hrms.sys.manager.RoleEmpManager;
import com.hrms.sys.manager.RoleManager;
import com.hrms.sys.manager.UserManager;

public class DisEmpRoleServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

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

		String item = request.getParameter("item");
		
		UserManager userManager = new UserManager();
		RoleManager roleManager = new RoleManager();
		RoleEmpManager roleEmpManager = new RoleEmpManager();
		
		if(item.equals("dis")){
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
			//获取该部门所有的角色
			List<Role> roles = roleManager.queryAllRoles();
			
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
			
			request.setAttribute("pList", pList);
			request.setAttribute("roles", roles);
			request.setAttribute("page", page);
			
			request.getRequestDispatcher("/WEB-INF/sys/disEmpRole.jsp").forward(request, response);
			
		}else if(item.equals("disRole")){
			
			String[] emp_role_ids = request.getParameterValues("empRole");
			String[] e_ids = request.getParameterValues("e_id");
			String[] e_names = request.getParameterValues("e_name");
			
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
			
			for(int i=0;i<emp_role_ids.length;i++){
				Employee emp = pList.get(i);
				/*if(emp_role_ids[i].equals("请选择角色") || emp.getRole_id().equals(emp_role_ids[i])){
						continue;
				}*/
				emp.setE_id(e_ids[i]);
				emp.setEname(e_names[i]);
				emp.setRole_id(emp_role_ids[i]);
				
				userManager.updateEmpById(emp.getE_id(), emp_role_ids[i]);
			}
			
			for (Employee employee : pList) {
				String emp_role_id2 = employee.getRole_id();
				if(emp_role_id2 == null){
					continue;
				}
				String emp_role_name = roleEmpManager.queryRoleName(emp_role_id2);
				employee.setEmp_role_name(emp_role_name);
			}
			
			request.setAttribute("pList2", pList);
			request.setAttribute("page", page);
			
			request.getRequestDispatcher("/WEB-INF/sys/listEmp2.jsp").forward(request, response);
		}
	}

	/**
	 * Returns information about the servlet, such as 
	 * author, version, and copyright. 
	 *
	 * @return String information about this servlet
	 */
	public String getServletInfo() {
		return "This is my default servlet created by Eclipse";
	}

}
