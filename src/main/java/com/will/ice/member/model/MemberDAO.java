package com.will.ice.member.model;

public interface MemberDAO {
	
	String selectPwd(String memNo);
	MemberVO_log selectMember(String userid);
}
