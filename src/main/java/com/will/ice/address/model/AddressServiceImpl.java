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

	@Override
	public int insertAddress(AddressVO vo, String memNo) {

		/*
		 * int haveGroup=dao.selectCountAddressGroup(memNo);
		 * 
		 * List<AddressGroupVO> adgList=dao.selectAddressGroup(memNo);
		 * 
		 * System.out.println("adgList="+adgList.size());
		 * 
		 * 
		 * if(haveGroup>0) { System.out.println("주소록 그룹이 존재함!"); }else {
		 * System.out.println("주소록 그룹이 존재하지 않음!"); int
		 * createGroup=dao.insertDefaultAddressGroup(memNo); if(createGroup>0) {
		 * System.out.println("주소록 그룹이 생성 완료!"); } }
		 * 
		 * String groupName=vo.getGroupName();
		 * System.out.println("groupName="+groupName);
		 * 
		 * int adgNo=dao.selectAddressGroup(groupName);
		 * System.out.println("adgNo="+adgNo);
		 * 
		 * vo.setAdgNo(adgNo);
		 */

		return 2;
	}

	@Override
	public int selectCountAddressGroup(String memNo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<AddressGroupVO> selectGroupName(String memNo) {
		int haveGroup=dao.selectCountAddressGroup(memNo);
		if(haveGroup>0) {
			System.out.println("주소록 그룹이 존재함!");
		}else {
			System.out.println("주소록 그룹이 존재하지 않음!");
			int createDefaultAdg=dao.insertDefaultAddressGroup(memNo);
			if(createDefaultAdg>0) {
				System.out.println("주소록 그룹이 생성 완료!");
			}
		}
		
		return dao.selectAddressGroup(memNo);
	}

}
