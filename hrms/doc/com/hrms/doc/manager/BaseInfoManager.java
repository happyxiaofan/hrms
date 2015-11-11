package com.hrms.doc.manager;

import java.awt.image.DataBuffer;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.hrms.doc.entity.BaseInfo;
import com.hrms.sys.dao.DBAccess;
import com.hrms.sys.dao.DBUtils;
import com.hrms.sys.entity.Employee;

public class BaseInfoManager {

	private DBAccess db;

	private Connection conn = null;

	private PreparedStatement stmt = null;

	private String sql = null;

	public BaseInfoManager() {
		db = new DBAccess();
		db.createCon();
		conn = db.getConn();
		try {
			conn.setAutoCommit(false);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	
	public int submitBaseInfo(BaseInfo info) {
		int flag= 0;
		try {
			sql = "insert into t_doc_baseinfo values(?,?,'','',?,?)";
			stmt = conn.prepareStatement(sql);
			stmt.setObject(1, info.getE_name());
			stmt.setObject(2, info.getGender());
			stmt.setObject(3, info.getStatus());
			stmt.setObject(4, info.getPic_path());
			
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


	public List<BaseInfo> querybaseInfo() {
		List<BaseInfo> infos = new ArrayList<BaseInfo>();
		ResultSet rs = null;
		try {
			stmt = conn.prepareStatement("select * from t_doc_baseinfo");
			rs = stmt.executeQuery();
			BaseInfo info = null;
			while (rs.next()) {
				info = new BaseInfo();
				info.setE_name(rs.getString("e_name"));
				info.setEducation(rs.getString("gender"));
				info.setStatus(rs.getString("status"));
				info.setPic_path(rs.getString("pic_path"));

				infos.add(info);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBUtils.release(rs, stmt, null);
		}
		return infos;
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


	public int deleteBaseInfoByEName(String e_name) {
		int flag = 0;
		try {
			sql = "delete from t_doc_baseinfo where e_name='"+e_name+"'";
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


	public int updateBaseInfo(BaseInfo info) {
		int flag = 0;
		try {
			sql = "update t_doc_baseinfo set gender=?,edu=?,degree=?,status=? where e_name=?";
			stmt = conn.prepareStatement(sql);
			stmt.setObject(1, info.getGender());
			stmt.setObject(2, info.getEducation());
			stmt.setObject(3, info.getDegree());
			stmt.setObject(4, info.getStatus());
			stmt.setObject(5, info.getE_name());
			
			flag = stmt.executeUpdate();
			
			conn.commit();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			DBUtils.release(null, stmt, null);
		}
		return flag;
	}


	public List<BaseInfo> querybaseInfoByKey(String key) {
		List<BaseInfo> infos = new ArrayList<BaseInfo>();
		ResultSet rs = null;
		try {
			stmt = conn.prepareStatement("select * from t_doc_baseinfo where e_name like '%" + key + "%'");
			rs = stmt.executeQuery();
			BaseInfo info = null;
			while (rs.next()) {
				info = new BaseInfo();
				info.setE_name(rs.getString("e_name"));
				info.setGender(rs.getString("gender"));
				info.setEducation(rs.getString("edu"));
				info.setDegree(rs.getString("degree"));
				info.setStatus(rs.getString("status"));

				infos.add(info);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBUtils.release(rs, stmt, null);
		}
		return infos;
	}


	public List<BaseInfo> searchInfoByKey(String str, String key) {
		List<BaseInfo> infos = new ArrayList<BaseInfo>();
		ResultSet rs = null;
		try {
			stmt = conn.prepareStatement("select e_name,gender,edu,degree,status from t_doc_baseinfo where "+str+" like '%" + key + "%'");
			rs = stmt.executeQuery();
			BaseInfo info = null;
			while (rs.next()) {
				info = new BaseInfo();
				info.setE_name(rs.getString("e_name"));
				info.setGender(rs.getString("gender"));
				info.setEducation(rs.getString("edu"));
				info.setDegree(rs.getString("degree"));
				info.setStatus(rs.getString("status"));

				infos.add(info);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBUtils.release(rs, stmt, null);
		}
		return infos;
	}
}
