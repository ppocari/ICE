package com.will.ice.payment.model;

import java.sql.Timestamp;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class PaymentDAOMybatis implements PaymentDAO{
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	private String namespace="com.mybatis.mapper.oracle.payment.";

	@Override
	public int insertPaydoc(PaymentVO paymentVo) {
		return sqlSession.insert(namespace+"insertPaydoc",paymentVo);
	}

	@Override
	public Timestamp calcKeeping(int keep) {
		return sqlSession.selectOne(namespace+"calcKeeping",keep);
	}
}
