package com.will.ice.member.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MemberServiceImpl implements MemberService{
	
	
	@Autowired
	private MemberDAO memberDao;

	@Override
	public int logCheck(String memNo, String pwd) {
		String dbPwd = memberDao.selectPwd(memNo);
		System.out.println("dbPwd" + dbPwd);
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
	
	public MemberVO_log selectMember(String memNo){
		return memberDao.selectMember(memNo);
	}

	@Override
	public int admin_regist_member(MemberVO memberVO) {
		return memberDao.admin_regist_member(memberVO);
	}

	@Override
	public List<MemberVO> searchAllmember(String searchKeyword) {
		return memberDao.searchAllmember(searchKeyword);
	}
	
	
	
	
}
