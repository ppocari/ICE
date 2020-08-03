package com.will.ice.companyBoard.controller;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("companyBoard")
public class CompanyBoardController {
	
	private static final Logger logger
		= LoggerFactory.getLogger(CompanyBoardController.class);
	
	@RequestMapping("/companyBoardList.do")
	public void companyBoardList() {
		logger.info("사내게시판 실행");
	}
	
	@RequestMapping("/companyBoardWrite.do")
	public void companyBoardWrite() {
		logger.info("사내게시판 글쓰기 실행");
	}
}
