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
	
	public MemberVO selectMember(String memNo){
		return memberDao.selectMember(memNo);
	}
	
	@Override
	public int registerMulti(MemberVO memberVO) {
		return memberDao.registerMulti(memberVO);

	}

	@Override
	public List<MemberVO> searchAllmember(String searchKeyword) {
		return memberDao.searchAllmember(searchKeyword);
	}

	
	
	
	
}
