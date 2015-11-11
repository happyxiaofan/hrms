package com.hrms.doc.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.hrms.doc.entity.Archive;
import com.hrms.doc.entity.BaseInfo;
import com.hrms.doc.manager.ArchiveManager;
import com.hrms.doc.manager.BaseInfoManager;
import com.hrms.sys.dao.DBUtils;
import com.hrms.sys.entity.Employee;
import com.hrms.sys.manager.UserManager;

public class ArchiveDAO {

	ArchiveManager manager = new ArchiveManager();
	ResultSet rs = null;
	String sql = null;
	public List<Archive> pageQueryArchive(int start, int end) {
		sql = "select * from (select p.*, rownum rn from (select * from t_doc_archive order by a_id) p where rownum<=?) where rn>?";
		List<Object> param = new ArrayList<Object>();
		param.add(end);
		param.add(start);
		List<Archive> archives = new ArrayList<Archive>();
		try {
			rs = manager.query(sql, param);
			while(rs.next()) {
				Archive archive = new Archive();
				archive.setA_id(rs.getString("a_id"));
				archive.setE_id(rs.getString("e_id"));
				archive.setA_num(rs.getString("a_num"));
				archive.setA_name(rs.getString("a_name"));
				archive.setA_sum(rs.getString("a_sum"));
				archive.setA_note(rs.getString("a_note"));
				archives.add(archive);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBUtils.release(rs, null, null);
		}
		return archives;
	}
	
	public int getRecordCount() {
		sql  = "select count(*) c from t_doc_archive";
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
