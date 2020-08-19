package com.will.ice.noticeComment.controller;

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

import com.will.ice.board.controller.BoardController;
import com.will.ice.member.model.MemberService;
import com.will.ice.member.model.MemberVO;
import com.will.ice.notice.controller.NoticeController;
import com.will.ice.noticeComment.model.NoticeCommentService;
import com.will.ice.noticeComment.model.NoticeCommentVO;
import com.will.ice.noticeComment.model.NoticeCommentViewVO;

@Controller
@RequestMapping("noticeComment")
public class NoticeCommentController {

	private static final Logger logger =
			LoggerFactory.getLogger(NoticeController.class);
	
	@Autowired
	private  NoticeCommentService noticeCommentService;
	
	@Autowired private MemberService memberService;
	
	@RequestMapping(value="/noticeCommentWrite.do", method = RequestMethod.POST)
	public String noticeCommentWrite_post(@ModelAttribute NoticeCommentVO vo,
			HttpSession session, Model model) {
		String memNo = (String) session.getAttribute("identNum");
		vo.setMemNo(memNo);
		
		logger.info("memNo={}", memNo);
		
		int cnt = noticeCommentService.commentInsert(vo);
		String msg="댓글 입력 실패", 
			url="/notice/noticeDetail.do?noticeNo="+vo.getNoticeNo();
		if(cnt>0) {
			msg="댓글을 입력하였습니다.";
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);

		return "common/message";
	}
	@RequestMapping(value="/noticeCommentEdit.do",method = RequestMethod.POST)
	public String noticeCommentEdit_post(@ModelAttribute NoticeCommentViewVO vo,
			HttpSession session, Model model) {
		
		logger.info("공지사항 댓글 수정, NoticeCommentViewVO={}", vo);
		
		String msg="댓글 수정 실패", 
			url="/notice/noticeDetail.do?noticeNo="+vo.getNoticeNo();
		int cnt=noticeCommentService.commentUpdate(vo);
		if(cnt>0) {
			msg="댓글 수정 처리되었습니다";
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
	}
	@RequestMapping(value="noticeCommentDelete.do", method = RequestMethod.POST)
	public String noticeCommentDelete_post(@RequestParam(defaultValue = "0") int no,
			@RequestParam(defaultValue = "0") int noticeNo,
			@ModelAttribute NoticeCommentViewVO vo, 
			HttpSession session, Model model) {
		logger.info("삭제처리 파라미터 No={}", no );
		
		vo.setNoticeNo(noticeNo);
		int NNo = vo.getNoticeNo();
		
		logger.info("댓글 삭제할 페이지의 숫자 NNo={}", NNo );
		
		
		String msg="삭제 실패했습니다", url="/notice/noticeDetail.do?noticeNo="+ NNo;
		
		int cnt=noticeCommentService.commentDelete(no);
		if(cnt>0) {
			msg="삭제되었습니다.";
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
	}
}
