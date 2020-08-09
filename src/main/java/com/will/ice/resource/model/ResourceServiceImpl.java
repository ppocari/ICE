package com.will.ice.resource.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ResourceServiceImpl implements ResourceService {

	@Autowired
	private ResourceDAO dao;
	
	@Override
	public List<ResManageVO> selectResManage() {
		return dao.selectResManage();
	}

	@Override
	public int insertResManage(ResManageVO rmVo) {
		return dao.insertResManage(rmVo);
	}
	
}
