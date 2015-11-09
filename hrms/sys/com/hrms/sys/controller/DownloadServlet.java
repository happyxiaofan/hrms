package com.hrms.sys.controller;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hrms.doc.manager.ArchiveManager;
import com.hrms.sys.entity.PicPath;

public class DownloadServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public DownloadServlet() {
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
		ArchiveManager archiveManager = new ArchiveManager();
		if(item.equals("down")){
			List<PicPath> pic_paths = archiveManager.queryPaths();
			request.setAttribute("paths", pic_paths);
			//request.getRequestDispatcher("/WEB-INF/doc/success.jsp").forward(request, response);
			request.getRequestDispatcher("/WEB-INF/sys/download.jsp").forward(request, response);
		}else if(item.equals("download")){
			request.setCharacterEncoding("utf-8");
			String filename = request.getParameter("filename");
			String filepath = request.getParameter("filepath");
			response.setContentType("application/x-msdownload");
			response.setHeader("Content-disposition", "attachment;filename="+ new String(filename.getBytes("utf-8"), "ISO-8859-1"));
			FileInputStream fis = new FileInputStream(filepath);
			byte[] data = new byte[fis.available()];
			fis.read(data);
			fis.close();
			OutputStream os = response.getOutputStream();
			os.write(data);
			os.close();
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
