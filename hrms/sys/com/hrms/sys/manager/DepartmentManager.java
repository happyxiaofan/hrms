package com.hrms.sys.manager;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.hrms.sys.dao.DBAccess;
import com.hrms.sys.entity.Department;

public class DepartmentManager {

	private DBAccess db;
	
	private Connection conn = null;
	
	private PreparedStatement stmt = null;
	
	private String sql = null;
	
	public DepartmentManager() {
		db = new DBAccess();
		db.createCon();
		conn = db.getConn();
	}
	
	public void addDept(Department department){
		try {
			conn.setAutoCommit(false);
			sql = "insert into t_dept values('" + department.getDept_id() + "','"
					+ department.getDept_name() + "'," + department.getDept_num()
					+ "," + department.getStatus() + ")";
			stmt = conn.prepareStatement(sql);
			stmt.executeUpdate();
			conn.commit();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public List<Department> queryAllDepts() {
		List<Department> depts = new ArrayList<Department>();
		ResultSet rs = null;
		try {
			conn.setAutoCommit(false);
			sql = "select * from t_dept";
			stmt = conn.prepareStatement(sql);
			rs = stmt.executeQuery();
			while(rs.next()){
				Department dept = new Department();
				dept.setDept_id(rs.getString("dept_id"));
				dept.setDept_name(rs.getString("dept_name"));
				dept.setDept_num(rs.getInt("dept_num"));
				dept.setStatus(rs.getInt("status"));
				
				depts.add(dept);
			}
			conn.commit();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return depts;
	}

	public void deleteDeptById(String dept_id) {
		try {
			conn.setAutoCommit(false);
			sql = "delete from t_dept where dept_id='" + dept_id +"'";
			stmt = conn.prepareStatement(sql);
			stmt.executeUpdate();
			conn.commit();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public void updateDeptInfo(Department department) {
		try {
			conn.setAutoCommit(false);
			sql = "update t_dept set dept_name='" + department.getDept_name()
					+ "',dept_num=" + department.getDept_num() + ",status="
					+ department.getStatus() + " where dept_id='"
					+ department.getDept_id() + "'";
			stmt = conn.prepareStatement(sql);
			stmt.executeUpdate();
			conn.commit();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
