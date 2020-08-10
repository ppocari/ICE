package com.will.ice.boardComment.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class BoardCommentDAOMybatis implements BoardCommentDAO{
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	private String namespace="com.mybatis.mapper.oracle.boardComment.";

	@Override
	public int commentInsert(BoardCommentVO vo) {
		int cnt=sqlSession.insert(namespace+"commentInsert", vo);
		return cnt;
	}

	@Override
	public List<BoardCommentVO> commentList() {
		return sqlSession.selectList(namespace+"commentList");
	}

	@Override
	public int commentUpdate(BoardCommentVO vo) {
		return sqlSession.update(namespace+"commentUpdate", vo);
	}

	@Override
	public int commentDelete(int no) {
		return sqlSession.delete(namespace+"commentDelete", no);
	}
}
