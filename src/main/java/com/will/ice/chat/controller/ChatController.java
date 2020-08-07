package com.will.ice.chat.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/chat")
public class ChatController {
	
	private Logger logger = LoggerFactory.getLogger(ChatController.class);
	
	@RequestMapping("/chat.do")
	public void chatMain() {
		
	}

	@RequestMapping("/chatDetail.do")
	public void chatDetail() {
		
	}

	@RequestMapping("/UI.do")
	public void UI() {
		
	}

	
	@RequestMapping(value = "/chatting", method = RequestMethod.GET)
	public void websocket() {
		logger.info("채팅 방 보여주기");
	}

}
