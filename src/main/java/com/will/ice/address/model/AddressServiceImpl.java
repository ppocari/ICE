package com.will.ice.address.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.will.ice.member.model.MemberVO;
import com.will.ice.model.DepartmentVO;

@Service
public class AddressServiceImpl implements AddressService{
	
	@Autowired
	private AddressDAO dao;

	@Override
	public List<AddressVO> selectAddress(String memNo) {
		return dao.selectAddress(memNo);
	}

	@Override
	public List<MemberVO> selectMemDeptPosForOrgan() {
		return dao.selectMemDeptPosForOrgan();
	}

	@Override
	public List<DepartmentVO> selectDepartment() {
		return dao.selectDepartment();
	}
	
}
