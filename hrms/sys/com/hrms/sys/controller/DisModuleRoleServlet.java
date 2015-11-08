package com.hrms.sys.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hrms.sys.entity.Employee;
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
			
		}else if(item.equals("disRole")){
			String[]  module_role_ids = request.getParameterValues("moduleRole");
			String[] module_ids = request.getParameterValues("module_id");
			String[] module_names = request.getParameterValues("module_name");
			
			
			//获取所有的模块
			List<Module> modules = moduleManager.queryAllModules();
			
			for(int i=0;i<module_role_ids.length;i++){
				Module module = modules.get(i);
				
				module.setM_id(module_ids[i]);
				module.setM_name(module_names[i]);
				module.setRole_id(module_role_ids[i]);
				
				moduleManager.updateModuleById(module.getM_id(), module_role_ids[i]);
			}
			
			for (Module module : modules) {
				String module_role_id = module.getRole_id();
				if(module_role_id == null){
					continue;
				}
				String  module_role_name = roleManager.queryRoleName(module_role_id);
				module.setModule_role_name(module_role_name);
			}
			
			request.setAttribute("modules", modules);
			request.getRequestDispatcher("/WEB-INF/sys/listModule2.jsp").forward(request, response);
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
