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

import com.will.ice.common.PaymentSearchVO;
import com.will.ice.document.model.DoctypeService;
import com.will.ice.document.model.DoctypeVO;
import com.will.ice.payment.model.PaylistViewVO;
import com.will.ice.payment.model.PaymentService;

@Controller
public class IceController {
	private static final Logger logger = LoggerFactory.getLogger(IceController.class);
	
	@Autowired PaymentService paymentService;
	@Autowired DoctypeService doctypeService;
	
	@RequestMapping("/main/main_admin.do")
	public void main_admin() {
		logger.info("관리자 메인 페이지 보여주기");
	}
	
	@RequestMapping("/main/main_account.do")
	public void account() {
		logger.info("경리메인 페이지 보여주기");
	}
	
	@RequestMapping("/main/main_user.do")
	public void main_user(HttpSession session, @ModelAttribute PaymentSearchVO paysearchVo,
			Model model) {
		logger.info("사원 메인 페이지 보여주기");
		String identNum = (String)session.getAttribute("identNum");
		
		paysearchVo.setIdentNum(identNum);
		List<Integer> docNolist = paymentService.docNolist();
		logger.info("docNolist={}",docNolist);
		
		List<PaylistViewVO> list = paymentService.selectUndecided2(paysearchVo,docNolist);
		logger.info("미결함 목록 조회 결과={}",list.size());
		
		model.addAttribute("list",list);
	}
	
	@RequestMapping("/main/main_manager.do")
	public void main_manager() {
		logger.info("과장 이상 메인 페이지 보여주기");
	}
	
	@RequestMapping("/log/login.do")
	public void login_Get() {
		logger.info("로그인 페이지 보여주기");
	}
}
