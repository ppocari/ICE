package com.will.ice.board.controller;


import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.swing.text.html.FormSubmitEvent.MethodType;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.will.ice.board.model.BoardService;
import com.will.ice.board.model.BoardVO;
import com.will.ice.common.PaginationInfo;
import com.will.ice.common.SearchVO;
import com.will.ice.common.Utility;
import com.will.ice.member.model.MemberService;
import com.will.ice.member.model.MemberVO;

@Controller
@RequestMapping("/board")
public class BoardController {

	private static final Logger logger
	= LoggerFactory.getLogger(BoardController.class);

	@Autowired private BoardService boardService;

	@Autowired private MemberService memberService;

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

	@RequestMapping("boardDetail.do")
	public String boardDetail(@RequestParam(defaultValue = "0") int boardNo,
			HttpServletRequest request, Model model) {
		//1.
		logger.info("상세보기, 파라미터 no={}", boardNo);
		if(boardNo==0) {
			model.addAttribute("msg", "잘못된 url입니다.");
			model.addAttribute("url", "/board/boardList.do");

			return "common/message";
		}

		//2.
		BoardVO vo = boardService.selectByNo(boardNo);
		logger.info("상세보기 조회 결과, vo={}", vo);

		model.addAttribute("vo", vo);

		return "board/boardDetail";
	}

	@RequestMapping(value="boardDelete.do", method = RequestMethod.GET)
	public String boardDelete_get(@RequestParam(defaultValue = "0") int boardNo,
			Model model) {
		logger.info("삭제 화면 파라미터 no={}", boardNo);
		if(boardNo==0) {
			model.addAttribute("msg", "잘못된 url입니다.");
			model.addAttribute("url", "/board/boardList.do");

			return "common/message";
		}

		return "board/boardDelete";
	}

	@RequestMapping(value="boardDelete.do", method=RequestMethod.POST)
	public String boardDelete_post(@RequestParam(defaultValue = "0") String boardNo,
			@RequestParam String pwd ,HttpSession session, Model model) {
		logger.info("삭제처리 파라미터 boardNo={}, pwd={}", boardNo,pwd);

		String memNo= (String) session.getAttribute("identNum");
		MemberVO memVo= memberService.selectMember(memNo);

		String dbPwd = memVo.getPwd();

		String msg="삭제 실패", url="/board/boardDetail.do?boardNo="+boardNo;

		if(dbPwd.equals(pwd)) {
			boardService.deleteBoard(Integer.parseInt( boardNo));
			msg="삭제되었습니다.";
			url="/board/boardClose.do";
		}else {
			msg="비밀번호가 틀렸습니다.";
		}

		model.addAttribute("msg", msg);
		model.addAttribute("url", url);

		return "common/message";
	}

	@RequestMapping("/boardClose.do")
	public void boardClose() {
		logger.info("사내게시판 삭제완료");   
	}

	@RequestMapping(value="boardEdit.do", method = RequestMethod.GET)
	public String boardEdit_get(@RequestParam(defaultValue = "0") int boardNo,
			HttpServletRequest request, Model model) {
		//1
		logger.info("수정화면 ,파리미터 no={}", boardNo);

		if(boardNo==0) {
			model.addAttribute("msg", "잘못된 url입니다.");
			model.addAttribute("url", "/board/boardList.do");

			return "common/message";
		}

		BoardVO vo=boardService.selectByNo(boardNo);
		logger.info("수정화면 조회 결과 vo={}", vo);

		model.addAttribute("vo", vo);

		return "board/boardEdit";

	}

	@RequestMapping(value="boardEdit.do", method = RequestMethod.POST)
	public String boardEdit_post(@ModelAttribute BoardVO boardVo,
			HttpServletRequest request, Model model, HttpSession session) {
		logger.info("수정 처리 파라미터 vo={}", boardVo);

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

		String msg="글수정 실패", url="/board/boardEdit.do?boardNo="+boardVo.getBoardNo();
		int cnt=boardService.updateBoard(boardVo);
		if(cnt>0) {
			msg="글 수정 처리되었습니다";
			url="/board/boardDetail.do?boardNo="+boardVo.getBoardNo();
		}

		model.addAttribute("msg", msg);
		model.addAttribute("url", url);

		return "common/message";
	}
}
