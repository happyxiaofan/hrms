package com.hrms.edu.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hrms.edu.manager.ScoreManager;
import com.hrms.edu.entity.Score;
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
		ScoreManager scoreManager=new ScoreManager();
		EduTrainManager edManager=new EduTrainManager();
		if(item.equals("add")){
			request.getRequestDispatcher("/WEB-INF/edu/addTrain.jsp").forward(request, response);
		}else if(item.equals("edit")){
			List<EduTrain> tres = edManager.queryAllEduTrains();
			//添加到Session
			request.setAttribute("tres", tres);
			request.getRequestDispatcher("/WEB-INF/edu/alterTrain.jsp").forward(request, response);
		}else if(item.equals("update")){
			String sId=request.getParameter("sId");
			String sName=request.getParameter("sName");
			String sClass=request.getParameter("sClass");
			int sScore=Integer.parseInt(request.getParameter("sScore"));
			
			Score score=new Score();
			score.setsId(sId);
			score.setsName(sName);
			score.setsClass(sClass);
			score.setsScore(sScore);
			
			request.setAttribute("score", score);
			request.getRequestDispatcher("/WEB-INF/edu/updateScore.jsp").forward(request, response);
		}else if(item.equals("view")){
			List<EduTrain> tres = edManager.queryAllEduTrains();
			//添加到Session
			request.setAttribute("tres", tres);
			request.getRequestDispatcher("/WEB-INF/edu/queryTrain.jsp").forward(request, response);
		}else if(item.equals("delete")){
			int treId = Integer.parseInt(request.getParameter("treId"));
			System.out.println(treId);
			
			EduTrainManager eManager=new EduTrainManager();
			eManager.deleteTreByTreId(treId);
			
			List<EduTrain> tres = eManager.queryAllEduTrains();
			if(tres!=null && tres.size() > 0){
				request.setAttribute("tres", tres);
				request.getRequestDispatcher("/WEB-INF/edu/alterTrain.jsp").forward(request, response);
			}
		}else if(item.equals("updateScore")){
			
			String sId=request.getParameter("sId");
			String sName=request.getParameter("sName");
			String sClass=request.getParameter("sClass");
			int sScore=Integer.parseInt(request.getParameter("sScore"));
			
			Score score=new Score();
			score.setsId(sId);
			score.setsName(sName);
			score.setsClass(sClass);
			score.setsScore(sScore);
			
			request.setAttribute("score", score);
			scoreManager.updateScore(score);
			List<Score> scores=scoreManager.queryAllScores();
			request.setAttribute("scores", scores);
			request.getRequestDispatcher("/WEB-INF/edu/alterScore.jsp").forward(request, response);
		}else if(item.equals("updateTrain")){
			String treId=request.getParameter("treId");
			String treName=request.getParameter("treName");
			String treNum=request.getParameter("treNum");
			
			EduTrain eduTrain=new EduTrain();
			eduTrain.setTreId(treId);
			eduTrain.setTreName(treName);
			eduTrain.setTreNumber(treNum);
			
			//添加到Session
			request.setAttribute("tre", eduTrain);
			request.getRequestDispatcher("/WEB-INF/edu/updateTrain.jsp").forward(request,response);
		}else if(item.equals("updateTrain2")){
			String treId=request.getParameter("treId");
			String treName=request.getParameter("treName");
			String treNum=request.getParameter("treNum");
			
			EduTrain eduTrain=new EduTrain();
			eduTrain.setTreId(treId);
			eduTrain.setTreName(treName);
			eduTrain.setTreNumber(treNum);
			//添加到Session
			request.setAttribute("tre", eduTrain);
			edManager.updateTre(eduTrain);
			List<EduTrain> tres = edManager.queryAllEduTrains();
			request.setAttribute("tres", tres);
			request.getRequestDispatcher("/WEB-INF/edu/alterTrain.jsp").forward(request,response);
		}
	}
}
