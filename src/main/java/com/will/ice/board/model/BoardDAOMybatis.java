package com.will.ice.board.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.will.ice.common.SearchVO;

@Repository
public class BoardDAOMybatis implements BoardDAO{
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	private String namespace="com.mybatis.mapper.oracle.board.";

	@Override
	public int insertBoard(BoardVO vo) {
		
		int cnt=sqlSession.insert(namespace+"insertBoard", vo);
		
		return cnt;
	}

	@Override
	public List<BoardVO> selectAll(SearchVO searchVo) {
		return sqlSession.selectList(namespace+"selectAll", searchVo);
	}

	@Override
	public int selectTotalRecord(SearchVO searchVo) {
		return sqlSession.selectOne(namespace+"selectTotalRecord", searchVo);
	} 
}
