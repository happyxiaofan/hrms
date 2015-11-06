package com.hrms.sys.manager;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.hrms.sys.dao.DBAccess;
import com.hrms.sys.dao.DBUtils;
import com.hrms.sys.entity.Role;

public class RoleManager {

	private DBAccess db;
	
	private Connection conn = null;
	
	private PreparedStatement stmt = null;
	
	private String sql = null;
	
	public RoleManager() {
		db = new DBAccess();
		db.createCon();
		conn = db.getConn();
		try {
			conn.setAutoCommit(false);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	//查询所有角色
	public List<Role> queryAllRoles(){
		ResultSet rs = null;
		List<Role> roles = new ArrayList<Role>();
		try {
			sql = "select * from t_role";
			stmt = conn.prepareStatement(sql);
			rs = stmt.executeQuery();
			while(rs.next()){
				Role role = new Role();
				role.setRole_id(rs.getString("role_id"));
				role.setRole_name(rs.getString("role_name"));
				
				roles.add(role);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			DBUtils.release(rs, stmt, conn);
		}
		
		return roles;
	}

	//添加角色
	public void addRole(Role role) {
		try {
			sql = "insert into t_role values('" + role.getRole_id() + "','"
					+ role.getRole_name() + "')";
			stmt = conn.prepareStatement(sql);
			stmt.executeUpdate();
			conn.commit();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	//根据id删除角色
	public void deleteRoleById(String role_id) {
		try {
			sql = "delete from t_role where role_id='" + role_id + "'";
			stmt = conn.prepareStatement(sql);
			stmt.executeUpdate();
			conn.commit();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	//更新角色信息
	public void updateRoleInfo(Role role) {
		try {
			sql = "update t_role set role_name='" + role.getRole_name()
					+ "' where role_id = '" + role.getRole_id() + "'";
			stmt = conn.prepareStatement(sql);
			stmt.executeUpdate();
			
			conn.commit();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}

	public Role queryRoleById(String role_id) {
		Role role = null;
		ResultSet rs = null;
		try {
			sql = "select * from t_role where role_id = '" + role_id + "'";
			stmt = conn.prepareStatement(sql);
			rs = stmt.executeQuery();
			if(rs.next()){
				role = new Role();
				role.setRole_id(rs.getString("role_id"));
				role.setRole_name(rs.getString("role_name"));
				return role;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	
}
