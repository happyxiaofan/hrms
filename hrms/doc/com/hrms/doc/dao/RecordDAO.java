package com.hrms.doc.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.hrms.doc.entity.Archive;
import com.hrms.doc.entity.BaseInfo;
import com.hrms.doc.entity.Record;
import com.hrms.doc.manager.ArchiveManager;
import com.hrms.doc.manager.BaseInfoManager;
import com.hrms.doc.manager.RecordManager;
import com.hrms.sys.dao.DBUtils;
import com.hrms.sys.entity.Employee;
import com.hrms.sys.manager.UserManager;

public class RecordDAO {

	RecordManager recordManager = new RecordManager();
	ResultSet rs = null;
	String sql = null;
	public List<Record> pageQueryRecord(int start, int end) {
		sql = "select * from (select p.*, rownum rn from (select * from t_doc_record  order by dept) p where rownum<=?) where rn>?";
		List<Object> param = new ArrayList<Object>();
		param.add(end);
		param.add(start);
		List<Record> records = new ArrayList<Record>();
		try {
			rs = recordManager.query(sql, param);
			while(rs.next()) {
				Record record = new Record();
				record.setDept(rs.getString("dept"));
				record.setJob(rs.getString("job"));
				record.setEdu(rs.getString("edu"));
				record.setWork(rs.getString("work"));
				record.setStart(rs.getString("start_time"));
				record.setEnd(rs.getString("end_time"));
				
				records.add(record);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBUtils.release(rs, null, null);
		}
		return records;
	}
	
	public int getRecordCount() {
		sql  = "select count(*) c from t_doc_record";
		int recordCount = 0;
		try {
			rs = recordManager.query(sql, null);
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
