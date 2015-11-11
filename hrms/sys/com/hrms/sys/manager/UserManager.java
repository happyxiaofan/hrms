package com.hrms.sys.manager;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.hrms.doc.entity.BaseInfoVo;
import com.hrms.sys.dao.DBAccess;
import com.hrms.sys.dao.DBUtils;
import com.hrms.sys.entity.Employee;
import com.hrms.sys.entity.EmployeeVo;

public class UserManager {

	private DBAccess db;

	private Connection conn = null;

	private PreparedStatement stmt = null;

	private String sql = null;

	public UserManager() {
		db = new DBAccess();
		db.createCon();
		conn = db.getConn();
	}

	/**
	 * 验证用户名
	 * 
	 * @Description: TODO
	 * @param emp
	 * @return
	 * @return boolean
	 * @throws
	 */
	public boolean isValid(Employee emp) {
		boolean flag = false;
		ResultSet rs = null;
		try {
			sql = "select * from t_user where e_name='" + emp.getEname()
					+ "' and passwd='" + emp.getPwd() + "'";
			stmt = conn.prepareStatement(sql);
			rs = stmt.executeQuery();
			if (rs.next()) {
				flag = true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return flag;
	}

	/**
	 * 添加新雇员
	 * 
	 * @param emp
	 */
	public void addEmp(Employee emp) {

		try {
			conn.setAutoCommit(false);
			stmt = conn
					.prepareStatement("insert into t_user(e_id,e_name,passwd) values('"
							+ emp.getE_id()
							+ "','"
							+ emp.getEname()
							+ "','"
							+ emp.getPwd() + "')");
			stmt.executeUpdate();
			conn.commit();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public List<Employee> queryAllEmps() {
		List<Employee> users = new ArrayList<Employee>();
		ResultSet rs = null;
		try {
			stmt = conn.prepareStatement("select * from t_user");
			rs = stmt.executeQuery();
			Employee user = null;
			while (rs.next()) {
				user = new Employee();
				user.setE_id(rs.getString("e_id"));
				user.setEname(rs.getString("e_name"));
				user.setPwd(rs.getString("passwd"));
				user.setRole_id(rs.getString("role_id"));

				users.add(user);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {

		}
		return users;
	}

	public void deleteUserByUserId(String e_id) {
		try {
			stmt = conn.prepareStatement("delete from t_user where e_id='"
					+ e_id + "'");
			stmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public Employee queryEmpById(String e_id) {
		ResultSet rs = null;
		Employee user = null;
		try {
			stmt = conn.prepareStatement("select * from t_user where e_id='"
					+ e_id + "'");
			rs = stmt.executeQuery();
			if (rs.next()) {
				user = new Employee();
				user.setE_id(rs.getString("e_id"));
				user.setEname(rs.getString("e_name"));
				user.setPwd(rs.getString("passwd"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return user;
	}

	public void updateEmp(Employee emp) {
		try {
			conn.setAutoCommit(false);
			stmt = conn.prepareStatement("update t_user set e_name='"
					+ emp.getEname() + "',passwd='" + emp.getPwd()
					+ "' where e_id='" + emp.getE_id() + "'");
			stmt.executeUpdate();
			conn.commit();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public List<EmployeeVo> queryAllEmpsVo() {
		List<EmployeeVo> users = new ArrayList<EmployeeVo>();
		ResultSet rs = null;
		try {
			stmt = conn.prepareStatement("select * from t_user");
			rs = stmt.executeQuery();
			EmployeeVo user = null;
			while (rs.next()) {
				user = new EmployeeVo();
				user.setE_id(rs.getString("e_id"));
				user.setEname(rs.getString("e_name"));
				user.setPwd(rs.getString("passwd"));
				user.setRole_id(rs.getString("role_id"));

				users.add(user);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBUtils.release(rs, stmt, null);
		}
		return users;
	}

	// 根据用户名查询雇员编号
	public String queryEmpByName(String uname) {
		ResultSet rs = null;
		String e_id = null;
		try {
			sql = "select e_id from t_user where e_name='" + uname + "'";
			stmt = conn.prepareStatement(sql);
			rs = stmt.executeQuery();
			if (rs.next()) {
				e_id = rs.getString("e_id");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtils.release(rs, stmt, null);
		}
		return e_id;
	}

	// 根据雇员编号查询角色id
	public String queryEmpRoleIdByEId(String e_id) {
		ResultSet rs = null;
		String role_id = null;
		try {
			sql = "select role_id from t_user where e_id='" + e_id + "'";
			stmt = conn.prepareStatement(sql);
			rs = stmt.executeQuery();
			if (rs.next()) {
				role_id = rs.getString("role_id");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBUtils.release(rs, stmt, null);
		}
		return role_id;
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

	// 根据参数更新雇员信息
	public void update(String sql, List<Object> param) {
		try {
			stmt = conn.prepareStatement(sql);
			if (param != null && param.size() > 0) {
				for (int i = 0; i < param.size(); i++) {
					stmt.setObject(i + 1, param.get(i));
				}
			}
			stmt.executeUpdate();
			conn.commit();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBUtils.release(null, stmt, null);
		}
	}

	// 根据雇员id更新雇员的role_id
	public void updateEmpById(String e_id, String role_id) {
		try {
			conn.setAutoCommit(false);
			stmt = conn.prepareStatement("update t_user set role_id='"
					+ role_id + "' where e_id='" + e_id + "'");
			stmt.executeUpdate();
			conn.commit();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtils.release(null, stmt, null);
		}
	}

	public BaseInfoVo queryUserInfo(String uname) {
		BaseInfoVo baseInfoVo = null;
		ResultSet rs = null;
		try {
			sql = "select u.e_id,u.passwd,u.e_gender gender,u.e_department dept,u.e_job job,u.e_pro_title title,b.edu edu,b.degree degree,b.status status,b.pic_path path from t_user u,t_doc_baseinfo b where u.e_name=b.e_name and b.e_name='"
					+ uname + "'";
			stmt = conn.prepareStatement(sql);
			rs = stmt.executeQuery();
			if(rs.next()){
				baseInfoVo = new BaseInfoVo();
				baseInfoVo.setE_name(uname);
				baseInfoVo.setE_id(rs.getString("e_id"));
				baseInfoVo.setPasswd(rs.getString("passwd"));
				baseInfoVo.setDept(rs.getString("dept"));
				baseInfoVo.setGender(rs.getString("gender"));
				baseInfoVo.setJob(rs.getString("job"));
				baseInfoVo.setTitle(rs.getString("title"));
				baseInfoVo.setEdu(rs.getString("edu"));
				baseInfoVo.setDegree(rs.getString("degree"));
				baseInfoVo.setStatus(rs.getString("status"));
				baseInfoVo.setPic_path(rs.getString("path"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			DBUtils.release(rs, stmt, null);
		}
		return baseInfoVo;
	}

	public void updatePwdByName(String e_name,String pwd) {
		try {
			sql = "update t_user set passwd=? where e_name=?";
			stmt = conn.prepareStatement(sql);
			stmt.setObject(1, pwd);
			stmt.setObject(2, e_name);
			
			System.out.println(sql);
			stmt.executeUpdate();
			conn.commit();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			DBUtils.release(null, stmt, null);
		}
	}

}
