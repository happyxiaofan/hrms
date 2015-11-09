package com.hrms.edu.manager;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.hrms.edu.entity.Cert;
import com.hrms.edu.entity.EduTrain;
import com.hrms.sys.dao.DBAccess;

public class CertManager {
private DBAccess db;
	private Connection conn = null;
	
	private PreparedStatement stmt = null;
	
	private String sql = null;
	
	public CertManager() {
		db = new DBAccess();
		db.createCon();
		conn = db.getConn();
	}
	
	public void addCert(Cert cert) {
		try {
			conn.setAutoCommit(false);
			stmt = conn.prepareStatement("insert into t_edu_cert(c_id,c_name,c_stu,c_tec,c_time) values('"
					+ cert.getcId()+ "','"
					+ cert.getcName()+ "','"
					+ cert.getcStu()+ "','"
					+ cert.getcTec()+ "','"
					+ cert.getcDate()+ "')");
			stmt.executeUpdate();
			conn.commit();
		} catch (SQLException e) {
			e.printStackTrace();
		} 
	}
	//判断是否存在
	public boolean isValid(Cert cert) {
		boolean flag = false;
		ResultSet rs = null;
		try {
			sql = "select * from t_edu_train where c_id='"
					+ cert.getcId() + "' and c_name='" + cert.getcName() + "'";
			stmt = conn.prepareStatement(sql);
			rs = stmt.executeQuery();
			conn.commit();
			if (rs.next()) {
				flag = true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return flag;
	}
	
	//查询培训记录
	public List<Cert> queryAllCerts(){
		List<Cert> certs = new ArrayList<Cert>();
		ResultSet rs = null;
		try {
			 stmt = conn.prepareStatement("select * from t_edu_cert");
			 rs = stmt.executeQuery();
			 Cert cert = null;
			 while(rs.next()){
				 cert = new Cert();
				 cert.setcId(rs.getString("c_id"));
				 cert.setcName(rs.getString("c_name"));
				 cert.setcStu(rs.getString("c_stu"));
				 cert.setcTec(rs.getString("c_tec"));
				 cert.setcDate(rs.getString("c_time"));
				 certs.add(cert);
			 }
			 conn.commit();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return certs;
	}
	
	//删除培训记录
	public void deleteByCertId(int cId){
		try {
			stmt = conn.prepareStatement("delete from t_edu_cert where c_id='"+cId+"'");
			stmt.executeUpdate();
			conn.commit();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
