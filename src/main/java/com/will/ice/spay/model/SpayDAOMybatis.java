package com.will.ice.spay.model;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class SpayDAOMybatis implements SpayDAO{

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	private String namespace="com.mybatis.mapper.oracle.spay.";
	
	@Override
	public int insertTic(SpayVO vo) {
		return sqlSession.insert(namespace+"insertTic", vo);
	}

	@Override
	public Map<String, Object> selectSpayView(int MEMNO) {
		return sqlSession.selectOne(namespace+"selectSpayView",MEMNO);
	}

}
