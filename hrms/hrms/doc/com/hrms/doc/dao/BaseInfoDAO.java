package com.hrms.doc.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.hrms.doc.entity.BaseInfo;
import com.hrms.doc.manager.BaseInfoManager;
import com.hrms.sys.dao.DBUtils;
import com.hrms.sys.entity.Employee;
import com.hrms.sys.manager.UserManager;

public class BaseInfoDAO {

	BaseInfoManager manager = new BaseInfoManager();
	ResultSet rs = null;
	String sql = null;
	public List<BaseInfo> pageQueryBaseInfo(int start, int end) {
		sql = "select * from (select p.*, rownum rn from (select * from t_doc_baseinfo  order by e_name) p where rownum<=?) where rn>?";
		List<Object> param = new ArrayList<Object>();
		param.add(end);
		param.add(start);
		List<BaseInfo> infos = new ArrayList<BaseInfo>();
		try {
			rs = manager.query(sql, param);
			while(rs.next()) {
				BaseInfo info = new BaseInfo();
				info.setE_name(rs.getString("e_name"));
				info.setGender(rs.getString("gender"));
				info.setEducation(rs.getString("edu"));
				info.setDegree(rs.getString("degree"));
				info.setStatus(rs.getInt("status"));
				infos.add(info);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBUtils.release(rs, null, null);
		}
		return infos;
	}
	
	public int getRecordCount() {
		sql  = "select count(*) c from t_doc_baseinfo";
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
