package com.will.ice.resource.model;

import java.util.List;

public interface ResourceService {
	//자원관리
	List<ResManageVO> selectResManager(ResManageSearchVO rmsVo);
	int insertResManage(ResManageVO rmVo);
	
	List<ResKindVo> selectResKind();
	ResManageVO selectResManageOne(int resNo);
	int updateResource(ResManageVO rmVo);
	int deleteResManage(int resNo);
	int selectTotalRecord();
	
	//자원예약
	List<ResReserveVO> selectReserveResNo(int resNo);
	ResKindVo selectReserveKind(int rkNo);
	List<ResReserveVO> selectStartAvailableHour(ResReserveVO rsVo);
	ResReserveVO selectEndAvailableHour(ResReserveVO rsVo);
	int insertResReserve(ResReserveVO rsVo);
	
	//자원 예약 처리
	List<ResReserveVO> selectReserve(ResReserveSearchVO rss);
	int selectReserveCount();
	int updateConfirmReserve(ResKindVo rkVo);
	int updateNoReasonReserve(ResKindVo rkVo);
}
