package com.hrms.edu.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hrms.edu.entity.EduTrain;
import com.hrms.edu.manager.EduTrainManager;
import com.hrms.sys.manager.UserManager;

public class AddTrainServlet extends HttpServlet {
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}
	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String treId=request.getParameter("treId");
		String treName=request.getParameter("treName");
		String treNum=request.getParameter("treNum");
		
		EduTrain eduTrain=new EduTrain();
		eduTrain.setTreId(treId);
		eduTrain.setTreName(treName);
		eduTrain.setTreNumber(treNum);
		
		EduTrainManager edManager=new EduTrainManager();
		edManager.addTrain(eduTrain);
		List<EduTrain> tres = edManager.queryAllEduTrains();
		
		//添加到Session
		request.setAttribute("tres", tres);
		request.getRequestDispatcher("/WEB-INF/edu/alterTrain.jsp").forward(request,response);
	}
}
