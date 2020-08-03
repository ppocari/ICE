package com.will.ice.board.controller;


import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.will.ice.board.model.BoardService;
import com.will.ice.board.model.BoardVO;
import com.will.ice.common.PaginationInfo;
import com.will.ice.common.SearchVO;
import com.will.ice.common.Utility;

@Controller
@RequestMapping("board")
public class BoardController {
	
	private static final Logger logger
		= LoggerFactory.getLogger(BoardController.class);
	
	@Autowired private BoardService boardService;
	
	@RequestMapping("/boardList.do")
	public String boardList(@ModelAttribute SearchVO searchVo, Model model,
			BoardVO boardVo) {
		logger.info("사내게시판 실행 ");
		logger.info("글 목록 파라미터 searchVo=",searchVo);
		
		//[1] paginationInfo 생성
		PaginationInfo pagingInfo = new PaginationInfo();
		pagingInfo.setBlockSize(Utility.BLOCKSIZE);
		pagingInfo.setRecordCountPerPage(Utility.RECORD_COUNT);
		pagingInfo.setCurrentPage(searchVo.getCurrentPage());
		
		//[2] SearchVo 에 값 셋팅
		searchVo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());
		searchVo.setRecordCountPerPage(Utility.RECORD_COUNT);
				
		
		
		List<BoardVO> list = boardService.selectAll(searchVo);
		logger.info("글 목록 결과, list.size=", list.size());
		
		int totalRecord=boardService.selectTotalRecord(searchVo);
		logger.info("글 목록, 전체 레코드 개수 : ", totalRecord);
		
		pagingInfo.setTotalRecord(totalRecord);
		
		model.addAttribute("list", list);
		model.addAttribute("pagingInfo", pagingInfo);
		
		return "board/boardList";
	}
	
	@RequestMapping(value="/boardWrite.do", method=RequestMethod.GET)
	public void boardWrite_get() {
		logger.info("사내게시판 글쓰기 실행");
	}
	
	@RequestMapping(value="/boardWrite.do", method = RequestMethod.POST)
	public String boardWrite_post(@ModelAttribute BoardVO boardVo,
			Model model, HttpSession session) {
		//맴버정보 받아오기
		String memNo = (String) session.getAttribute("identNum");
		
		boardVo.setMemNo(memNo);
		
		//이미지 없을떄 null값 넣기
		if(boardVo.getFilePath()==null || boardVo.getFilePath().isEmpty()) {
			boardVo.setFilePath("");
		}
		//메인여부 체크안할시 N
		if(boardVo.getIsMain()==null || boardVo.getFilePath().isEmpty()) {
			boardVo.setIsMain("N");
		}
		logger.info("사내게시판 등록, 파라미터 boardVo={}", boardVo, memNo);
		
		
		
		int cnt=boardService.insertBoard(boardVo);
		logger.info("사내게시판 등록 결과, cnt={}", cnt);
		
		String msg="사내게시판 등록 실패", url="/board/boardWrite.do";
		if(cnt>0) {
			msg="글 등록되었습니다.";
			url="/board/boardList.do";
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
	}
}
