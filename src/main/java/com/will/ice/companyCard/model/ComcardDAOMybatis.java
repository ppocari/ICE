package com.will.ice.companyCard.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ComcardDAOMybatis implements ComcardDAO{
	private String namespace = "com.mybatis.mapper.oracle.comcard.";
	
	@Autowired
	private SqlSession sqlsession;
	
	@Override
	public List<ComcardVO> selectAllComcard() {
		return sqlsession.selectList(namespace+"selectAllComcard");
	}

	

}
