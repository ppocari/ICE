package com.will.ice.companyCard.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/companyCard")
public class CompanyCardController {
	
	private static final Logger logger
		= LoggerFactory.getLogger(CompanyCardController.class);

	@RequestMapping("/comCardList.do")
	public void comCardList() {
		logger.info("법인카드 조회");
		
	}
	
	@RequestMapping("/comCardStatistic.do")
	public void comCardStatistic() {
		logger.info("법인카드 통계");
	}
	
	@RequestMapping("/comCardUpload.do")
	public void comCardUpload() {
		logger.info("법인카드 파일업로드");
	}
	
	@RequestMapping("/comCardUse.do")
	public void comCardUse() {
		logger.info("법인카드 미등록/등록");
	}
}
