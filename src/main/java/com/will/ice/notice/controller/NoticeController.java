package com.will.ice.notice.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.will.ice.notice.model.NoticeService;
import com.will.ice.notice.model.NoticeVO;

@Controller
@RequestMapping("/notice")
public class NoticeController {

	private static final Logger logger 
		= LoggerFactory.getLogger(NoticeController.class);
	
	@Autowired private NoticeService noticeService;
	
	@RequestMapping("/notice.do")
	public void notice() {
		logger.info("공지사항 실행");
		
	}
	
	@RequestMapping(value="/noticeWrite.do", method = RequestMethod.GET)
	public String noticeWrite_get() {
		logger.info("공지사항 글쓰기 화면 실행");
		
		return "notice/noticeWrite";
	}
	
	@RequestMapping(value="/noticeWrite.do", method = RequestMethod.POST)
	public String noticeWrite_post(@ModelAttribute NoticeVO noticeVo,
			Model model) {
		logger.info("공지사항 등록, 파라미터 vo={}", noticeVo);
		
		int cnt=noticeService.insertNotice(noticeVo);
		logger.info("공지사항 등록 결과, cnt={}", cnt);
		
		String msg="공지사항 등록 실패", url="/notice/noticeWrite.do";
		if(cnt>0) {
			msg="공지사항 등록되었습니다.";
			url="notice/notice.do";
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
	}
	
}
