package com.will.ice.member.model;

import java.util.List;

public interface MemberDAO {
	
	String selectPwd(String memNo);
	MemberVO selectMember(String userid);
	
	
	int registerMulti(MemberVO memberVO);
	
	
	
	List<MemberVO> searchAllmember(String searchKeyword);
}
