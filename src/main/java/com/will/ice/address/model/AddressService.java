package com.will.ice.address.model;

import java.util.List;

import com.will.ice.member.model.MemberVO;
import com.will.ice.model.DepartmentVO;

public interface AddressService {
	List<AddressVO> selectAddress(String memNo);
	public List<MemberVO> selectMemDeptPosForOrgan();
	List<DepartmentVO> selectDepartment();
	int insertAddress(AddressVO vo, String memNo);
	int selectCountAddressGroup(String memNo);
	List<AddressGroupVO> selectGroupName(String memNo);
}
