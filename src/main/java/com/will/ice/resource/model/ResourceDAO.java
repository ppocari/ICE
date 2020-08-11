package com.will.ice.resource.model;

import java.util.List;

public interface ResourceDAO {
	List<ResManageVO> selectResManage(ResManageSearchVO rmsVo);
	int insertResManage(ResManageVO rmVo);
	ResManageVO selectResManageOne(int resNo);
	int updateResource(ResManageVO rmVo);
	int deleteResManage(int resNo);
	int selectTotalRecord(); 
}
