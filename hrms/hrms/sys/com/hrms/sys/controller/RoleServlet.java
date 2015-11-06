package com.hrms.sys.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hrms.commons.utils.Validator;
import com.hrms.sys.entity.Role;
import com.hrms.sys.manager.RoleManager;

public class RoleServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String item = request.getParameter("item");
		RoleManager manager = new RoleManager();
		if(item.equals("query")){
			List<Role> roles = manager.queryAllRoles();
			if(Validator.isValid(roles)){
				request.setAttribute("roles", roles);
				request.getRequestDispatcher("/WEB-INF/sys/listRole.jsp").forward(request, response);
			}
		}else if(item.equals("addRole")){
			String role_id = request.getParameter("role_id");
			String role_name = request.getParameter("role_name");
			
			Role role = new Role();
			role.setRole_id(role_id);
			role.setRole_name(role_name);
			
			manager.addRole(role);
			
			List<Role> roles = manager.queryAllRoles();
			if(Validator.isValid(roles)){
				request.setAttribute("roles", roles);
				request.getRequestDispatcher("/WEB-INF/sys/listRole.jsp").forward(request, response);
			}
		}else if(item.equals("deleteRole")){
			String role_id = request.getParameter("role_id");
			
			manager.deleteRoleById(role_id);
			List<Role> roles = manager.queryAllRoles();
			if(Validator.isValid(roles)){
				request.setAttribute("roles", roles);
				request.getRequestDispatcher("/WEB-INF/sys/listRole.jsp").forward(request, response);
			}
		}else if(item.equals("updateRole")){
			String role_id = request.getParameter("role_id");
			String role_name = request.getParameter("role_name");
			Role role = new Role();
			role.setRole_id(role_id);
			role.setRole_name(role_name);
			manager.updateRoleInfo(role);
			
			List<Role> roles = manager.queryAllRoles();
			if(Validator.isValid(roles)){
				request.setAttribute("roles", roles);
				request.getRequestDispatcher("/WEB-INF/sys/listRole.jsp").forward(request, response);
			}
		}else if(item.equals("add")){
			request.getRequestDispatcher("/WEB-INF/sys/addRole.jsp").forward(request, response);
		}else if(item.equals("view")){
			String role_id = request.getParameter("role_id");
			String role_name = request.getParameter("role_name");
			Role role = new Role();
			role.setRole_id(role_id);
			role.setRole_name(role_name);
			
			request.setAttribute("role", role);
			request.getRequestDispatcher("/WEB-INF/sys/updateRole.jsp").forward(request, response);
			
		}
	}

}
