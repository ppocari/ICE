package com.will.ice.address.model;

import java.util.List;

import com.will.ice.member.model.MemberVO;
import com.will.ice.model.DepartmentVO;

public interface AddressService {
	List<AddressVO> selectAddress(AddressSearchVO searchVo);
	int selectTotalRecord(AddressSearchVO searchVo);
	
	public List<MemberVO> selectMemDeptPosForOrgan();
	List<DepartmentVO> selectDepartment();
	int insertAddress(AddressVO vo);
	List<AddressGroupVO> selectAddressGroup();
	AddressVO selectOneAdderss(int adNo);

	int updateAddress(AddressVO adVo);
	
	int deleteMulti(List<AddressVO> list);
	int updateTrashMulti(List<AddressVO> list);
	int updateBackMulti(List<AddressVO> list);
	int updateIsFavorite(int adNo);
	int updateNotFavorite(int adNo);
	
	

}
