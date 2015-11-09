package com.hrms.pa.manager;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.hrms.pa.entity.Employee;
import com.hrms.pa.entity.EngageRecordEmp;
import com.hrms.pa.entity.NewEmployee;
import com.hrms.pa.entity.ResignEmployee;
import com.hrms.pa.entity.RetireEmployee;
import com.hrms.pa.entity.pChange;
import com.hrms.pa.utils.DBUtils;
import com.hrms.sys.dao.DBAccess;

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

	public List<NewEmployee> queryNewEmployees() {

		List<NewEmployee> newemps = new ArrayList<NewEmployee>();
		ResultSet rs = null;
		try {
			sql = "select * from t_empinfo";
			stmt = conn.prepareStatement(sql);
			rs = stmt.executeQuery();
			NewEmployee newemp = null;
			while (rs.next()) {
				newemp = new NewEmployee();
				newemp.setEmp_id(rs.getString("emp_id"));
				newemp.setEmp_name(rs.getString("emp_name"));
				newemp.setEmp_gender(rs.getString("emp_gender"));
				newemp.setEmp_date(rs.getString("emp_date"));
				newemp.setEmp_education(rs.getString("emp_education"));
				newemp.setEmp_degree(rs.getNString("emp_degree"));
				newemp.setEmp_department(rs.getString("emp_department"));
				newemp.setEmp_job(rs.getString("emp_job"));
				newemp.setEmp_post(rs.getString("emp_post"));

				newemps.add(newemp);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return newemps;
	}

	public List<RetireEmployee> queryrRetireEmployees() {

		List<RetireEmployee> remps = new ArrayList<RetireEmployee>();
		ResultSet rs = null;

		try {
			sql = "select * from t_empretire";
			stmt = conn.prepareStatement(sql);
			rs = stmt.executeQuery();
			RetireEmployee remp = null;
			while (rs.next()) {
				remp = new RetireEmployee();
				remp.setRetireno(rs.getInt("retireno"));
				remp.setEmp_id(rs.getString("emp_id"));
				remp.setEmp_name(rs.getString("emp_name"));
				remp.setEmp_gender(rs.getString("emp_gender"));
				remp.setEmp_age(rs.getInt("emp_age"));
				remp.setRetire_reason(rs.getString("retire_reason"));
				remp.setRetire_class(rs.getString("retire_class"));
				remp.setRetire_date(rs.getString("retire_date"));
				remp.setIsretire(rs.getString("isretire"));

				remps.add(remp);

			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return remps;

	}

	public List<ResignEmployee> queryrResignEmployees() {

		List<ResignEmployee> resignEmps = new ArrayList<ResignEmployee>();
		ResultSet rs = null;

		try {
			sql = "select * from t_empresign";
			stmt = conn.prepareStatement(sql);
			rs = stmt.executeQuery();
			ResignEmployee resignEmp = null;

			while (rs.next()) {
				resignEmp = new ResignEmployee();
				resignEmp.setResignno(rs.getInt("resignno"));
				resignEmp.setEmp_id(rs.getString("emp_id"));
				resignEmp.setEmp_name(rs.getString("emp_name"));
				resignEmp.setResign_reason(rs.getString("resign_reason"));
				resignEmp.setResign_class(rs.getString("resign_class"));
				resignEmp.setResign_date(rs.getString("resign_date"));

				resignEmps.add(resignEmp);
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return resignEmps;

	}

	public List<EngageRecordEmp> queryEngageRecordEmps() {

		List<EngageRecordEmp> eremps = new ArrayList<EngageRecordEmp>();
		ResultSet rs = null;

		try {

			sql = "select * from t_engage_record";
			stmt = conn.prepareStatement(sql);
			rs = stmt.executeQuery();
			EngageRecordEmp eremp = null;
			while (rs.next()) {
				eremp = new EngageRecordEmp();
				eremp.setRecordno(rs.getInt("recordno"));
				eremp.setEmp_id(rs.getString("emp_id"));
				eremp.setEmp_name(rs.getString("emp_name"));
				eremp.setEmp_post(rs.getString("emp_post"));
				eremp.setEmp_date(rs.getString("emp_date"));
				eremps.add(eremp);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return eremps;
	}

	public void deleteByRecordno(String emp_id) {

		try {
			sql = "delete t_engage_record where emp_id = '" + emp_id + "'";
			stmt = conn.prepareStatement(sql);
			stmt.executeUpdate();
			conn.commit();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	public List<pChange> queryAllpChanges() {
		List<pChange> pcs = new ArrayList<pChange>();
		ResultSet rs = null;
		try {
			/* conn.setAutoCommit(false); */
			sql = "select * from t_pa_pchange";
			stmt = conn.prepareStatement(sql);
			rs = stmt.executeQuery();

			while (rs.next()) {
				pChange pc = new pChange();
				pc.setPchange_id(rs.getString("pchange_id"));
				pc.setPchange_name(rs.getString("pchange_name"));
				pc.setPchange_time(rs.getString("pchange_time"));
				pc.setPchange_pstate(rs.getString("pchange_pstate"));
				pc.setPchange_astate(rs.getString("pchange_astate"));
				pc.setPchange_class(rs.getString("pchange_class"));
				pc.setPchange_emp_id(rs.getString("pchange_emp_id"));
				pcs.add(pc);
			}
			/* conn.commit(); */
			System.out.println(pcs);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBUtils.release(rs, stmt, conn);
		}
		return pcs;
	}

	public void deletepChangeById(String pchange_id) {

		try {
			conn.setAutoCommit(false);
			sql = "delete from t_pa_pchange where pchange_id like'"
					+ pchange_id + "'";
			stmt = conn.prepareStatement(sql);
			stmt.executeUpdate();
			conn.commit();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	public void addpChange(pChange pchange) {
		try {
			conn.setAutoCommit(false);
			sql = "insert into t_pa_pchange values('" + pchange.getPchange_id()
					+ "','" + pchange.getPchange_name() + "',to_date('"
					+ pchange.getPchange_time() + "','yyyy-mm-dd'),'"
					+ pchange.getPchange_pstate() + "','"
					+ pchange.getPchange_astate() + "','"
					+ pchange.getPchange_class() + "','"
					+ pchange.getPchange_emp_id() + "')";

			stmt = conn.prepareStatement(sql);
			stmt.executeUpdate();
			conn.commit();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	public void updatepChangeInfo(pChange pchange) {
		try {
			conn.setAutoCommit(false);
			sql = "update t_pa_pchange set pchange_name='"
					+ pchange.getPchange_name() + "',pchange_time=to_date('"
					+ pchange.getPchange_time()
					+ "','YYYY-MM-DD HH24:MI:SS'),pchange_pstate='"
					+ pchange.getPchange_pstate() + "',pchange_astate='"
					+ pchange.getPchange_astate() + "',pchange_class='"
					+ pchange.getPchange_class() + "',pchange_emp_id='"
					+ pchange.getPchange_emp_id() + "'where pchange_id like'"
					+ pchange.getPchange_id() + "'";
			System.out.println(sql);
			stmt = conn.prepareStatement(sql);
			stmt.executeUpdate();
			conn.commit();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}
	public pChange queryInfo(String pchange_emp_id) throws SQLException{
		pChange pc = new pChange();
		
			sql="select * from t_pa_pchange where pchange_emp_id =?";
			List<Object> parm = new ArrayList<Object>();
			parm.add(pchange_emp_id);
			ResultSet rs = null;
			
			rs = DBUtils.query(sql,parm);
			while(rs.next()){
				
				pc.setPchange_id(rs.getString("pchange_id"));
				pc.setPchange_name(rs.getString("pchange_name"));
				pc.setPchange_time(rs.getString("pchange_time"));
				pc.setPchange_pstate(rs.getString("pchange_pstate"));
				pc.setPchange_astate(rs.getString("pchange_astate"));
				pc.setPchange_class(rs.getString("pchange_class"));
				pc.setPchange_emp_id(rs.getString("pchange_emp_id"));
				
			}
		
		return pc;
	}
	
public void addEngageRecord(EngageRecordEmp eremp){
		
		try {
			conn.setAutoCommit(false);
			sql = "insert into t_engage_record values('" + eremp.getRecordno()
					+ "','" + eremp.getEmp_id() + "','" + eremp.getEmp_name()
					+ "','" + eremp.getEmp_post() + "',to_date('"
					+ eremp.getEmp_date() + "','yyyy-mm-dd'))";
			stmt = conn.prepareStatement(sql);
			stmt.executeQuery();
			conn.commit();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

public void updateEngageRecord(EngageRecordEmp eremp) {
	try {
		conn.setAutoCommit(false);
		String sql = "update t_engage_record set emp_id='" 
				+eremp.getEmp_id()+ "',emp_name='" 
				+eremp.getEmp_post()+ "',emp_date=to_date('"
				+ eremp.getEmp_date() + "','yyyy-mm-dd hh24:mi:ss') where recordno='" 
				+eremp.getRecordno()+ "'";
		stmt = conn.prepareStatement(sql);
		System.out.println(sql);
		stmt.executeUpdate();
		conn.commit();
		
	} catch (SQLException e) {
		e.printStackTrace();
	}
	
}
}
