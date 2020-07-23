package com.will.ice.mypage.model;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MypageDAOMybatis implements MypageDAO{
	@Autowired SqlSessionTemplate sqlsession;
	String namespace = "com.mybatis.mapper.oracle.mypage.";
	
	@Override
	public MypageVO selectEmployee(String memNo) {
		return sqlsession.selectOne(namespace+"selectEmployee",memNo);
	}

	@Override
	public int updateEmployee(MypageVO mypageVO) {
		return sqlsession.update(namespace+"updateEmployee",mypageVO);
	}
	
}
