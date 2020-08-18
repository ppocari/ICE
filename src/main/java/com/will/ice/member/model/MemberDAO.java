package com.will.ice.member.model;

import java.util.List;

import com.will.ice.common.DateSearchVO;
import com.will.ice.common.Depart_posi_dateVO;

public interface MemberDAO {
	
	String selectPwd(String memNo);
	
	MemberVO selectMember(String userid);
	
	int registerMulti(MemberVO memberVO);
	
	int updateSelectMember(MemberVO memberVO);
	
	int deleteSelectMember(MemberVO memberVO);
	
	List<MemberVO> selectMemberList(Depart_posi_dateVO dpdvo);
	
	int newPwd(MemberVO memVo);
	
	int idCheck(String memno);
	
}
