package com.will.ice.resource.model;

import java.util.List;

public interface ResourceService {

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
	
}
