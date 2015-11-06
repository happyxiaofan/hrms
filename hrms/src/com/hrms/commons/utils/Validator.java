package com.hrms.commons.utils;

import java.util.List;

import com.hrms.sys.entity.Role;

public class Validator {

	public static boolean isValid(List<?> roles) {
		if(roles!= null && roles.size() > 0)
			return true;
		return false;
	}

	public static boolean isValid(Role role1) {
		if(role1 != null)
			return true;
		return false;
	}

}
