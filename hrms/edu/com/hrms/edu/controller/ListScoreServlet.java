package com.hrms.edu.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hrms.edu.entity.Score;
import com.hrms.edu.manager.ScoreManager;

public class ListScoreServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String item = request.getParameter("item");
		if(item.equals("add")){
			request.getRequestDispatcher("/WEB-INF/edu/addScore.jsp").forward(request, response);
		}else if(item.equals("edit")){
			ScoreManager sManager=new ScoreManager();
			List<Score> scores = sManager.queryAllScores();
			//添加到Session
			request.setAttribute("scores", scores);
			request.getRequestDispatcher("/WEB-INF/edu/alterScore.jsp").forward(request, response);
		}
	}
}
