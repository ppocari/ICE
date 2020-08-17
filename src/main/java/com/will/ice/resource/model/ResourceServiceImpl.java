package com.will.ice.resource.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ResourceServiceImpl implements ResourceService {

	@Autowired
	private ResourceDAO dao;
	
	@Override
	public List<ResManageVO> selectResManager(ResManageSearchVO rmsVo) {
		return dao.selectResManage(rmsVo);
	}
	
	@Override
	public int insertResManage(ResManageVO rmVo) {
		return dao.insertResManage(rmVo);
	}

	@Override
	public ResManageVO selectResManageOne(int resNo) {
		return dao.selectResManageOne(resNo);
	}

	@Override
	public int updateResource(ResManageVO rmVo) {
		return dao.updateResource(rmVo);
	}

	@Override
	public int deleteResManage(int resNo) {
		return dao.deleteResManage(resNo);
	}

	@Override
	public int selectTotalRecord() {
		return dao.selectTotalRecord();
	}

	@Override
	public List<ResKindVO> selectResKind() {
		return dao.selectResKind();
	}

	@Override
	public List<ResReserveVO> selectReserveResNo(int resNo) {
		return dao.selectReserveResNo(resNo);
	}

	@Override
	public List<ResManageVO> selectReserveKind(int rkNo) {
		return dao.selectReserveKind(rkNo);
	}

	@Override
	public List<ResReserveVO> selectStartAvailableHour(ResReserveVO rsVo) {
		return dao.selectStartAvailableHour(rsVo);
	}

	@Override
	public ResReserveVO selectEndAvailableHour(ResReserveVO rsVo) {
		return dao.selectEndAvailableHour(rsVo);
	}

	@Override
	public int insertResReserve(ResReserveVO rsVo) {
		return dao.insertResReserve(rsVo);
	}

	@Override
	public List<ResReserveVO> selectReserveCondition(ResReserveSearchVO rss) {
		return dao.selectReserveCondition(rss);
	}


	@Override
	public int selectReserveCountCondition(ResReserveSearchVO rssVo) {
		return dao.selectReserveCountCondition(rssVo);
	}

	@Override
	public int updateReserveState(StringIntVo siVo) {
		return dao.updateReserveState(siVo);
	}

	@Override
	public int updateReserveNoReason(StringIntVo rkVo) {
		return dao.updateReserveNoReason(rkVo);
	}

	@Override
	public List<ResReserveVO> selectReserveResNoHistory(ResReserveSearchVO rss) {
		return dao.selectReserveResNoHistory(rss);
	}

	@Override
	public int selectReserveResNoHistoryCount(StringIntVo siVo) {
		return dao.selectReserveResNoHistoryCount(siVo);
	}

	@Override
	public List<ResReserveVO> selectReserveRkNoHistory(ResReserveSearchVO rss) {
		return dao.selectReserveRkNoHistory(rss);
	}

	@Override
	public int selectReserveRkNoHistoryCount(StringIntVo siVo) {
		return dao.selectReserveRkNoHistoryCount(siVo);
	}

	@Override
	public List<ResReserveVO> selectResNoCalendar(int resNo) {
		return dao.selectResNoCalendar(resNo);
	}

	@Override
	public List<ResReserveVO> selectRkNoCalendar(int rkNo) {
		return dao.selectRkNoCalendar(rkNo);
				
	}

	@Override
	public List<ResReserveVO> selectMyFutureReserve(ResReserveSearchVO rss) {
		return dao.selectMyFutureReserve(rss);
	}

	@Override
	public List<ResReserveVO> selectMyPastReserve(ResReserveSearchVO rss) {
		return dao.selectMyPastReserve(rss);
	}

	@Override
	public List<ResReserveVO> selectMyAllReserve(ResReserveSearchVO rss) {
		return dao.selectMyAllReserve(rss);
	}

	@Override
	public int selectMyAllReserveCount(StringIntVo siVo) {
		return dao.selectMyAllReserveCount(siVo);
	}

	@Override
	public int selectMyFutureReserveCount(StringIntVo siVo) {
		return dao.selectMyFutureReserveCount(siVo);
	}


}
