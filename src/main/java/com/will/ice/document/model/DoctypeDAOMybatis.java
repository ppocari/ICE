package com.will.ice.document.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class DoctypeDAOMybatis implements DoctypeDAO{
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	private String namespace="com.mybatis.mapper.oracle.doctype.";

	@Override
	public List<DoctypeVO> selectAll() {
		return sqlSession.selectList(namespace+"selectAll");
	}

	@Override
	public String choosenType(int typeNo) {
		return sqlSession.selectOne(namespace+"choosenType",typeNo);
	}
	
}
