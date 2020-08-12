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
	public List<AddressGroupVO> selectAddressGroup() {
		return sqlSession.selectList(namespaces+"selectAddressGroup");
	}

	@Override
	public int selectCountAddressGroup(String memNo) {
		return sqlSession.selectOne(namespaces+"selectCountAddressGroup", memNo);
	}

	@Override
	public AddressVO selectOneAdderss(int adNo) {
		return sqlSession.selectOne(namespaces+"selectOneAdderss", adNo);
	}


	@Override
	public int updateAddress(AddressVO adVo) {
		return sqlSession.update(namespaces+"updateAddress", adVo);
	}

	@Override
	public int deleteAddress(int adNo) {
		return sqlSession.delete(namespaces+"deleteAddress", adNo);
	}

	@Override
	public int updateTrashAddress(int adNo) {
		return sqlSession.update(namespaces+"updateTrashAddress", adNo);
	}

	@Override
	public int updateBackAddress(int adNo) {
		return sqlSession.update(namespaces+"updateBackAddress", adNo);
	}

	@Override
	public int updateIsFavorite(int adNo) {
		return sqlSession.update(namespaces+"updateIsFavorite", adNo);
	}
	
	@Override
	public int updateNotFavorite(int adNo) {
		return sqlSession.update(namespaces+"updateNotFavorite", adNo);
	}
		

	@Override
	public List<AddressVO> selectAddress(AddressSearchVO searchVo) {
		return sqlSession.selectList(namespaces+"selectAddress", searchVo);
	}


	@Override
	public int getTotalRecord(AddressSearchVO searchVo) {
		return sqlSession.selectOne(namespaces+"getTotalRecord", searchVo);
	}

	
	
	
	

}
