package com.will.ice.resource.model;

import java.util.List;

public interface ResourceService {

	List<ResManageVO> selectResManager(ResManageSearchVO rmsVo);

	int insertResManage(ResManageVO rmVo);
	
	List<ResKindVo> selectResKind();
	ResManageVO selectResManageOne(int resNo);
	int updateResource(ResManageVO rmVo);
	int updateManageDel(int resNo);
	int updateReserveBecauseResDelete(int resNo);
	int selectTotalRecord();
	
	
	//자원예약
	List<ResReserveVO> selectReserveResNo(int resNo);
	List<ResReserveVO> selectStartAvailableHour(ResReserveVO rsVo);
	ResReserveVO selectEndAvailableHour(ResReserveVO rsVo);
	int insertResReserve(ResReserveVO rsVo);
	
	//자원 예약 처리
	List<ResReserveVO> selectReserveCondition(ResReserveSearchVO rss);
	int selectReserveCountCondition(ResReserveSearchVO rssVo);
	int updateReserveState(StringIntVo siVo);
	int updateReserveNoReason(StringIntVo siVo);
	
	//자원 이용 현황
	List<ResReserveVO> selectReserveResNoHistory(ResReserveSearchVO rss);
	int selectReserveResNoHistoryCount(StringIntVo siVo);
	List<ResReserveVO> selectReserveRkNoHistory(ResReserveSearchVO rss);
	int selectReserveRkNoHistoryCount(StringIntVo siVo);
	List<ResManageVO> selectReserveKind(int rkNo);
	List<ResReserveVO> selectResNoCalendar(int resNo);
	List<ResReserveVO> selectRkNoCalendar(int rkNo);
	List<ResManageVO> selectResManageAll();
	
	//내 자원 이용현황
	List<ResReserveVO> selectMyFutureReserve(ResReserveSearchVO rss);
	List<ResReserveVO> selectMyPastReserve(ResReserveSearchVO rss);
	List<ResReserveVO> selectMyAllReserve(ResReserveSearchVO rss);
	int selectMyAllReserveCount(StringIntVo siVo);
	int selectMyFutureReserveCount(StringIntVo siVo);
	ResReserveVO selectReserveCantReason(int rvNo);
	
	//자원 설정
	int insertResKind(String rkKind);
}
