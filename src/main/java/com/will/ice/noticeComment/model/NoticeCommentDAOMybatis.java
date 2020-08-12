package com.will.ice.noticeComment.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class NoticeCommentDAOMybatis implements NoticeCommentDAO{
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	private String namespace="com.mybatis.mapper.oracle.noticeComment.";

	
	@Override
	public int commentInsert(NoticeCommentVO vo) {
		int cnt=sqlSession.insert(namespace+"commentInsert", vo);
		return cnt;
	}

	@Override
	public List<NoticeCommentVO> commentList(int noticeNo) {
		return sqlSession.selectList(namespace+"commentList", noticeNo);
	}

	@Override
	public int commentUpdate(NoticeCommentVO vo) {
		return sqlSession.update(namespace+"commentUpdate", vo);
	}

	@Override
	public int commentDelete(int noticeNo) {
		return sqlSession.delete(namespace+"commentDelete", noticeNo);
	}

}
