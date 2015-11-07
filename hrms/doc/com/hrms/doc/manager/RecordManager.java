package com.hrms.doc.manager;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.hrms.doc.entity.Archive;
import com.hrms.doc.entity.Record;
import com.hrms.sys.dao.DBAccess;
import com.hrms.sys.dao.DBUtils;
import com.hrms.sys.entity.Department;

public class RecordManager {

	private DBAccess db;

	private Connection conn = null;

	private PreparedStatement stmt = null;

	private String sql = null;

	public RecordManager() {
		db = new DBAccess();
		db.createCon();
		conn = db.getConn();
		try {
			conn.setAutoCommit(false);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public int submitRecord(Record record) {
		int flag= 0;
		try {
			sql = "insert into t_doc_record values(?,?,?,?,?,?)";
			stmt = conn.prepareStatement(sql);
			stmt.setObject(1, record.getDept());
			stmt.setObject(2, record.getJob());
			stmt.setObject(3, record.getEdu());
			stmt.setObject(4, record.getWork());
			stmt.setObject(5, record.getStart());
			stmt.setObject(6, record.getEnd());
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
	
	public List<Record> queryAllRecords() {
		List<Record> records = new ArrayList<Record>();
		ResultSet rs = null;
		try {
			conn.setAutoCommit(false);
			sql = "select * from t_doc_record";
			stmt = conn.prepareStatement(sql);
			rs = stmt.executeQuery();
			while(rs.next()){
				Record record = new Record();
				record.setDept(rs.getString("dept"));
				record.setJob(rs.getString("job"));
				record.setEdu(rs.getString("edu"));
				record.setWork(rs.getString("work"));
				record.setStart(rs.getString("start_time"));
				record.setEnd(rs.getString("end_time"));
				
				records.add(record);
			}
			conn.commit();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return records;
	}
}
