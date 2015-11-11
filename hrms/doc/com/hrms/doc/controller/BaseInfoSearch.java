package com.hrms.doc.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hrms.doc.entity.BaseInfo;
import com.hrms.doc.manager.BaseInfoManager;

public class BaseInfoSearch extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public BaseInfoSearch() {
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

		String item = request.getParameter("item");
		BaseInfoManager manager = new BaseInfoManager();
		if(item.equals("enter")){
			request.getRequestDispatcher("/WEB-INF/doc/baseInfoSearch.jsp").forward(request, response);
		}else if(item.equals("search")){
			String content = request.getParameter("content");
			
			List<BaseInfo> infos = manager.querybaseInfoByKey(content);
			if(infos.size() > 0){
				request.setAttribute("infos", infos);
				request.getRequestDispatcher("/WEB-INF/doc/baseInfoSearch.jsp").forward(request, response);
			}else{
				request.setAttribute("in", "no");
				request.getRequestDispatcher("/WEB-INF/doc/baseInfoSearch.jsp").forward(request, response);
			}
		}else if(item.equals("soso")){
			request.getRequestDispatcher("/WEB-INF/doc/searchInfo.jsp").forward(request, response);
		}else if(item.equals("so")){
			String str = request.getParameter("str");
			String key = request.getParameter("key");
			List<BaseInfo> infos = manager.searchInfoByKey(str, key);
			request.setAttribute("infos", infos);
			request.getRequestDispatcher("/WEB-INF/doc/searchInfo.jsp").forward(request, response);
		}
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
