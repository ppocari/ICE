package com.will.ice.board.controller;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("board")
public class BoardController {
	
	private static final Logger logger
		= LoggerFactory.getLogger(BoardController.class);
	
	@RequestMapping("/boardList.do")
	public void boardList() {
		logger.info("사내게시판 실행");
	}
	
	@RequestMapping("/boardWrite.do")
	public void boardWrite() {
		logger.info("사내게시판 글쓰기 실행");
	}
}
