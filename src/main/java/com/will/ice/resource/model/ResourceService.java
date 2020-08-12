package com.will.ice.resource.model;

import java.util.List;

public interface ResourceService {

	List<ResManageVO> selectResManager(ResManageSearchVO rmsVo);

	int insertResManage(ResManageVO rmVo);
	ResManageVO selectResManageOne(int resNo);
	int updateResource(ResManageVO rmVo);
	int deleteResManage(int resNo);
	int selectTotalRecord();
}
