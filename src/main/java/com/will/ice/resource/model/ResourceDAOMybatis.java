package com.will.ice.resource.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ResourceDAOMybatis implements ResourceDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	private String namespace="com.mybatis.mapper.oracle.resource.";

	@Override
	public List<ResManageVO> selectResManage() {
		return sqlSession.selectList(namespace+"selectResManage");
	}

	@Override
	public List<LocationVO> selectLocation() {
		return sqlSession.selectList(namespace+"selectLocation");
	}

	@Override
	public int insertResManage(ResManageVO rmVo) {
		return sqlSession.insert(namespace+"insertResManage", rmVo);
	}
	
}
