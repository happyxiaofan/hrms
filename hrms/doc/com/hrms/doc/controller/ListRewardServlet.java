package com.hrms.doc.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hrms.doc.entity.Reward;
import com.hrms.doc.manager.RewardManager;



public class ListRewardServlet extends HttpServlet {
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doPost(request,response);
	}

	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String item = request.getParameter("item");
		RewardManager manager = new RewardManager();
		if(item.equals("add")){
			request.getRequestDispatcher("/WEB-INF/doc/addReward.jsp").forward(request, response);
		}else if(item.equals("edit")){
			RewardManager reward = new RewardManager();
			List<Reward> rs = reward.queryAllReward();
			request.setAttribute("res", rs);
			request.getRequestDispatcher("/WEB-INF/doc/editReward.jsp").forward(request, response);
		}else if(item.equals("view")){
			List<Reward> rs = manager.queryAllReward();
			request.setAttribute("res", rs);
			request.getRequestDispatcher("/WEB-INF/doc/listReward.jsp").forward(request, response);
		}else if(item.equals("addReward")){
			String rewid = request.getParameter("rewid");
			String rewname = request.getParameter("rewname");
			String rewtype = request.getParameter("rewtype");
		    String rewdate = request.getParameter("rewdate");
			String rewtitle = request.getParameter("rewtitle");
			String rewcontent = request.getParameter("rewcontent");
			String rewlevel = request.getParameter("rewlevel");
			
			Reward rew = new Reward();
			rew.setRewid(rewid);
			rew.setRewname(rewname);
			rew.setRewtype(rewtype);
			rew.setRewdate(rewdate);
			rew.setRewtitle(rewtitle);
			rew.setRewcontent(rewcontent);
			rew.setRewlevel(rewlevel);
			
			manager.addReward(rew);
			List<Reward> rs = manager.queryAllReward();
			request.setAttribute("res", rs);
			request.getRequestDispatcher("/WEB-INF/doc/listReward.jsp").forward(request, response);
		}else if(item.equals("delete")){
			String id = request.getParameter("id");
			RewardManager rewardmanager = new RewardManager();
			rewardmanager.deleteRewardById(id);
			List<Reward> rs = rewardmanager.queryAllReward();
			request.setAttribute("res", rs);
			request.getRequestDispatcher("/WEB-INF/doc/listReward.jsp").forward(request, response);
			
		}else if(item.equals("updateReward")){
			String rewid = request.getParameter("rewid");
			String rewname = request.getParameter("rewname");
			String rewtype = request.getParameter("rewtype");
		    String rewdate = request.getParameter("rewdate");
			String rewtitle = request.getParameter("rewtitle");
			String rewcontent = request.getParameter("rewcontent");
			String rewlevel = request.getParameter("rewlevel");
			
			Reward rew = new Reward();
			rew.setRewid(rewid);
			rew.setRewname(rewname);
			rew.setRewtype(rewtype);
			rew.setRewdate(rewdate);
			rew.setRewtitle(rewtitle);
			rew.setRewcontent(rewcontent);
			rew.setRewlevel(rewlevel);
			
			manager.updateReward(rew);
			
			List<Reward> rews = manager.queryAllReward();
			request.setAttribute("res", rews);
			request.getRequestDispatcher("/WEB-INF/doc/listReward.jsp").forward(request, response);
		}else if(item.equals("update")){
			String rewid = request.getParameter("rewid");
			Reward rew = manager.queryRewardById(rewid);
			request.setAttribute("rew", rew);
			request.getRequestDispatcher("/WEB-INF/doc/updateReward.jsp").forward(request, response);
		}else if(item.equals("export")){
			String exportToExcel = request.getParameter("exportToExcel");
			request.setAttribute("exportToExcel", exportToExcel);
			request.getRequestDispatcher("/WEB-INF/doc/listReward.jsp").forward(request, response);
		}
		
	}

}
