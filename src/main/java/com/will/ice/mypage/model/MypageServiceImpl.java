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
	public int loginCheck(String memNo, String pwd) {
		String dbPwd = mypagedao.selectPwd(memNo);
		
		int result=0;
		if(dbPwd!=null && !dbPwd.isEmpty()) {
			if(dbPwd.equals(pwd)) {
				result=LOGIN_OK;
			}else {
				result=PWD_DISAGREE;
			}
		}else {
			result=ID_NONE;
		}
		
		return result;
	}
	
	@Override
	public int updateEmployee(MypageVO mypageVO) {
		return mypagedao.updateEmployee(mypageVO);
	}

	
}
