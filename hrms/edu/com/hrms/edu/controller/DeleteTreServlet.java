package com.hrms.edu.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hrms.edu.entity.EduTrain;
import com.hrms.edu.manager.EduTrainManager;

public class DeleteTreServlet extends HttpServlet {
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int treId = Integer.parseInt(request.getParameter("treId"));
		System.out.println(treId);
		
		EduTrainManager eManager=new EduTrainManager();
		eManager.deleteTreByTreId(treId);
		
		List<EduTrain> tres = eManager.queryAllEduTrains();
		if(tres!=null && tres.size() > 0){
			request.setAttribute("tres", tres);
			request.getRequestDispatcher("/WEN-INF/edu/alterTrain.jsp").forward(request, response);
		}
	}
}
