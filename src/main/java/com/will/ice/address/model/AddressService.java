package com.will.ice.address.model;

import java.util.List;

import com.will.ice.member.model.MemberVO;
import com.will.ice.model.DepartmentVO;

public interface AddressService {
	List<AddressVO> selectAddress(AddressSearchVO searchVo);
	List<AddressVO> selectAddress2(AddressSearchVO adSearchVo);
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
	
	//쪽지 쓰기용
	List<AddressVO> selectListMsgAddr_memNo_adgNo(AddressVO advo);
	

}
