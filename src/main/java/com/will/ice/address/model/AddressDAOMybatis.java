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

	@Override
	public int insertAddress(AddressVO vo) {
		return sqlSession.insert(namespaces+"insertAddress", vo);
	}

	@Override
	public List<AddressGroupVO> selectAddressGroup(String memNo) {
		return sqlSession.selectList(namespaces+"selectAddressGroup", memNo);
	}

	@Override
	public int insertDefaultAddressGroup(String memNo) {
		return sqlSession.insert(namespaces+"insertDefaultAddressGroup", memNo);
	}

	@Override
	public int selectCountAddressGroup(String memNo) {
		return sqlSession.selectOne(namespaces+"selectCountAddressGroup", memNo);
	}

	@Override
	public AddressVO selectOneAdderss(int adNo) {
		return sqlSession.selectOne(namespaces+"selectOneAdderss", adNo);
	}
	
	

}
