package com.will.ice.mypage.model;

public interface MypageService {
	//로그인 처리 관련 상수
	int LOGIN_OK=1; //로그인 성공
	int PWD_DISAGREE=2; //비밀번호 불일치
	int ID_NONE=3; //아이디 존재하지 않음
	
	
	public MypageVO selectEmployee(String memNo);
	public int loginCheck(String memNo, String pwd);
	public int updateEmployee(MypageVO mypageVO);
}
