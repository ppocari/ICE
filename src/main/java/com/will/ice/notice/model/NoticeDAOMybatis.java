package com.will.ice.notice.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.will.ice.common.SearchVO;
	
@Repository
public class NoticeDAOMybatis implements NoticeDAO{
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	private String namespace="com.mybatis.mapper.oracle.notice.";

	@Override
	public int insertNotice(NoticeVO vo) {
		int cnt=sqlSession.insert(namespace+"insertNotice", vo);
		
		return cnt;
	}
	
	@Override
	public List<NoticeVO> selectAll(SearchVO searchVo){
		return sqlSession.selectList(namespace+"selectAll", searchVo);
	}
	
	@Override
	public int selectTotalRecord(SearchVO searchVo) {
		return sqlSession.selectOne(namespace+"selectTotalRecord", searchVo);
	}
	
	public int updateReadCount(int noticeNo) {
		return sqlSession.update(namespace+"updateReadCount", noticeNo);
	}

	@Override
	public NoticeVO selectByNo(int noticeNo) {
		return sqlSession.selectOne(namespace+"selectByNo", noticeNo);
	}

	@Override
	public int deleteBoard(int noticeNo) {
		return sqlSession.delete(namespace+"deleteBoard", noticeNo);
	}

	@Override
	public int updateBoard(int noticeNo) {
		return sqlSession.update(namespace+"updateBoard", noticeNo);
	}

	@Override
	public NoticeVO selectByNo(int NOTI_NO) {
		return sqlSession.selectOne(namespace+"selectByNo", NOTI_NO);
	}

	@Override
	public int deleteBoard(int NOTI_NO) {
		return sqlSession.delete(namespace+"deleteBoard", NOTI_NO);
	}

	@Override
	public int updateBoard(int NOTI_NO) {
		return sqlSession.update(namespace+"updateBoard", NOTI_NO);
	}
}
