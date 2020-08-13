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
}
