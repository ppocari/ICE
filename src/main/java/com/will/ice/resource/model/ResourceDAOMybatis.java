package com.will.ice.resource.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ResourceDAOMybatis implements ResourceDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	private String namespace="com.mybatis.mapper.oracle.resource.";

	//자원관리
	@Override
	public List<ResManageVO> selectResManage(ResManageSearchVO rmsVo) {
		return sqlSession.selectList(namespace+"selectResManage", rmsVo);
	}

	@Override
	public int insertResManage(ResManageVO rmVo) {
		return sqlSession.insert(namespace+"insertResManage", rmVo);
	}

	@Override
	public ResManageVO selectResManageOne(int resNo) {
		return sqlSession.selectOne(namespace+"selectResManageOne", resNo);
	}

	@Override
	public int updateResource(ResManageVO rmVo) {
		return sqlSession.update(namespace+"updateResource", rmVo);
	}

	@Override
	public int deleteResManage(int resNo) {
		return sqlSession.delete(namespace+"deleteResManage", resNo);
	}

	@Override
	public int selectTotalRecord() {
		return sqlSession.selectOne(namespace+"selectTotalRecord");
	}

	
	//자원예약
	@Override
	public List<ResKindVO> selectResKind() {
		return sqlSession.selectList(namespace+"selectResKind");
	}

	@Override
	public List<ResReserveVO> selectReserveResNo(int resNo) {
		return sqlSession.selectList(namespace+"selectReserveResNo", resNo);
	}

	@Override
	public List<ResManageVO> selectReserveKind(int rkNo) {
		return sqlSession.selectList(namespace+"selectReserveKind", rkNo);
	}

	@Override
	public List<ResReserveVO> selectStartAvailableHour(ResReserveVO rsVo) {
		return sqlSession.selectList(namespace+"selectStartAvailableHour", rsVo);
	}

	@Override
	public ResReserveVO selectEndAvailableHour(ResReserveVO rsVo) {
		return sqlSession.selectOne(namespace+"selectEndAvailableHour", rsVo);
	}

	@Override
	public int insertResReserve(ResReserveVO rsVo) {
		System.out.println("resNo="+rsVo.getResNo());
		return sqlSession.insert(namespace+"insertResReserve", rsVo);
	}

	@Override
	public List<ResReserveVO> selectReserveCondition(ResReserveSearchVO rss) {
		return sqlSession.selectList(namespace+"selectReserveCondition", rss);
	}

	@Override
	public int selectReserveCountCondition(ResReserveSearchVO rssVo) {
		return sqlSession.selectOne(namespace+"selectReserveCountCondition", rssVo);
	}

	@Override
	public int updateReserveState(StringIntVo siVo) {
		return sqlSession.update(namespace+"updateReserveState", siVo);
	}

	@Override
	public int updateReserveNoReason(StringIntVo siVo) {
		return sqlSession.update(namespace+"updateReserveNoReason", siVo);
	}

	@Override
	public List<ResReserveVO> selectReserveResNoHistory(ResReserveSearchVO rss) {
		return sqlSession.selectList(namespace+"selectReserveResNoHistory", rss);
	}

	@Override
	public int selectReserveResNoHistoryCount(StringIntVo siVo) {
		return sqlSession.selectOne(namespace+"selectReserveResNoHistoryCount", siVo);
	}

	@Override
	public List<ResReserveVO> selectReserveRkNoHistory(ResReserveSearchVO rss) {
		return sqlSession.selectList(namespace+"selectReserveRkNoHistory", rss);
	}

	@Override
	public int selectReserveRkNoHistoryCount(StringIntVo siVo) {
		return sqlSession.selectOne(namespace+"selectReserveRkNoHistoryCount", siVo);
	}

	@Override
	public List<ResReserveVO> selectResNoCalendar(int resNo) {
		return sqlSession.selectList(namespace+"selectResNoCalendar", resNo);
	}

	@Override
	public List<ResReserveVO> selectRkNoCalendar(int rkNo) {
		return sqlSession.selectList(namespace+"selectRkNoCalendar", rkNo);
	}

	@Override
	public List<ResReserveVO> selectMyFutureReserve(ResReserveSearchVO rss) {
		return sqlSession.selectList(namespace+"selectMyFutureReserve", rss);
	}
	@Override
	public List<ResReserveVO> selectMyPastReserve(ResReserveSearchVO rss) {
		return sqlSession.selectList(namespace+"selectMyPastReserve", rss);
	}

	@Override
	public List<ResReserveVO> selectMyAllReserve(ResReserveSearchVO rss) {
		return sqlSession.selectList(namespace+"selectMyAllReserve", rss);
	}

	@Override
	public int selectMyAllReserveCount(StringIntVo siVo) {
		return sqlSession.selectOne(namespace+"selectMyAllReserveCount", siVo);
				
	}

	@Override
	public int selectMyFutureReserveCount(StringIntVo siVo) {
		return sqlSession.selectOne(namespace+"selectMyFutureReserveCount", siVo);
	}
	

}
