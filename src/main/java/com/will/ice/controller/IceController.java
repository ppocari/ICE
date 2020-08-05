package com.will.ice.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class IceController {
	private static final Logger logger = LoggerFactory.getLogger(IceController.class);
	
	
	
	@RequestMapping("/main/main_admin.do")
	public void main_admin() {
		logger.info("관리자 메인 페이지 보여주기");
	}
	
	@RequestMapping("/main/main_account.do")
	public void account() {
		logger.info("경리메인 페이지 보여주기");
	}
	
	@RequestMapping("/main/main_user.do")
	public void main_user() {
		logger.info("사원 메인 페이지 보여주기");
	}
	
	@RequestMapping("/main/main_manager.do")
	public void main_manager() {
		logger.info("과장 이상 메인 페이지 보여주기");
	}
	
	@RequestMapping("/main/main_restaurant.do")
	public void main_restaurant() {
		logger.info("발권소 전용 페이지 보여주기");
	}
	
	@RequestMapping("/log/login.do")
	public void login_Get() {
		logger.info("로그인 페이지 보여주기");
	}
}
