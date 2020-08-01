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
	
	@RequestMapping(value="/noticeWrite.do", method = RequestMethod.GET)
	public String noticeWrite_get() {
		logger.info("공지사항 글쓰기 화면 실행");
		
		return "notice/noticeWrite";
	}
	
	//관리자 받기
	@RequestMapping(value="/noticeWrite.do", method = RequestMethod.POST)
	public String noticeWrite_post(@ModelAttribute NoticeVO noticeVo,
			Model model, HttpSession session) {
		
		String memNo = (String) session.getAttribute("identNum");
		
		noticeVo.setMEMNO(memNo);
		
		if(noticeVo.getNOTI_FILENAME()==null || noticeVo.getNOTI_ORFILENAME()==null
				|| noticeVo.getNOTI_FILENAME().isEmpty() || noticeVo.getNOTI_ORFILENAME().isEmpty()) {
			noticeVo.setNOTI_FILENAME("0"); 
			noticeVo.setNOTI_ORFILENAME("0");
		}
		
		logger.info("공지사항 등록, 파라미터 vo={}, identNum={}", noticeVo, memNo);
		
		int cnt=noticeService.insertNotice(noticeVo);
		logger.info("공지사항 등록 결과, cnt={}", cnt);
		
		String msg="공지사항 등록 실패", url="/notice/noticeWrite.do";
		if(cnt>0) {
			msg="공지사항 등록되었습니다.";
			url="notice/noticeList.do";
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
	}
	
	
	@RequestMapping("/noticeList.do")
	public String noticeList(@ModelAttribute SearchVO searchVo, Model model) {
		logger.info("글 목록 파라미터 searchVo", searchVo);
		
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
		logger.info("글목록 결과, list.size=", list.size());
		
		
		int totalRecord=noticeService.selectTotalRecord(searchVo);
		logger.info("글목록, 전체 레코드 개수 : " , totalRecord);
		
		pagingInfo.setTotalRecord(totalRecord);
		
		//3
		model.addAttribute("list", list);
		model.addAttribute("pagingInfo", pagingInfo);
		
		return "/notice/noticeList";
	}
	
	
	/*
	 * @RequestMapping("/noticeList.do") public String noticeList(@ModelAttribute
	 * SearchVO searchVo, Model model) { logger.info("글 목록 파라미터 searchVo",
	 * searchVo);
	 * 
	 * //[1] PaginationInfo 생성 PaginationInfo pagingInfo = new PaginationInfo();
	 * pagingInfo.setBlockSize(Utility.BLOCKSIZE);
	 * pagingInfo.setRecordCountPerPage(Utility.RECORD_COUNT);
	 * pagingInfo.setCurrentPage(searchVo.getCurrentPage());
	 * 
	 * //[2] SearchVo 에 값 셋팅
	 * searchVo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());
	 * searchVo.setRecordCountPerPage(Utility.RECORD_COUNT);
	 * 
	 * //2 List<NoticeVO> list=noticeService.selectAll(searchVo);
	 * logger.info("글목록 결과, list.size="+list.size());
	 * 
	 * int totalRecord=noticeService.selectTotalRecord(searchVo);
	 * logger.info("글목록, 전체 레코드 개수 : " + totalRecord);
	 * 
	 * pagingInfo.setTotalRecord(totalRecord);
	 * 
	 * //3 model.addAttribute("list", list); model.addAttribute("pagingInfo",
	 * pagingInfo);
	 * 
	 * return "/notice/noticeList"; }
	 */
	
	@RequestMapping("/notice/noticeCountUpdate.do")
	public String noticeCountUpdate(@RequestParam(defaultValue = "0") int no,
			Model model) {
		//1
		logger.info("조회수 증가, 파라미터 no={}", no);
		if(no==0) {
			model.addAttribute("msg", "잘못된 url 입니다.");
			model.addAttribute("url", "/notice/noticeList.do");
			
			return "common/message";
		}
		
		//2
		int cnt=noticeService.updateReadCount(no);
		logger.info("조회수 증가 결과, cnt={}", cnt);
		
		
		//3		
		//4
		return "/notice/noticeList";/*"redirect:/reboard/detail.do?no="+no;*/
	}
}
