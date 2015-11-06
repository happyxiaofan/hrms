package com.hrms.sys.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.hrms.sys.entity.Employee;
import com.hrms.sys.manager.UserManager;

public class EmployeeDao {
	UserManager manager = new UserManager();
	ResultSet rs = null;
	String sql = null;
	
	
	public List<Employee> pageQueryPerson(int start, int end) {
		sql = "select * from (select p.*, rownum rn from (select * from t_user  order by e_id) p where rownum<=?) where rn>?";
		List<Object> param = new ArrayList<Object>();
		param.add(end);
		param.add(start);
		List<Employee> pList = new ArrayList<Employee>();
		try {
			rs = manager.query(sql, param);
			while(rs.next()) {
				Employee p = new Employee();
				p.setEname(rs.getString("e_name"));
				p.setE_id(rs.getString("e_id"));
				p.setRole_id(rs.getString("role_id"));
				pList.add(p);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBUtils.release(rs, null, null);
		}
		return pList;
	}
	
	public int getRecordCount() {
		sql  = "select count(*) c from t_user";
		int recordCount = 0;
		try {
			rs = manager.query(sql, null);
			while(rs.next()) {
				recordCount = rs.getInt("c");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtils.release(rs, null, null);
		}
		return recordCount;
	}
}
