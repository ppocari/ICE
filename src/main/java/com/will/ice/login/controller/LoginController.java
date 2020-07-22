package com.will.ice.login.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
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
	public void login_post(@ModelAttribute memberVO mvo) {		
		logger.info("로그인  처리");
		
		
		
	}
}
