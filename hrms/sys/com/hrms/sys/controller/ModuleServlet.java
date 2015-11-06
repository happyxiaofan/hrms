package com.hrms.sys.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hrms.commons.utils.Validator;
import com.hrms.sys.entity.Module;
import com.hrms.sys.manager.ModuleManager;

public class ModuleServlet extends HttpServlet {

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
		ModuleManager manager = new ModuleManager();
		if(item.equals("addModule")){
			String m_id = request.getParameter("m_id");
			String m_name = request.getParameter("m_name");
			
			Module module = new Module(m_id,m_name);
			
			manager.addModule(module);
			
			List<Module> modules = manager.queryAllModules();
			if(Validator.isValid(modules)){
				request.setAttribute("modules", modules);
				request.getRequestDispatcher("/WEB-INF/sys/listModule.jsp").forward(request, response);
			}
		}else if(item.equals("updateModule")){
			String m_id = request.getParameter("m_id");
			String m_name = request.getParameter("m_name");
			
			Module m = new Module();
			m.setM_id(m_id);
			m.setM_name(m_name);
			
			manager.updateModuleInfo(m);
			
			List<Module> modules = manager.queryAllModules();
			if(Validator.isValid(modules)){
				request.setAttribute("modules", modules);
				request.getRequestDispatcher("/WEB-INF/sys/listModule.jsp").forward(request, response);
			}
		}else if(item.equals("query")){
			List<Module> modules = manager.queryAllModules();
			if(Validator.isValid(modules)){
				request.setAttribute("modules", modules);
				request.getRequestDispatcher("/WEB-INF/sys/listModule.jsp").forward(request, response);
			}
		}else if(item.equals("deleteModule")){
			String m_id = request.getParameter("m_id");
			
			manager.deleteModuleById(m_id);
			
			List<Module> modules = manager.queryAllModules();
			if(Validator.isValid(modules)){
				request.setAttribute("modules", modules);
				request.getRequestDispatcher("/WEB-INF/sys/listModule.jsp").forward(request, response);
			}
		}else if(item.equals("add")){
			request.getRequestDispatcher("/WEB-INF/sys/addModule.jsp").forward(request, response);
		}else if(item.equals("view")){
			String m_id = request.getParameter("m_id");
			String m_name = request.getParameter("m_name");
			
			Module m = new Module();
			m.setM_id(m_id);
			m.setM_name(m_name);
			
			request.setAttribute("module", m);
			request.getRequestDispatcher("/WEB-INF/sys/updateModule.jsp").forward(request, response);
		}
	}

}
