package com.will.ice.resource.model;

import java.util.List;

public interface ResourceDAO {
	List<ResManageVO> selectResManage();
	int insertResManage(ResManageVO rmVo);
	ResManageVO selectResManageOne(int resNo);
	int updateResource(ResManageVO rmVo);
}
