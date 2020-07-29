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
<<<<<<< HEAD
	public int admin_regist_member(MemberVO membervo ) {
		int cnt = 0;
		try {
			
				cnt = memberDao.admin_regist_member(membervo);
			
		}catch (RuntimeException e) {
			cnt = -1;
			e.printStackTrace();
			throw e;
		}
		
		return cnt;
=======
	public int registerMulti(MemberVO memberVO) {
		return memberDao.registerMulti(memberVO);
>>>>>>> parent of d253f43... sisi
	}


	@Override
	public List<MemberVO> searchAllmember(String searchKeyword) {
		return memberDao.searchAllmember(searchKeyword);
	}

<<<<<<< HEAD
=======
	

>>>>>>> parent of d253f43... sisi
	
	
	
	
	
}
