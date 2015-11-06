package com.hrms.sys.manager;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.hrms.sys.dao.DBAccess;
import com.hrms.sys.dao.DBUtils;
import com.hrms.sys.entity.Employee;

public class RoleEmpManager {

	private DBAccess db;
	
	private Connection conn = null;
	
	private PreparedStatement stmt = null;
	
	private String sql = null;
	
	public RoleEmpManager() {
		db = new DBAccess();
		db.createCon();
		conn = db.getConn();
		try {
			conn.setAutoCommit(false);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	//为雇员分配角色信息
		public void disRoleForEmployee(Employee emp) {
			try {
				conn.setAutoCommit(false);
				sql = "update t_user set role_id='" + emp.getRole_id()
						+ "' where e_id='" + emp.getE_id() + "'";
				System.out.println("role_id:" + emp.getRole_id()+"\n e_id:" + emp.getE_id());
				stmt = conn.prepareStatement(sql);
				stmt.executeUpdate();

				conn.commit();
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				DBUtils.release(null, stmt, null);
			}
		}

	//根据role_id查询角色名称
	public String queryRoleName(String emp_role_id2) {
		String role_name = null;
		ResultSet rs = null;
		try {
			sql = "select role_name from t_role where role_id='" + emp_role_id2 + "'";
			stmt = conn.prepareStatement(sql);
			
			rs = stmt.executeQuery();
			if(rs.next()){
				role_name = rs.getString("role_name");
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			DBUtils.release(rs, stmt, null);
		}
		return role_name;
	}
	
	
}
