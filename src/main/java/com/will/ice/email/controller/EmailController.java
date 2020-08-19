package com.will.ice.email.controller;

import javax.mail.MessagingException;
import javax.mail.internet.AddressException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.will.ice.email.model.EmailSender;
import com.will.ice.member.model.MemberService;
import com.will.ice.member.model.MemberVO;

@Controller
@RequestMapping("/log")
public class EmailController {

	private static final Logger logger = LoggerFactory.getLogger(EmailController.class);

	@Autowired
	private EmailSender emailSender;
	
	@Autowired
	private MemberService memberService;

	@RequestMapping(value="/findPwd.do", method = RequestMethod.GET)
	public void findPwd_get() {
		logger.info("비밀번호 찾기 화면 보여주기");
	}

	@RequestMapping(value="/findPwd.do", method = RequestMethod.POST)
	public String findPwd_post(@ModelAttribute MemberVO memVo,
			@RequestParam(defaultValue = "0") String memNo,
			@RequestParam(required = false) String email, Model model) {
		
		logger.info("메일 발송 처리");
		logger.info("사원번호 확인 ={}",memNo);
		logger.info("사원메일 확인 ={}",email);
		
		int result = memberService.idCheck(memNo); // nullpointer
		logger.info("아이디 체크 result={}",result);
		
		String msg="사원번호 조회 실패", url="/log/findPwd.do";
		if(result==MemberService.LOGIN_OK) {

			MemberVO vo = memberService.selectMember(memNo); // 주민번호로 앞자리로 초기화
			String pwd = vo.getSsn1(); 
			String name = vo.getName(); 
			vo.setPwd(pwd);
			
			int cnt = memberService.newPwd(vo);
			if(cnt > 0) {
				msg = "비밀번호 초기화 성공";
				url = "/log/login.do";
			}
			
			String subject = "Ice 비밀번호 재설정 번호";
			String content = name+ "사원님의 비밀번호는  주민등록번호 앞자리("+ pwd +")입니다. 감사합니다.";
			String receiver = email;
			String sender = "ice@gmail.com";
	
			try {
				emailSender.mailSend(subject, content, receiver, sender);
				logger.info("이메일 발송 성공!");
			} catch (AddressException e) {
				e.printStackTrace();
				logger.info("이메일 발송 실패!");
			} catch (MessagingException e) {
				e.printStackTrace();
				logger.info("이메일 발송 실패!");
			}
		}else {
			msg = "해당 사원번호가 없습니다.";
		}	
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
	
		return "common/message";
	}

}
