package com.will.ice.address.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.interceptor.TransactionAspectSupport;

import com.will.ice.member.model.MemberVO;
import com.will.ice.model.DepartmentVO;

@Service
public class AddressServiceImpl implements AddressService{

	@Autowired
	private AddressDAO dao;

	@Override
	public List<AddressVO> selectAddress(AddressSearchVO searchVo) {
		return dao.selectAddress(searchVo);
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
	public List<AddressGroupVO> selectAddressGroup() {
		return dao.selectAddressGroup();
	}

	@Override
	public int insertAddress(AddressVO vo) {

		return dao.insertAddress(vo);
	}

	@Override
	public AddressVO selectOneAdderss(int adNo) {
		return dao.selectOneAdderss(adNo);
	}


	@Override
	public int updateAddress(AddressVO adVo) {
		return dao.updateAddress(adVo);
	}
	
	@Override
	@Transactional
	public int deleteMulti(List<AddressVO> list) {
		int cnt=0;
		try {
			for(AddressVO vo : list) {
				if(vo.getAdNo()!=0) { //체크한 주소만 삭제
					cnt=dao.deleteAddress(vo.getAdNo());
				}
			}
		}catch(RuntimeException e) {
			cnt=-1;
			e.printStackTrace();
			TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
		}

		return cnt;
	}
	
	@Override
	@Transactional
	public int updateTrashMulti(List<AddressVO> list) {
		int cnt=0;
		try {
			for(AddressVO vo : list) {
				if(vo.getAdNo()!=0) { //체크한 주소만 휴지통으로 이동!
					cnt=dao.updateTrashAddress(vo.getAdNo());
				}
			}
		}catch(RuntimeException e) {
			cnt=-1;
			e.printStackTrace();
			TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
		}
		
		return cnt;
	}

	@Override
	@Transactional
	public int updateBackMulti(List<AddressVO> list) {
		int cnt=0;
		try {
			for(AddressVO vo : list) {
				if(vo.getAdNo()!=0) { //체크한 주소만 Main으로 Back!
					cnt=dao.updateBackAddress(vo.getAdNo());
				}
			}
		}catch(RuntimeException e) {
			cnt=-1;
			e.printStackTrace();
			TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
		}
		
		return cnt;
	}

	@Override
	public int updateIsFavorite(int adNo) {
		return dao.updateIsFavorite(adNo);
	}
	
	@Override
	public int updateNotFavorite(int adNo) {
		return dao.updateNotFavorite(adNo);
	}

	@Override
	public int selectTotalRecord(AddressSearchVO searchVo) {
		return dao.getTotalRecord(searchVo);
	}


}
