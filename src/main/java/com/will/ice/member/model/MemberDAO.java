package com.will.ice.member.model;

import java.util.List;

import com.will.ice.common.DateSearchVO;

public interface MemberDAO {
	
	String selectPwd(String memNo);
	MemberVO selectMember(String userid);
	
	
	int registerMulti(MemberVO memberVO);
	
	int updateSelectMember(MemberVO memberVO);
	
	int deleteSelectMember(MemberVO memberVO);
	
	List<MemberVO> searchAllmember(String searchKeyword);
	List<MemberVO> selectMemberList(DateSearchVO dateSearchVo);
}
