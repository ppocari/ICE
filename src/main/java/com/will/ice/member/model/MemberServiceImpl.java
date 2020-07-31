package com.will.ice.member.model;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.will.ice.common.DateSearchVO;

@Service
public class MemberServiceImpl implements MemberService{
	private static final Logger logger
	 = LoggerFactory.getLogger(MemberServiceImpl.class);
	
	
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
	public int registerMulti(List<MemberVO> memList) {
		
		int cnt = 0;
		
		for( int i = 0; i<memList.size(); i++) {
			MemberVO memvo = memList.get(i);
			if(memvo.getMemNo() == null) {
				cnt = 0;
			}else {
				cnt = memberDao.registerMulti(memvo);
			}
			logger.info("i={}, cnt ={}", i, cnt);
		}
		
		return cnt;
	}


	@Override
	public List<MemberVO> searchAllmember(String searchKeyword) {
		return memberDao.searchAllmember(searchKeyword);
	}

	@Override
	public List<MemberVO> selectMemberList(DateSearchVO dateSearchVo) {
		return memberDao.selectMemberList(dateSearchVo);
	}

	@Override
	public int updateSelectMember(MemberVO memberVO) {
		return memberDao.updateSelectMember(memberVO);
	}

	@Override
	public int deleteSelectMember(MemberVO memberVO) {
		return memberDao.deleteSelectMember(memberVO);
	}

	

	

	
	
	
	
	
}
