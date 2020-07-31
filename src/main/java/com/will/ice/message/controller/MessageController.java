package com.will.ice.message.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;


@Controller
@RequestMapping("/message")
public class MessageController {

	private static final Logger logger 
		= LoggerFactory.getLogger(MessageController.class);
	
	
	@RequestMapping("/messageWrite.do")
	public void messageWrite() {
		logger.info("쪽지보내기 실행");
	}
	
	
	@RequestMapping("/messageContact.do")
	public void messageContact(@RequestParam String memNo) {
		logger.info("연락처 실행");
		
		
	}
	
	@RequestMapping("/messageList.do")
	public void messageList() {
		logger.info("쪽지함 실행");
	}
	
	
}
