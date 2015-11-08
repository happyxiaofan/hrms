package com.hrms.sys.manager;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.hrms.sys.dao.DBAccess;
import com.hrms.sys.dao.DBUtils;
import com.hrms.sys.entity.Module;
import com.hrms.sys.entity.Role;

public class ModuleManager {

private DBAccess db;
	
	private Connection conn = null;
	
	private PreparedStatement stmt = null;
	
	private String sql = null;
	
	public ModuleManager() {
		db = new DBAccess();
		db.createCon();
		conn = db.getConn();
		try {
			conn.setAutoCommit(false);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public void addModule(Module module) {
		try {
			sql = "insert into t_module values('" + module.getM_id() + "','"
					+ module.getM_name() + "')";
			stmt = conn.prepareStatement(sql);
			stmt.executeUpdate();
			conn.commit();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public List<Module> queryAllModules() {
		ResultSet rs = null;
		List<Module> modules = new ArrayList<Module>();
		try {
			sql = "select * from t_module";
			stmt = conn.prepareStatement(sql);
			rs = stmt.executeQuery();
			while(rs.next()){
				Module m = new Module();
				m.setM_id(rs.getString("module_id"));
				m.setM_name(rs.getString("module_name"));
				
				modules.add(m);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			DBUtils.release(rs, stmt, null);
		}
		
		return modules;
	}
	
	public void updateModuleInfo(Module module) {
		try {
			sql = "update t_module set module_name='" + module.getM_name()
					+ "' where module_id = '" + module.getM_id() + "'";
			stmt = conn.prepareStatement(sql);
			stmt.executeUpdate();
			
			conn.commit();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			DBUtils.release(null, stmt, conn);
		}
		
	}

	public void deleteModuleById(String m_id) {
		try {
			sql = "delete from t_module " +"where module_id = '" + m_id + "'";
			stmt = conn.prepareStatement(sql);
			stmt.executeUpdate();
			
			conn.commit();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			DBUtils.release(null, stmt, null);
		}
	}
	
		public void updateModuleById(String m_id, String role_id) {
			try {
				conn.setAutoCommit(false);
				stmt = conn.prepareStatement("update t_module set role_id='"
						+ role_id + "' where module_id='" + m_id + "'");
				stmt.executeUpdate();
				conn.commit();
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				DBUtils.release(null, stmt, null);
			}
		}
		
		public String queryRoleName(String module_role_id) {
			String role_name = null;
			ResultSet rs = null;
			try {
				sql = "select role_name from t_role where role_id='" + module_role_id + "'";
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
