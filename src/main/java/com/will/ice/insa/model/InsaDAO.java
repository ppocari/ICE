package com.will.ice.insa.model;

import java.util.List;

import com.will.ice.common.Depart_posi_dateVO;

public interface InsaDAO {
	
	String selectPwd(String memNo);
	InsaVO selectMember(String userid);
	
	
	int registerMulti(InsaVO memberVO);
	
	int updateSelectMember(InsaVO memberVO);
	
	int deleteSelectMember(InsaVO memberVO);
	
	List<InsaVO> selectMemberList(Depart_posi_dateVO dpdvo);
	
	int newPwd(InsaVO memVo);
}
