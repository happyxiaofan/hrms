package com.hrms.doc.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hrms.doc.dao.ArchiveDAO;
import com.hrms.doc.dao.BaseInfoDAO;
import com.hrms.doc.entity.Archive;
import com.hrms.doc.entity.BaseInfo;
import com.hrms.doc.manager.ArchiveManager;
import com.hrms.sys.entity.Page;

public class ArchiveServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public ArchiveServlet() {
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
		ArchiveManager manager = new ArchiveManager();
		
		if(item.equals("add")){
			request.getRequestDispatcher("/WEB-INF/doc/archiveAdd.jsp").forward(request, response);
		}else if(item.equals("addFile")){
			String a_id = request.getParameter("a_id");
			String e_id = request.getParameter("e_id");
			String a_num = request.getParameter("a_num");
			String a_name = request.getParameter("a_name");
			String a_sum = request.getParameter("a_sum");
			String a_note = request.getParameter("a_note");
			
			Archive archive = new Archive(a_id, e_id, a_num, a_name, a_sum, a_note);
			
			int flag = manager.submitArchive(archive);
			
			request.setAttribute("success", "success");
			request.getRequestDispatcher("/WEB-INF/doc/success.jsp").forward(request, response);
		}else if(item.equals("view") || item.equals("edit")){
			
			int pagenum = 1;
			int pagesize = 1;
			
			if(request.getParameter("pagenum")!=null) {
				pagenum = Integer.parseInt(request.getParameter("pagenum"));
			}
			if(request.getParameter("pagesize")!=null) {
				pagesize = Integer.parseInt(request.getParameter("pagesize"));
			}
			
			int start = pagesize * pagenum - pagesize;
			int end = pagesize * pagenum;
			ArchiveDAO archiveDAO = new ArchiveDAO();
			List<Archive> archives = archiveDAO.pageQueryArchive(start, end);
			
			int recordcount = archiveDAO.getRecordCount();//调用dao返回总记录数
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
			
			if(item.equals("edit")){
				request.setAttribute("edit", "edit");
			}else if(item.equals("view")){
				request.setAttribute("edit", "view");
			}
				
			
			
			request.getSession().setAttribute("archives", archives);
			request.getSession().setAttribute("page", page);
			request.getRequestDispatcher("/WEB-INF/doc/archiveView.jsp").forward(request, response);
		}else if(item.equals("edit2")){
			String a_id = request.getParameter("a_id");
			String e_id = request.getParameter("e_id");
			String a_num = request.getParameter("a_num");
			String a_name = request.getParameter("a_name");
			String a_sum = request.getParameter("a_sum");
			String a_note = request.getParameter("a_note");
			
			Archive archive = new Archive(a_id, e_id, a_num, a_name, a_sum, a_note);
			request.setAttribute("archive", archive);
			
			request.getRequestDispatcher("/WEB-INF/doc/updateArchive.jsp").forward(request, response);
		}else if(item.equals("delete")){
			
		}else if(item.equals("update")){
			String a_id = request.getParameter("a_id");
			String e_id = request.getParameter("e_id");
			String a_num = request.getParameter("a_num");
			String a_name = request.getParameter("a_name");
			String a_sum = request.getParameter("a_sum");
			String a_note = request.getParameter("a_note");
			
			
			Archive archive = new Archive(a_id, e_id, a_num, a_name, a_sum, a_note);
			int flag =manager.updateArchive(archive);
			if(flag ==0){
				request.setAttribute("success", "success");
				request.getRequestDispatcher("/WEB-INF/doc/success.jsp").forward(request, response);
			}
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
