package com.will.ice.payline.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.will.ice.member.model.MemberService;
import com.will.ice.payment.model.PaylinedocVO;
import com.will.ice.payment.model.PaymentService;

@Controller
@RequestMapping("/payment")
public class PaylineController {
	private static final Logger logger = LoggerFactory.getLogger(PaylineController.class);
	
	@Autowired
	MemberService memService;
	@Autowired
	PaymentService paymentService;
	
	@RequestMapping(value="/write/selectPayLine.do",method=RequestMethod.POST)
	public String selectAllMember_post(@ModelAttribute PaylinedocVO pldVo,
			Model model) {
		logger.info("결재문서 내용 , pldVo={}",pldVo);
		logger.info("결재 받을 사원번호 , getmemNo={}",pldVo.getGetmemNo());
		
		String[] memList = pldVo.getGetmemNo().split(",");
		
		int cnt = paymentService.insertPaymentM(memList, pldVo);
		
		String msg="결재선 등록 실패!",url="/payment/close.do";
		if(cnt>0) {
			msg="기안이 작성되었습니다!";
		}
		
		model.addAttribute("msg",msg);
		model.addAttribute("url",url);
		
		return "common/message";
	}
}
