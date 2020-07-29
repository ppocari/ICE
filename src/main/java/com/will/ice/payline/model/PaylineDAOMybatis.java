package com.will.ice.payline.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.will.ice.member.model.MemberVO;

@Repository
public class PaylineDAOMybatis implements PaylineDAO{
	@Autowired 
	private SqlSessionTemplate sqlSession;
	
	private String namespace="com.mybatis.mapper.oracle.paymentline.";

	@Override
	public List<MemberVO> selectAllMem(int poscode) {
		return sqlSession.selectList(namespace+"selectAllMem",poscode);
	}

	
}
