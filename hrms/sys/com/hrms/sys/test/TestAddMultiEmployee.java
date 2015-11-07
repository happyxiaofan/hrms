package com.hrms.sys.test;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.hrms.doc.manager.ArchiveManager;
import com.hrms.sys.manager.UserManager;

public class TestAddMultiEmployee {

	static ArchiveManager manager = new ArchiveManager();

	public static void main(String[] args) {
		String sql = "insert into t_doc_archive values(?,?,?,?,?,?)";
		List<Object> param = new ArrayList<Object>();
		for (int i = 1; i <= 100; i++) {
			param.add("id"+i+2);
			/*if (i % 2 == 0) {
				param.add("e" + i);
			} else {
				param.add("f" + i);
			}*/
			param.add("e"+i);
			param.add("n" + i);
			param.add("na"+i);
			param.add("as"+i);
			param.add("an"+i);
			try {
				manager.update(sql, param);
			} finally {
				param.clear();// 为什么加这句？？
			}
		}
	}
}
