package com.will.ice.resource.model;

import java.util.List;

public interface ResourceDAO {
	//자원관리
	List<ResManageVO> selectResManage(ResManageSearchVO rmsVo);
	int selectTotalRecord();
	
	List<ResKindVo> selectResKind();
	int insertResManage(ResManageVO rmVo);
	ResManageVO selectResManageOne(int resNo);
	int updateResource(ResManageVO rmVo);
	int deleteResManage(int resNo);

	//자원예약
	List<ResReserveVO> selectReserveResNo(int resNo);
	ResKindVo selectReserveKind(int rkNo);
	List<ResReserveVO> selectStartAvailableHour(ResReserveVO rsVo);
	ResReserveVO selectEndAvailableHour(ResReserveVO rsVo);
	int insertResReserve(ResReserveVO rsVo);
	
	//자원예약 처리
	List<ResReserveVO> selectReserve(ResReserveSearchVO rss);
	int selectReserveCount();
	int updateConfirmReserve(ResKindVo rkVo);
	int updateNoReasonReserve(ResKindVo rkVo);
}
