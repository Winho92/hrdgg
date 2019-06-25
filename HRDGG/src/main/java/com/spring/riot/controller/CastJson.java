package com.spring.riot.controller;

public class CastJson {
	public static Long castLong(Object json) {
		if(json == null)
			return 0L;
		Long result = Long.parseLong(json.toString());
		
		return result;
	}
	
	public static boolean castBoolean(Object json) {
		if(json == null)
			return false;
		boolean result = Boolean.parseBoolean(json.toString());
		
		return result;
	}
	
	public static int castInteger(Object json) {
		if(json == null)
			return 0;
		int result = Integer.parseInt(json.toString());
		
		return result;
	}

}
