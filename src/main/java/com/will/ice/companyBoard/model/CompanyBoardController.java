package com.will.ice.companyBoard.model;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("companyBoard")
public class CompanyBoardController {
	
	private static final Logger logger
		= LoggerFactory.getLogger(CompanyBoardController.class);
	
	@RequestMapping("/boardList.do")
	public void boardList() {
		logger.info("사내게시판 실행");
	}
}
