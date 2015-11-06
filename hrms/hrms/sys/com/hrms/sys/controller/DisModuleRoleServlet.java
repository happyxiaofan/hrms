package com.hrms.sys.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hrms.sys.entity.Module;
import com.hrms.sys.entity.Role;
import com.hrms.sys.manager.ModuleManager;
import com.hrms.sys.manager.RoleManager;

public class DisModuleRoleServlet extends HttpServlet {

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
		
		ModuleManager moduleManager = new ModuleManager();
		RoleManager roleManager = new RoleManager();
		
		if(item.equals("dis")){
			//获取所有的模块
			List<Module> modules = moduleManager.queryAllModules();
			//获取所有的角色
			List<Role> roles = roleManager.queryAllRoles();
			
			request.setAttribute("modules", modules);
			request.setAttribute("roles", roles);
			
			request.getRequestDispatcher("/WEB-INF/sys/disModuleRole.jsp").forward(request, response);
			
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
