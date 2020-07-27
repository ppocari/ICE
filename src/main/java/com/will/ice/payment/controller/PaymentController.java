package com.will.ice.payment.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.will.ice.document.model.DoctypeService;
import com.will.ice.document.model.DoctypeVO;
import com.will.ice.member.model.MemberService;
import com.will.ice.member.model.MemberVO_log;
import com.will.ice.payment.model.PaymentService;
import com.will.ice.payment.model.PaymentVO;

@Controller
@RequestMapping("/payment")
public class PaymentController {

	private static final Logger logger = LoggerFactory.getLogger(PaymentController.class); 
	
	@Autowired
	private DoctypeService doctypeService;
	@Autowired
	private MemberService memService;
	@Autowired
	private PaymentService paymentService;

	@RequestMapping("/write/payList.do")
	public void payList(Model model) {
		logger.info("결재 목록 보여주기");
		
		List<DoctypeVO> doctypelist = doctypeService.selectAll();
		
		model.addAttribute("doctypelist",doctypelist);
		
	}
	
	@RequestMapping(value="/write/writePay.do",method=RequestMethod.POST)
	public void writePayment(@RequestParam int typeNo,Model model) {
		logger.info("서류 작성 창 보여주기, 파라미터 docType={}",typeNo);
		
		String typeName = doctypeService.choosenType(typeNo);
		MemberVO_log memVo = memService.selectMember("202007262001");
		
		model.addAttribute("typeName",typeName);
		model.addAttribute("memVo",memVo);
		
	}

	@RequestMapping(value="/write/insertPaydoc.do",method=RequestMethod.POST)
	public String insertPaydoc(@RequestParam String memNo,@RequestParam int formNo,@RequestParam String title,
			@RequestParam String content,@RequestParam int keep,Model model) {
		logger.info("작성하기, 파라미터 memNo={},formNo={}",memNo,formNo);
		logger.info("title={},content={}",title,content);
		logger.info("keep={}",keep);
		
		PaymentVO paymentVo = new PaymentVO();
		paymentVo.setContent(content);
		paymentVo.setMemNo(memNo);
		paymentVo.setFormNo(formNo);
		paymentVo.setTitle(title);
		paymentVo.setKeep(keep);
		
		int cnt = paymentService.insertPaydoc(paymentVo);
		String msg="기안작성실패!",url="";
		if(cnt>0) {
			msg="기안 작성 완료!";
		}
		
		model.addAttribute("msg",msg);
		model.addAttribute("url",url);

		return "common/message";
	}
	
	/*
	@RequestMapping("/write/imsyBox.do")
	public void imsyBox() {
		logger.info("임시보관 목록 보여주기");
		
	}
	
	@RequestMapping("/write/sentpayList.do")
	public void sentpayList() {
		logger.info("기안완료 목록 보여주기");
		
	}
	
	@RequestMapping("/write/setForm.do")
	public void setForm() {
		logger.info("기안양식 목록 보여주기");
		
	}
	
	@RequestMapping("/write/insertForm.do")
	public void insertForm() {
		logger.info("문서 양식 작성하기");
		
	}
	
	@RequestMapping("/write/selectPayLine.do")
	public void selectPayLine() {
		logger.info("결재선 지정하기");
		
	}
	
	@RequestMapping("/docView.do")
	public void docView() {
		logger.info("문서 상세보기");
		
	}
	
	@RequestMapping("/confirm/notcheckedList.do")
	public void notcheckedList() {
		logger.info("미결재 목록 보여주기");
		
	}
	*/
}
