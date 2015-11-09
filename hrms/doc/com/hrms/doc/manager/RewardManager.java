package com.hrms.doc.manager;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.hrms.doc.entity.Reward;
import com.hrms.sys.dao.DBAccess;
import com.hrms.sys.dao.DBUtils;
import com.hrms.sys.entity.Department;


public class RewardManager {
	private DBAccess dba;
	private Connection conn = null;
	private PreparedStatement stmt = null;
	private String sql = null;
	
	public RewardManager(){
		dba = new DBAccess();
		dba.createCon();
		conn = dba.getConn();
	}
	
	public List<Reward> queryAllReward(){
		List<Reward> res = new ArrayList<Reward>();
		ResultSet rs = null;
		try {
			 sql = "select * from t_doc_reward";
			 stmt = conn.prepareStatement(sql);
			 rs = stmt.executeQuery();
			 while(rs.next()){
				Reward reward1 = new Reward();
			    reward1.setRewid(rs.getString("rewid"));
				reward1.setRewname(rs.getString("rewname"));
				reward1.setRewtype(rs.getString("rewtype"));
				reward1.setRewdate(rs.getString("rewdate"));
				reward1.setRewtitle(rs.getString("rewtitle"));
				reward1.setRewcontent(rs.getString("rewcontent"));
				reward1.setRewlevel(rs.getString("rewlevel"));
				res.add(reward1);
			 }
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			DBUtils.release(rs, stmt, null);
		}
		return res;
	}
	
	//删除用户根据 id
	public void deleteRewardById(String rewid){
		System.out.println(rewid);
		try {
			
			//conn.setAutoCommit(false);
			sql="delete from t_doc_reward where rewid='"+rewid+"'";
			
			stmt=conn.prepareStatement(sql);
			stmt.executeUpdate();
			//conn.commit();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			DBUtils.release(null,stmt, null);
		}
	}
	
	//更新用户
	public void updateReward(Reward reward) {
		try {
			conn.setAutoCommit(false);
			sql = "update t_doc_reward set rewname='"+reward.getRewname()
					+"',rewtype='"+reward.getRewtype()+"',rewdate='"+reward.getRewdate()
					+"',rewtitle='"+reward.getRewtitle()+"', REWCONTENT='"+reward.getRewcontent()
					+"', REWLEVEL='"+reward.getRewlevel()+"' where rewid = '"+reward.getRewid()+"'";
			stmt = conn.prepareStatement(sql);
			System.out.println(sql);
			stmt.executeUpdate();
			conn.commit();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	//添加用户
	public void addReward(Reward reward){
		try {
			conn.setAutoCommit(false);
			sql = "insert into t_doc_reward values(" + reward.getRewid() + ",'"
					+ reward.getRewtype() + "','" + reward.getRewdate() + "','"
					+ reward.getRewtitle() + "','" + reward.getRewcontent()
					+ "','" + reward.getRewlevel() + "','"
					+ reward.getRewname() + "')";
			stmt = conn.prepareStatement(sql);
			stmt.executeUpdate();
			conn.commit();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public Reward queryRewardById(String rewid) {
		Reward reward1 = null;
		ResultSet rs = null;
		try {
			 sql = "select * from t_doc_reward where rewid='" + rewid+"'";
			 stmt = conn.prepareStatement(sql);
			 rs = stmt.executeQuery();
			 if(rs.next()){
				reward1 = new Reward();
			    reward1.setRewid(rs.getString("rewid"));
				reward1.setRewname(rs.getString("rewname"));
				reward1.setRewtype(rs.getString("rewtype"));
				reward1.setRewdate(rs.getString("rewdate"));
				reward1.setRewtitle(rs.getString("rewtitle"));
				reward1.setRewcontent(rs.getString("rewcontent"));
				reward1.setRewlevel(rs.getString("rewlevel"));
			 }
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			DBUtils.release(rs, stmt, null);
		}
		return reward1;
	}
	
}
