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
	
	@RequestMapping("/comCard.do")
	public void companyCard() {
		logger.info("법인카드 페이지");
	}
}
