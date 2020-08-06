package com.will.ice.email;

import javax.mail.MessagingException;
import javax.mail.internet.AddressException;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/email")
public class EmailController {
	private static final Logger logger
		=LoggerFactory.getLogger(EmailController.class);
		
	@Autowired private EmailSender emailSender;
	
	@RequestMapping("/emailTest.do")
	public void emailTest() {
		logger.info("emailTest 화면 보여주기");
	}
	
	@RequestMapping("/send.do")
	public String send() {
		logger.info("메일 발송 처리");
		
		String receiver="test1ice123@gmail.com";
		String sender="ice@naver.com";
		String subject="식권 구매 데이터";
		String content="식권 데이터";
		
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
		
		return "redirect:/email/email.do";
	}
	
	
}

