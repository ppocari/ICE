package com.will.ice.payment.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/payment")
public class PaymentController {

private static final Logger logger = LoggerFactory.getLogger(PaymentController.class); 
	
	@RequestMapping("/writePay.do")
	public void writePayment_post(@RequestParam String docType) {
		logger.info("서류 작성 창 보여주기, 파라미터 docType={}",docType);

	}
	
	@RequestMapping("/payList.do")
	public void payList() {
		logger.info("결재 목록 보여주기");
		
	}
	
	@RequestMapping("/docView.do")
	public void docView() {
		logger.info("문서 상세보기");
	}
	
	@RequestMapping("/imsyBox.do")
	public void imsyBox() {
		logger.info("임시보관 목록 보여주기");
		
	}
	
	@RequestMapping("/sentpayList.do")
	public void sentpayList() {
		logger.info("기안완료 목록 보여주기");
		
	}
	
	@RequestMapping("/setForm.do")
	public void setForm() {
		logger.info("기안양식 목록 보여주기");
		
	}
	@RequestMapping("/insertForm.do")
	public void insertForm() {
		logger.info("문서 양식 작성하기");
		
	}
}
