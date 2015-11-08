package com.hrms.edu.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hrms.edu.entity.EduTrain;
import com.hrms.edu.entity.Score;
import com.hrms.edu.manager.ScoreManager;

public class AddScore extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}
	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String sId=request.getParameter("sId");
		String sName=request.getParameter("sName");
		String sClass=request.getParameter("sClass");
		int sScore=Integer.parseInt(request.getParameter("sScore"));
		
		Score score=new Score();
		score.setsId(sId);
		score.setsName(sName);
		score.setsClass(sClass);
		score.setsScore(sScore);
		
		ScoreManager sManager=new ScoreManager();
		sManager.addScore(score);
		List<Score> scores = sManager.queryAllScores();
		//添加到Session
		request.setAttribute("scores", scores);
		request.getRequestDispatcher("/WEB-INF/edu/alterScore.jsp").forward(request,response);
	}
}
