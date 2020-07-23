package com.will.ice.mypage.model;

public interface MypageDAO {
	
	public MypageVO selectEmployee(String memNo);
	public int updateEmployee(MypageVO mypageVO);
}
