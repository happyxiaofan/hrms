package com.hrms.doc.manager;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import com.hrms.doc.entity.Archive;
import com.hrms.doc.entity.BaseInfo;
import com.hrms.sys.dao.DBAccess;
import com.hrms.sys.dao.DBUtils;

public class ArchiveManager {

	private DBAccess db;

	private Connection conn = null;

	private PreparedStatement stmt = null;

	private String sql = null;

	public ArchiveManager() {
		db = new DBAccess();
		db.createCon();
		conn = db.getConn();
		try {
			conn.setAutoCommit(false);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public int submitArchive(Archive archive) {
		int flag= 0;
		try {
			sql = "insert into t_doc_archive values(?,?,?,?,?,?)";
			stmt = conn.prepareStatement(sql);
			stmt.setObject(1, archive.getA_id());
			stmt.setObject(2, archive.getE_id());
			stmt.setObject(3, archive.getA_num());
			stmt.setObject(4, archive.getA_name());
			stmt.setObject(5, archive.getA_sum());
			stmt.setObject(6, archive.getA_note());
			flag = stmt.executeUpdate();
			
			conn.commit();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			DBUtils.release(null, stmt, null);
		}
		return flag;
	}
	
	public ResultSet query(String sql, List<Object> param) throws SQLException {
		ResultSet rs = null;
		stmt = conn.prepareStatement(sql);
		if (param != null && param.size() > 0) {
			for (int i = 0; i < param.size(); i++) {
				stmt.setObject(i + 1, param.get(i));
			}
		}
		rs = stmt.executeQuery();
		return rs;
	}
	
	public int deleteArchiveById(String a_id) {
		int flag = 0;
		try {
			sql = "delete from t_doc_archive where a_id='"+a_id+"'";
			stmt = conn.prepareStatement(sql);
			flag = stmt.executeUpdate();
			conn.commit();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			DBUtils.release(null, stmt, null);
		}
		return flag;
	}


	public int updateArchive(Archive archive) {
		int flag = 0;
		try {
			sql = "update t_doc_archive set e_id=?,a_num=?,a_name=?,a_sum=?,a_note=? where a_id=?";
			stmt = conn.prepareStatement(sql);
			stmt.setObject(1, archive.getE_id());
			stmt.setObject(2, archive.getA_num());
			stmt.setObject(3, archive.getA_name());
			stmt.setObject(4, archive.getA_sum());
			stmt.setObject(5, archive.getA_note());
			stmt.setObject(6, archive.getA_id());
			
			flag = stmt.executeUpdate();
			
			conn.commit();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			DBUtils.release(null, stmt, null);
		}
		return flag;
	}
}
