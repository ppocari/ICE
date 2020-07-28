package com.will.ice.workrecord.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class WorkRecordDAOMybatis implements WorkRecordDAO{
	@Autowired SqlSessionTemplate session;
	
	String namespace = "com.mybatis.mapper.oracle.workrecord.";
	
	@Override
	public int insertWork(WorkRecordVO vo) {
		return session.insert(namespace+"insertWork",vo);
	}

	@Override
	public List<WorkRecordVO> selectWork(String cmtNo) {
		return session.selectList(namespace+"selectWork",cmtNo);
	}
	
	
	
}
