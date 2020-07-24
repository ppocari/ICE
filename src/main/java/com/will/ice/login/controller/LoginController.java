package com.will.ice.login.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/log")
public class LoginController {
	private static final Logger logger 
		= LoggerFactory.getLogger(LoginController.class);
	
	@RequestMapping(value="/login.do", method = RequestMethod.GET)
	public void login_get() {		
		logger.info("로그인 페이지");
		
	}
	
	@RequestMapping(value="/login.do", method = RequestMethod.POST)
	public void login_post() {		
		logger.info("로그인  처리");
		

		String msg="로그인 처리 실패",url="/log/login.do";
		if(result==MemberService.LOGIN_OK) {
			//상세정보 조회
			MemberVO_log memVo=memService.selectMember(identNum);
			logger.info("회원정보 조회 결과vo={}", memVo);
			
			//session에 저장
			HttpSession session=request.getSession();
			session.setAttribute("identNum", identNum);
			session.setAttribute("posCode", memVo.getPosCode());
			session.setAttribute("userName", memVo.getName());
			
			//쿠키에 저장
			if(rememCheck!=null) {  //아이디 저장에 체크한 경우
				Cookie ck = new Cookie("ck_identNum", identNum);
				ck.setMaxAge(100*24*60*60); //100일
				ck.setPath("/");
				response.addCookie(ck);
			}else {
				Cookie ck = new Cookie("ck_identNum", identNum);
				ck.setMaxAge(0); //기존 쿠키 삭제
				ck.setPath("/");
				response.addCookie(ck);
			}
			
			msg=  memVo.getName()+" "+memVo.getPosName() + "님 로그인되었습니다.";
			if(memVo.getPosCode().equals("999")) {	//관리자
				url = "/main/main_admin.do";
				
			}else if(memVo.getPosCode().equals("910")){	//사원
				url = "/main/main_user.do";
			}else if(memVo.getPosCode().equals("920")){ //경리
				url = "/main/main_account.do";
			}else if(Integer.parseInt(memVo.getPosCode()) > 940){	//과장 이상
				url = "/main/main_manager.do";
			}
			
		}else if(result==MemberService.PWD_DISAGREE){
			msg="비밀번호가 일치하지 않습니다.";			
		}else if(result==MemberService.ID_NONE) {
			msg="해당 아이디가 존재하지 않습니다.";			
		}

		
	}
}
