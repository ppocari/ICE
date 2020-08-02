package com.will.ice.accode.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class AccodeDAOMybatis implements AccodeDAO{
	private String namespace = "com.mybatis.mapper.oracle.accode.";
	
	@Autowired
	private SqlSessionTemplate sqlsession;
	
	@Override
	public List<AccodeVO> selectAccode(String useplace) {
		return sqlsession.selectList(namespace+"selectAccode", useplace);
	}

}
