package com.will.ice.payline.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.will.ice.member.model.MemberService;
import com.will.ice.payment.model.PaylinedocVO;
import com.will.ice.payment.model.PaymentService;
import com.will.ice.paymentfile.model.PaymentfileVO;

@Controller
@RequestMapping("/payment")
public class PaylineController {
	private static final Logger logger = LoggerFactory.getLogger(PaylineController.class);
	
	@Autowired
	MemberService memService;
	@Autowired
	PaymentService paymentService;
	
	@RequestMapping(value="/write/selectPayLine.do",method=RequestMethod.POST)
	public String selectPayLine(@ModelAttribute PaylinedocVO pldVo,Model model, 
			@ModelAttribute PaymentfileVO fileVo) {
		logger.info("결재문서 내용 , pldVo={}",pldVo);
		logger.info("결재 받을 사원번호 , getmemNo={}",pldVo.getGetmemNo());
		
		String[] memList = pldVo.getGetmemNo().split(",");
	
		int cnt = paymentService.insertPaymentM(memList, pldVo, fileVo);
		
		String msg="결재선 등록 실패!",url="/payment/write/sentpayList.do";
		if(cnt>0) {
			msg="기안이 작성되었습니다!";
		}
		model.addAttribute("msg",msg);
		model.addAttribute("url",url);
		
		return "common/message";
	}
	
	@RequestMapping(value="/write/updatePayLine.do",method=RequestMethod.POST)
	public String updatePayLine(@ModelAttribute PaylinedocVO pldVo,@RequestParam int docNo ,Model model, 
			@ModelAttribute PaymentfileVO fileVo,@RequestParam String oldfileName2) {
		pldVo.setDocNo(docNo);
		logger.info("결재문서 내용 , pldVo={}",pldVo);
		logger.info("결재 받을 사원번호 , getmemNo={}",pldVo.getGetmemNo());
		
		String[] memList = pldVo.getGetmemNo().split(",");
	
		int cnt = paymentService.updatePaydocM(memList, pldVo, fileVo, oldfileName2);
		
		String msg="결재선 등록 실패!",url="/payment/close.do";
		if(cnt>0) {
			msg="결재선이 등록 되었습니다!";
		}
		model.addAttribute("msg",msg);
		model.addAttribute("url",url);
		
		return "common/message";
	}
	
}
