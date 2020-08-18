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
	public int deleteNotice(int noticeNo) {
		return sqlSession.delete(namespace+"deleteNotice", noticeNo);
	}

	@Override
	public int updateNotice(NoticeVO vo) {
		return sqlSession.update(namespace+"updateNotice", vo);
	}

	@Override
	public int updateDownCount(int noticeNo) {
		return sqlSession.update(namespace+"updateDownCount", noticeNo);
	}

	@Override
	public List<NoticeVO> selectMain() {
		return sqlSession.selectList(namespace+"selectMain");
	}


}
