package com.hrms.pa.utils;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.List;

public class DBUtils {
	
	public static void release(ResultSet rs, Statement stmt, Connection  conn){
		if(rs!=null){
			try {
				rs.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		if(stmt!=null){
			try {
				stmt.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		if(conn!=null){
			try {
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
	private  static Connection conn = null;
	private  static PreparedStatement  stmt = null;
	private  static       ResultSet rs = null;
	public  static ResultSet query(String sql, List<Object> param) throws SQLException{
		stmt = conn.prepareStatement(sql);
		if(param!=null && param.size()>0) {
			for(int i=0;i<param.size();i++) {
				stmt.setObject(i + 1, param.get(i));
			}
		}
		rs =stmt.executeQuery();
		return rs;
	}
	
}

