package com.hrms.commons.utils;

import java.text.SimpleDateFormat;
import java.util.Date;

public class DateFormatUtil {

	public static String format(Date date){
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy年MM月dd日  EEE hh:mm:ss");
		return simpleDateFormat.format(date);
	}
	
	public static void main(String[] args) {
		System.out.println(DateFormatUtil.format(new Date()));
	}
}
