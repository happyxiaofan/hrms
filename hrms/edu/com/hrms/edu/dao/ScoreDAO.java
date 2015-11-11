package com.hrms.edu.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.hrms.doc.entity.BaseInfo;
import com.hrms.doc.manager.BaseInfoManager;
import com.hrms.edu.entity.Score;
import com.hrms.edu.manager.ScoreManager;
import com.hrms.sys.dao.DBUtils;
import com.hrms.sys.entity.Employee;
import com.hrms.sys.manager.UserManager;

public class ScoreDAO {

	ScoreManager manager = new ScoreManager();
	ResultSet rs = null;
	String sql = null;
	public List<Score> pageQueryScore(int start, int end) {
		sql = "select * from (select p.*, rownum rn from (select * from t_edu_score  order by s_id) p where rownum<=?) where rn>?";
		List<Object> param = new ArrayList<Object>();
		param.add(end);
		param.add(start);
		List<Score> ss = new ArrayList<Score>();
		try {
			rs = manager.query(sql, param);
			while(rs.next()) {
				Score s = new Score();
				s.setsId(rs.getString("s_id"));
				s.setsClass(rs.getString("s_class"));
				s.setsName(rs.getString("s_name"));
				s.setsScore(rs.getInt("s_score"));
				ss.add(s);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBUtils.release(rs, null, null);
		}
		return ss;
	}
	
	public int getRecordCount() {
		sql  = "select count(*) c from t_edu_score";
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
