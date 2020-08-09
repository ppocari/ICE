package com.will.ice.resource.model;

import java.util.List;

public interface ResourceService {
	List<ResManageVO> selectResManage();
	int insertResManage(ResManageVO rmVo);
}
