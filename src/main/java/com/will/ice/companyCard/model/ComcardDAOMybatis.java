package com.will.ice.companyCard.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.will.ice.model.SearchYearMonthVO;

@Repository
public class ComcardDAOMybatis implements ComcardDAO{
	private String namespace = "com.mybatis.mapper.oracle.comcard.";
	
	@Autowired
	private SqlSession sqlsession;

	@Override
	public List<ComcardVO> selectUnUseComcard(SearchYearMonthVO ymvo) {
		return sqlsession.selectList(namespace+"selectUnUseComcard", ymvo);
	}

	@Override
	public ComcardVO selectNoComcard(int comcard_no) {
		return sqlsession.selectOne(namespace+"selectNoComcard", comcard_no);
	}

	

}
