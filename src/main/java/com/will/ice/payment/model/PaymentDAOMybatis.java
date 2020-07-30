package com.will.ice.payment.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.will.ice.document.model.DocumentviewVO;

@Repository
public class PaymentDAOMybatis implements PaymentDAO{
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	private String namespace="com.mybatis.mapper.oracle.payment.";

	@Override
	public int insertPaydoc(PaylinedocVO pldVo) {
		return sqlSession.insert(namespace+"insertPaydoc",pldVo);
	}

	@Override
	public List<PaymentviewVO> selectAll() {
		return sqlSession.selectList(namespace+"selectAll");
	}

	@Override
	public int insertPayline(PaylinedocVO pldVo) {
		return sqlSession.update(namespace+"insertPayline",pldVo);
	}

	@Override
	public PaymentviewVO selectDocument(int docNo) {
		return sqlSession.selectOne(namespace+"selectDocument",docNo);
	}

	@Override
	public List<DocumentviewVO> selectPayLine(int docNo) {
		return sqlSession.selectList(namespace+"selectPayLine",docNo);
	}



}
