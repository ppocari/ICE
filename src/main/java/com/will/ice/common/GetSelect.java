package com.will.ice.common;

import java.util.ArrayList;
import java.util.List;

public class GetSelect {
	public static List<String> getPhoneSelect() {
		List<String> phList = new ArrayList<String>();
		
		phList.add("010");
		phList.add("011");
		phList.add("016");
		
		return phList;
	}
	
	public static List<String> getEmailSelect() {
		List<String> emList = new ArrayList<String>();
		
		emList.add("naver.com");
		emList.add("gmail.com");
		emList.add("daum.net");
		emList.add("직접 입력");
		
		return emList;
	}
}
