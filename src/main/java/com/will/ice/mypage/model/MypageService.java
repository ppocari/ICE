package com.will.ice.mypage.model;

public interface MypageService {
	
	public MypageVO selectEmployee(String memNo);
	public int updateEmployee(MypageVO mypageVO);
}
