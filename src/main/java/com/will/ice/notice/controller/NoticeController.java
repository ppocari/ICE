package com.will.ice.notice.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.will.ice.common.PaginationInfo;
import com.will.ice.common.SearchVO;
import com.will.ice.common.Utility;
import com.will.ice.notice.model.NoticeService;
import com.will.ice.notice.model.NoticeVO;


@Controller
@RequestMapping("/notice")
public class NoticeController {

	private static final Logger logger 
		= LoggerFactory.getLogger(NoticeController.class);
	
	@Autowired private NoticeService noticeService;
	
	@RequestMapping(value="/notice.do", method = RequestMethod.GET)
	public void notice_get() {
		logger.info("공지사항 화면");
	}
	
	@RequestMapping(value="/notice.do", method = RequestMethod.POST)
	public String notice_post(@ModelAttribute SearchVO searchVo, Model model, HttpServletRequest request) {
		
		HttpSession session =  request.getSession();
		
		String identNum = (String) session.getAttribute("identNum");
		
		//1
		logger.info("글 목록 파라미터 searchVo={}, identNum={}", searchVo, identNum);
		
		//[1] PaginationInfo 생성
		PaginationInfo pagingInfo = new PaginationInfo();
		pagingInfo.setBlockSize(Utility.BLOCKSIZE);
		pagingInfo.setRecordCountPerPage(Utility.RECORD_COUNT);
		pagingInfo.setCurrentPage(searchVo.getCurrentPage());
		
		//[2] SearchVo 에 값 셋팅
		searchVo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());
		searchVo.setRecordCountPerPage(Utility.RECORD_COUNT);
		
		//2
		List<NoticeVO> list=noticeService.selectAll(searchVo);
		logger.info("글목록 결과, list.size="+list.size());

		int totalRecord=noticeService.selectTotalRecord(searchVo);
		logger.info("글목록, 전체 레코드 개수 : " + totalRecord);
		
		pagingInfo.setTotalRecord(totalRecord);
		
		//3
		model.addAttribute("list", list);
		model.addAttribute("pagingInfo", pagingInfo);
		
		//4
		return "notice/notice";
	}
	
	@RequestMapping(value="/noticeWrite.do", method = RequestMethod.GET)
	public String noticeWrite_get() {
		logger.info("공지사항 글쓰기 화면 실행");
		
		return "notice/noticeWrite";
	}
	
	//관리자 받기
	@RequestMapping(value="/noticeWrite.do", method = RequestMethod.POST)
	public String noticeWrite_post(@ModelAttribute NoticeVO noticeVo,
			Model model, HttpServletRequest request) {
		
		HttpSession session =  request.getSession();
		
		String identNum = (String) session.getAttribute("identNum");
		
		logger.info("공지사항 등록, 파라미터 vo={}, identNum={}", noticeVo, identNum);
		
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
	
	@RequestMapping(value="/noticeList.do", method = RequestMethod.GET)
	public void noticeList_get() {
		logger.info("공지사항 목록");
		
	}
	
}
