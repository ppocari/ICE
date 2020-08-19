
package com.will.ice.boardComment.controller;

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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.will.ice.board.controller.BoardController; 
import com.will.ice.boardComment.model.BoardCommentService;
import com.will.ice.boardComment.model.BoardCommentVO;
import com.will.ice.noticeComment.model.NoticeCommentVO;
import com.will.ice.noticeComment.model.NoticeCommentViewVO;

@Controller
@RequestMapping("boardComment") 
public class BoardCommentController {

	private static final Logger logger =
			LoggerFactory.getLogger(BoardController.class);

	@Autowired 
	private BoardCommentService boardCommentService;

	@RequestMapping(value="/boardCommentWrite.do", method = RequestMethod.POST) 
	public String boardCommentWrite_post(@ModelAttribute BoardCommentVO vo,
			HttpSession session, Model model){
		String memNo = (String) session.getAttribute("identNum");
		vo.setMemNo(memNo);
		
		logger.info("memNo={}, boardNo={}",memNo, vo.getBoardNo() );
		
		int cnt=boardCommentService.commentInsert(vo);
		String msg="댓글 입력 실패", 
				url="/board/boardDetail.do?boardNo="+vo.getBoardNo();
		if(cnt>0) {
			msg="댓글을 입력하였습니다.";
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);

		return "common/message";
	
	} 
	
	@RequestMapping(value="/boardCommentEdit.do",method = RequestMethod.POST)
	public String boardCommentEdit_post(@ModelAttribute BoardCommentVO vo,
			HttpSession session, Model model) {
		
		logger.info("사내게시판댓글 수정, BoardCommentVO={}", vo);
		
		String msg="댓글 수정 실패", 
			url="/board/boardDetail.do?boardNo="+vo.getBoardNo();
		int cnt=boardCommentService.commentUpdate(vo);
		if(cnt>0) {
			msg="댓글 수정 처리되었습니다";
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
	}
	
	@RequestMapping(value="boardCommentDelete.do", method = RequestMethod.POST)
	public String boardCommentDelete_post(@RequestParam(defaultValue = "0") int no,
			@RequestParam(defaultValue = "0") int boardNo,
			@ModelAttribute BoardCommentVO vo, 
			HttpSession session, Model model) {
		logger.info("삭제처리 파라미터 No={}", no );
		
		vo.setBoardNo(boardNo);
		int BNo = vo.getBoardNo();
		
		logger.info("댓글 삭제할 페이지의 숫자 NNo={}", BNo );
		
		String msg="삭제 실패했습니다",
				url="/board/boardDetail.do?boardNo="+vo.getBoardNo();		
		int cnt=boardCommentService.commentDelete(no);
		if(cnt>0) {
			msg="삭제되었습니다.";
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
	}
}

