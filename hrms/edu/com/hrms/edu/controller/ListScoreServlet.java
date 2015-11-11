package com.hrms.edu.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hrms.doc.dao.BaseInfoDAO;
import com.hrms.doc.entity.BaseInfo;
import com.hrms.edu.dao.ScoreDAO;
import com.hrms.edu.entity.Score;
import com.hrms.edu.manager.ScoreManager;
import com.hrms.sys.entity.Page;

public class ListScoreServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String item = request.getParameter("item");
		ScoreManager sManager=new ScoreManager();
		if(item.equals("add")){
			request.getRequestDispatcher("/WEB-INF/edu/addScore.jsp").forward(request, response);
		}else if(item.equals("edit")){
			
			int pagenum = 1;
			int pagesize = 5;
			
			if(request.getParameter("pagenum")!=null) {
				pagenum = Integer.parseInt(request.getParameter("pagenum"));
			}
			if(request.getParameter("pagesize")!=null) {
				pagesize = Integer.parseInt(request.getParameter("pagesize"));
			}
			
			int start = pagesize * pagenum - pagesize;
			int end = pagesize * pagenum;
			ScoreDAO scoreDAO = new ScoreDAO();
			List<Score> ss = scoreDAO.pageQueryScore(start, end);
			
			int recordcount = scoreDAO.getRecordCount();//调用dao返回总记录数
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
			
			request.setAttribute("scores", ss);
			request.setAttribute("page", page);
			//添加到Session
			request.getRequestDispatcher("/WEB-INF/edu/alterScore.jsp").forward(request, response);
		}else if(item.equals("update")){
			
		}else if(item.equals("view")){
			List<Score> scores = sManager.queryAllScores();
			//添加到Session
			request.setAttribute("scores", scores);
			request.getRequestDispatcher("/WEB-INF/edu/queryScore.jsp").forward(request, response);
		}
	}
}
