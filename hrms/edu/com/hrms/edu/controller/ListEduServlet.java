package com.hrms.edu.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hrms.edu.entity.EduTrain;
import com.hrms.edu.manager.EduTrainManager;

public class ListEduServlet extends HttpServlet {
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
		if(item.equals("add")){
			request.getRequestDispatcher("/WEB-INF/edu/addTrain.jsp").forward(request, response);
		}else if(item.equals("edit")){
			EduTrainManager edManager=new EduTrainManager();
			List<EduTrain> tres = edManager.queryAllEduTrains();
			//添加到Session
			request.setAttribute("tres", tres);
			request.getRequestDispatcher("/WEB-INF/edu/alterTrain.jsp").forward(request, response);
		}else if(item.equals("update")){
			
		}
	}
}
