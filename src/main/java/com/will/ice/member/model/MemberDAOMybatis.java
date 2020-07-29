package com.will.ice.member.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.will.ice.common.DateSearchVO;

@Repository
public class MemberDAOMybatis implements MemberDAO{
	private String namespace = "com.mybatis.mapper.oracle.member.";
	
	@Autowired
	private SqlSessionTemplate sqlsession;
	
	@Override
	public String selectPwd(String memNo) {
		return sqlsession.selectOne(namespace+"selectPwd", memNo);
	}

	@Override
	public MemberVO selectMember(String memNo) {
		return sqlsession.selectOne(namespace+"selectMember", memNo);
	}

	@Override
	public int registerMulti(MemberVO memberVO) {
		return sqlsession.insert(namespace + "registerMulti", memberVO);
	}

	@Override
	public List<MemberVO> searchAllmember(String searchKeyword) {
		return sqlsession.selectList(namespace+"searchAllmember" , searchKeyword);
	}

	@Override
	public List<MemberVO> selectMemberList(DateSearchVO dateSearchVo) {
		return sqlsession.selectList(namespace+"selectMemberList" , dateSearchVo);
	}

	

}
