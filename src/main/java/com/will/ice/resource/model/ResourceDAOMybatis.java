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
	public List<ResKindVo> selectResKind() {
		return sqlSession.selectList(namespace+"selectResKind");
	}

	@Override
	public List<ResReserveVO> selectReserveResNo(int resNo) {
		return sqlSession.selectList(namespace+"selectReserveResNo", resNo);
	}

	@Override
	public ResKindVo selectReserveKind(int rkNo) {
		return sqlSession.selectOne(namespace+"selectReserveKind", rkNo);
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
		return sqlSession.insert(namespace+"insertResReserve", rsVo);
	}

	@Override
	public List<ResReserveVO> selectReserve(ResReserveSearchVO rss) {
		return sqlSession.selectList(namespace+"selectReserve", rss);
	}

	@Override
	public int selectReserveCount() {
		return sqlSession.selectOne(namespace+"selectReserveCount");
	}

	@Override
	public int updateConfirmReserve(ResKindVo rkVo) {
		return sqlSession.update(namespace+"updateConfirmReserve", rkVo);
	}

	@Override
	public int updateNoReasonReserve(ResKindVo rkVo) {
		return sqlSession.update(namespace+"updateNoReasonReserve", rkVo);
	}
	
	

}
