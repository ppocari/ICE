package com.will.ice.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class IceController {
	private static final Logger logger = LoggerFactory.getLogger(IceController.class);
	
	@RequestMapping("/main.do")
	public void main() {
		logger.info("메인 페이지 보여주기");
	}
	
	@RequestMapping("/log/login.do")
	public void login_Get() {
		logger.info("로그인 페이지 보여주기");
	}
}
