package com.will.ice.mypage.model;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MypageServiceImpl implements MypageService{
	@Autowired MypageDAO mypagedao;

	@Override
	public MypageVO selectEmployee(String memNo) {
		return mypagedao.selectEmployee(memNo);
	}

	@Override
	public int updateEmployee(MypageVO mypageVO) {
		return mypagedao.updateEmployee(mypageVO);
	}
	
}
