package com.will.ice.resource.model;

import java.util.List;

public interface ResourceDAO {
	List<ResManageVO> selectResManage();
	List<LocationVO> selectLocation();
	int insertResManage(ResManageVO rmVo);
}
