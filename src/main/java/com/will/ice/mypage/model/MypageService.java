package com.will.ice.mypage.model;

public interface MypageService {
	
	public MypageVO selectEmployee(String empNo);
	public int updateEmployee(MypageVO mypageVO);
}
