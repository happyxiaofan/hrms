package com.hrms.sys.utils;

/**
* 定义EL自定义函数
*
*/  
public class UFunction {   
  
	private static String p = ".";
    /**
      * 获取一个字符串的长度
      *
      * @param str
      * @return int
      */  
    public static int getLen(String str) {   
        return str.length();   
     }   
  
    /**
      * 截取字符串
      *
      * @param str
      * @param start
      * @param end
      * @return String
      */  
    public static String substr(String str, int start, int end) {   
        return str.substring(start, end);   
     }   
  
    public static int lastIndex(String c){
    	return c.lastIndexOf(p);
    }
}  

