package com.will.ice.resource.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/resource")
public class ResourceController {
	
	private final Logger logger = LoggerFactory.getLogger(ResourceController.class);
	
	@RequestMapping("/addResource.do")
	public void addResource_get() {
		logger.info("자원관리 등록 화면");
	}

}
