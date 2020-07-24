package com.will.common.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/common")
public class CommonController {
	
	Logger logger=LoggerFactory.getLogger(CommonController.class);
	
	@RequestMapping("/organization.do") 
	public void organization() {
		
		logger.info("조직도 보기");
	}
}
