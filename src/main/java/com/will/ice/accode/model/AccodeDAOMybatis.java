package com.will.ice.accode.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.will.ice.common.SearchVO;

@Repository
public class AccodeDAOMybatis implements AccodeDAO{
	
	@Autowired
	private SqlSessionTemplate sqlsession;
	
	private String namespace = "com.mybatis.mapper.oracle.accode.";
	
	@Override
	public List<AccodeVO> selectListAccode(SearchVO searchVO) {
		return sqlsession.selectList(namespace+"selectListAccode",searchVO);
	}

}
