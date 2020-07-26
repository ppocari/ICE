package com.will.ice.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class EtcMybatis implements EtcDAO{
	private String namespace = "com.mybatis.mapper.oracle.etc.";
	
	@Autowired
	private SqlSession sqlsession;

	@Override
	public List<DepartmentVO> DeptAll() {
		return sqlsession.selectList(namespace+"DeptAll");
	}

	@Override
	public List<PositionVO> PosAll() {
		return sqlsession.selectList(namespace+"PosAll");
	}

}
