package com.will.ice.resource.model;

import java.util.List;

public interface ResourceDAO {

	//자원관리
	List<ResManageVO> selectResManage(ResManageSearchVO rmsVo);
	int selectTotalRecord();
	

	List<ResKindVO> selectResKind();

	int insertResManage(ResManageVO rmVo);
	ResManageVO selectResManageOne(int resNo);
	int updateResource(ResManageVO rmVo);
	int deleteResManage(int resNo);

	//자원예약
	List<ResReserveVO> selectReserveResNo(int resNo);
	List<ResReserveVO> selectStartAvailableHour(ResReserveVO rsVo);
	ResReserveVO selectEndAvailableHour(ResReserveVO rsVo);
	int insertResReserve(ResReserveVO rsVo);
	
	//자원예약 처리
	List<ResReserveVO> selectReserveCondition(ResReserveSearchVO rss);
	int selectReserveCountCondition(ResReserveSearchVO rssVo);
	int updateReserveState(StringIntVo rkVo);
	int updateReserveNoReason(StringIntVo rkVo);
	
	//자원이용현황
	List<ResReserveVO> selectReserveResNoHistory(ResReserveSearchVO rss);
	int selectReserveResNoHistoryCount(StringIntVo siVo);
	List<ResReserveVO> selectReserveRkNoHistory(ResReserveSearchVO rss);
	int selectReserveRkNoHistoryCount(StringIntVo siVo);
	List<ResManageVO> selectReserveKind(int rkNo);
	List<ResReserveVO> selectResNoCalendar(int resNo);
	List<ResReserveVO> selectRkNoCalendar(int rkNo);
	
	//내 자원 이용현황
	List<ResReserveVO> selectMyAllReserve(ResReserveSearchVO rss);
	List<ResReserveVO> selectMyFutureReserve(ResReserveSearchVO rss);
	List<ResReserveVO> selectMyPastReserve(ResReserveSearchVO rss);
	int selectMyAllReserveCount(StringIntVo siVo);
	int selectMyFutureReserveCount(StringIntVo siVo);
}
