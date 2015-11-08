package com.hrms.edu.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hrms.edu.entity.Score;
import com.hrms.edu.manager.ScoreManager;

public class DeleteScoreServlet extends HttpServlet {
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int sId=Integer.parseInt(request.getParameter("sId"));
		
		ScoreManager sManager=new ScoreManager();
		sManager.deleteScoreBysId(sId);
		
		List<Score> scores=sManager.queryAllScores();
		if(scores!=null&&scores.size()>0){
			request.setAttribute("scores", scores);
			request.getRequestDispatcher("/WEB-INF/edu/alterScore.jsp").forward(request, response);
		}
	}
}
