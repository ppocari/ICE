package com.will.ice.spay.model;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.will.ice.common.DateSearchVO;

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
	public List<Map<String, Object>> selectSpayView(int MEMNO) {
		return sqlSession.selectList(namespace+"selectSpayView",MEMNO);
	}

	@Override
	public int selectDay(DateSearchVO dateSearchVo) {
		return sqlSession.selectOne(namespace+"selectDay",dateSearchVo);
	}

	@Override
	public SpayVO searchAll(int ticno) {
		return sqlSession.selectOne(namespace+"searchAll", ticno);
	}

	@Override
	public int searchNum(int MEMNO) {
		return sqlSession.selectOne(namespace+"searchNum", MEMNO);
	}

}
