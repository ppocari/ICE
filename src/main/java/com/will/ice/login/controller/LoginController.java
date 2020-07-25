package com.will.ice.login.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/inc")
public class LoginController {
	private static final Logger logger 
		= LoggerFactory.getLogger(LoginController.class);
	
	@RequestMapping(value="/login.do", method = RequestMethod.GET)
	public void login_get() {
		//과장이상, 사원, 경리 이용  관리자는 빠로 이동할 수 있는 버튼이 있음
		
		logger.info("되나?");
		
	}
}
