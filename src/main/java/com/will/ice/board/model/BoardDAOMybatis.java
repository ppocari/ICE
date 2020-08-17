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

	@Override
	public BoardVO selectByNo(int boardNo) {
		return sqlSession.selectOne(namespace+"selectByNo", boardNo);
	}

	@Override
	public String selectPwd(int boardNo) {
		return sqlSession.selectOne(namespace+"selectPwd", boardNo);
	}

	@Override
	public int deleteBoard(int boardNo) {
		return sqlSession.delete(namespace+"deleteBoard", boardNo);
	}

	@Override
	public int updateBoard(BoardVO vo) {
		return sqlSession.update(namespace+"updateBoard", vo);
	}

	@Override
	public int updateVisited(int boardNo) {
		return sqlSession.update(namespace+"updateVisited", boardNo);
	}

}
