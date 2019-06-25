package com.spring.test;

public class MyJSON {
	
	public static int toInteger(Object object) {
		if (object == null) 
			return 0;
		return Integer.parseInt(object.toString());
	}
	
	public static double toDouble(Object object) {
		if (object == null) return 0.0;
		return Double.parseDouble(object.toString());
	}
	
	public static long toLong(Object object) {
		if (object == null) return 0;
		return Long.parseLong(object.toString());
	}
	
	public static boolean toBoolean(Object object) {
		if (object == null) return false;
		return Boolean.parseBoolean(object.toString());
	}
	
	public static String toString(Object object) {
		if (object == null) return "";
		return object.toString();
	}
}
