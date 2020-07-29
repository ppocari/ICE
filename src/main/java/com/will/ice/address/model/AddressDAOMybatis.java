package com.will.ice.address.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.will.ice.member.model.MemberVO;
import com.will.ice.model.DepartmentVO;

@Repository
public class AddressDAOMybatis implements AddressDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	private String namespaces="com.mybatis.mapper.oracle.address.";


	@Override
	public List<AddressVO> selectAddress(String memNo) {
		return sqlSession.selectList(namespaces+"selectAddress", memNo);
	}

	@Override
	public List<MemberVO> selectMemDeptPosForOrgan() {
		return sqlSession.selectList(namespaces+"selectMemDeptPosForOrgan");
	}


	@Override
	public List<DepartmentVO> selectDepartment() {
		return sqlSession.selectList(namespaces+"selectDepartment");
	}
	
	

}
