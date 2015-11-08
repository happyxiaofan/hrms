package com.hrms.edu.manager;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.hrms.edu.entity.EduTrain;
import com.hrms.sys.dao.DBAccess;
import com.hrms.sys.entity.Employee;

public class EduTrainManager {
	private DBAccess db;
	
	private Connection conn = null;
	
	private PreparedStatement stmt = null;
	
	private String sql = null;
	
	public EduTrainManager() {
		db = new DBAccess();
		db.createCon();
		conn = db.getConn();
	}
	
	//添加培训内容
	public void addTrain(EduTrain eduTrain) {
		try {
			conn.setAutoCommit(false);
			stmt = conn
					.prepareStatement("insert into t_edu_train(tre_id,tre_name,tre_num) values('"
							+ eduTrain.getTreId()
							+ "','"
							+ eduTrain.getTreName()
							+ "','" 
							+ eduTrain.getTreNumber() + "')");
			stmt.executeUpdate();
			conn.commit();
		} catch (SQLException e) {
			e.printStackTrace();
		} 
	}
	//判断是否存在
	public boolean isValid(EduTrain eduTre) {
		boolean flag = false;
		ResultSet rs = null;
		try {
			sql = "select * from t_edu_train where tre_name='"
					+ eduTre.getTreName() + "' and tre_num='" + eduTre.getTreNumber() + "'";
			stmt = conn.prepareStatement(sql);
			rs = stmt.executeQuery();
			if (rs.next()) {
				flag = true;
			}
			conn.commit();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return flag;
	}
	
	//查询培训记录
	public List<EduTrain> queryAllEduTrains(){
		List<EduTrain> tres = new ArrayList<EduTrain>();
		ResultSet rs = null;
		try {
			 stmt = conn.prepareStatement("select * from t_edu_train");
			 rs = stmt.executeQuery();
			 EduTrain edutre = null;
			 while(rs.next()){
				 edutre = new EduTrain();
				 edutre.setTreId(rs.getString("tre_id"));
				 edutre.setTreName(rs.getString("tre_name"));
				 edutre.setTreNumber(rs.getString("tre_num"));
				 tres.add(edutre);
			 }
			 conn.commit();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return tres;
	}
	
	//删除培训记录
	public void deleteTreByTreId(int treId){
		try {
			stmt = conn.prepareStatement("delete from t_edu_train where tre_id='"+treId+"'");
			stmt.executeUpdate();
			conn.commit();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
