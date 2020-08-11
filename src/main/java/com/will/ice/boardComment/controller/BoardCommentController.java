
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
		String msg="댓글 입력 실패", url="/board/boardList.do";
		if(cnt>0) {
			msg="댓글을 입력하였습니다.";
			url="/board/boardDetail.do?boardNo="/*${boardNo}*/;
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);

		return "common/message";
	
	} 
	
}

