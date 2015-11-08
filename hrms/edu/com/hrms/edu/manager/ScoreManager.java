package com.hrms.edu.manager;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.hrms.edu.entity.EduTrain;
import com.hrms.edu.entity.Score;
import com.hrms.sys.dao.DBAccess;

public class ScoreManager {
	private DBAccess db;
	
	private Connection conn = null;
	
	private PreparedStatement stmt = null;
	
	private String sql = null;
	
	public ScoreManager() {
		db = new DBAccess();
		db.createCon();
		conn = db.getConn();
	}
	
	public void addScore(Score score) {
		try {
			conn.setAutoCommit(false);
			stmt = conn
					.prepareStatement("insert into t_edu_score(s_id,s_name,s_class,s_score) values('"
							+ score.getsId()+ "','"
							+ score.getsName()+ "','" 
							+ score.getsClass()+ "','" 
							+ score.getsScore() + "')");
			stmt.executeUpdate();
			conn.commit();
		} catch (SQLException e) {
			e.printStackTrace();
		} 
	}
	
	public boolean isValid(Score score) {
		boolean flag = false;
		ResultSet rs = null;
		try {
			sql = "select * from t_edu_score where s_id='"
					+ score.getsId() + "' and s_name='" + score.getsName() + "'";
			stmt = conn.prepareStatement(sql);
			rs = stmt.executeQuery();
			conn.commit();
			if (rs.next()) {
				flag = true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return flag;
	}
	
	public List<Score> queryAllScores(){
		List<Score> scores = new ArrayList<Score>();
		ResultSet rs = null;
		try {
			 stmt = conn.prepareStatement("select * from t_edu_score");
			 rs = stmt.executeQuery();
			 Score score= null;
			 while(rs.next()){
				 score = new Score();
				 score.setsId(rs.getString("s_id"));
				 score.setsName(rs.getString("s_name"));
				 score.setsClass(rs.getString("s_class"));
				 score.setsScore(rs.getInt("s_score"));
				 scores.add(score);
			 }
			 conn.commit();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return scores;
	}
	
	public void deleteScoreBysId(int sId){
		try {
			stmt = conn.prepareStatement("delete from t_edu_score where s_id='"+sId+"'");
			stmt.executeUpdate();
			conn.commit();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
