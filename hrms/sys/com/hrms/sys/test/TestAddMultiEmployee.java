package com.hrms.sys.test;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.hrms.sys.manager.UserManager;

public class TestAddMultiEmployee {

	static UserManager manager = new UserManager();

	public static void main(String[] args) {
		String sql = "insert into t_user(e_id,e_name,role_id) values(?,?,?)";
		List<Object> param = new ArrayList<Object>();
		for (int i = 1; i <= 100; i++) {
			param.add("e" + i);
			if (i % 2 == 0) {
				param.add("李" + i);
			} else {
				param.add("王" + i);
			}
			param.add("r" + i);
			try {
				manager.update(sql, param);
			} finally {
				param.clear();// 为什么加这句？？
			}
		}
	}
}
