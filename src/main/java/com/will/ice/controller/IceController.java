package com.will.ice.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.will.ice.board.model.BoardService;
import com.will.ice.board.model.BoardVO;
import com.will.ice.common.PaymentSearchVO;
import com.will.ice.common.SearchVO;
import com.will.ice.companyCard.model.ComcardService;
import com.will.ice.document.model.DoctypeService;

import com.will.ice.notice.model.NoticeService;
import com.will.ice.notice.model.NoticeVO;

import com.will.ice.document.model.DoctypeVO;
import com.will.ice.member.model.MemberService;
import com.will.ice.member.model.MemberVO;
import com.will.ice.message.model.MessageService;
import com.will.ice.message.model.MessageVO;

import com.will.ice.payment.model.PaylistViewVO;
import com.will.ice.payment.model.PaymentService;

@Controller
public class IceController {
	private static final Logger logger = LoggerFactory.getLogger(IceController.class);
	
	@Autowired PaymentService paymentService;
	@Autowired DoctypeService doctypeService;

	@Autowired NoticeService notiService;
	@Autowired BoardService boardService;

	@Autowired MessageService msgService;
	@Autowired MemberService memService;
	
	@Autowired ComcardService comcardService;
	
	
	@RequestMapping("/main/main_admin.do")
	public void main_admin(Model model) {
		logger.info("관리자 메인 페이지 보여주기");
		
		//메인 공지사항
		List<NoticeVO> notiList = notiService.selectMain();
		logger.info("공지사항 목록 조회 결과={}",notiList.size());
		
		//사내게시판
		List<BoardVO> boardList = boardService.selectMain();
		logger.info("사내게시판 목록 조회 결과={}",boardList.size());
				
		model.addAttribute("notiList",notiList);
		model.addAttribute("boardList",boardList);
	}
	
	@RequestMapping("/main/main_account.do")
	public void account() {
		logger.info("경리메인 페이지 보여주기");
	}
	
	@RequestMapping("/main/main_user.do")
	public void main_user(HttpSession session, Model model) {
		logger.info("사원 메인 페이지 보여주기");
		String identNum = (String)session.getAttribute("identNum");
		
		//메인 공지사항
		List<NoticeVO> notiList = notiService.selectMain();
		logger.info("공지사항 목록 조회 결과={}",notiList.size());
		
		//미결함
		PaymentSearchVO paysearchVo = new PaymentSearchVO();
		paysearchVo.setIdentNum(identNum);
		paysearchVo.setProgress("reject");
		
		List<Integer> docNolist = paymentService.docNolist();
		
		List<PaylistViewVO> paylist = paymentService.selectUndecided2(paysearchVo,docNolist);
		logger.info("미결함 목록 조회 결과={}",paylist.size());
		
		//사내게시판
		List<BoardVO> boardList = boardService.selectMain();
		logger.info("사내게시판 목록 조회 결과={}",boardList.size());
		
		model.addAttribute("paylist",paylist);
		model.addAttribute("notiList",notiList);
		model.addAttribute("boardList",boardList);
	}
	
	@RequestMapping("/main/main_manager.do")
	public void main_manager() {
		logger.info("과장 이상 메인 페이지 보여주기");
	}
	
	@RequestMapping("/log/login.do")
	public void login_Get() {
		logger.info("로그인 페이지 보여주기");
	}
	
	@RequestMapping("/inc/top.do")
	public void top(HttpSession session, Model model) {
		logger.info("top 메신저 보여주기");
		String identNum = (String)session.getAttribute("identNum");
		
		int msgCount = msgService.selectUnRead(identNum);
		logger.info("msgCount={}",msgCount);
		
		MessageVO msgVO = new MessageVO();
		msgVO.setRecMemNo(identNum);
		List<MessageVO> msgList = msgService.msgRecListOnlyN(msgVO);
		
		MemberVO senderImgMemVO = new MemberVO();
		for(int i=0; i<msgList.size(); i++) {
			MessageVO senderImgVO = msgList.get(i);
						
			senderImgMemVO = memService.selectMember(senderImgVO.getSendMemNo());
		}
		
				
		model.addAttribute("senderImgMemVO", senderImgMemVO);
		model.addAttribute("msgCount", msgCount);
		model.addAttribute("msgList", msgList);
		
	}
}
