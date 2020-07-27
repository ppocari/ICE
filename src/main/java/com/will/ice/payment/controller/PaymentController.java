package com.will.ice.payment.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.will.ice.document.model.DocformService;
import com.will.ice.document.model.DocformVO;
import com.will.ice.document.model.DoctypeService;
import com.will.ice.document.model.DoctypeVO;
import com.will.ice.member.model.MemberService;
import com.will.ice.member.model.MemberVO_log;
import com.will.ice.payment.model.PaymentService;
import com.will.ice.payment.model.PaymentVO;
import com.will.ice.payment.model.PaymentviewVO;

@Controller
@RequestMapping("/payment")
public class PaymentController {

	private static final Logger logger = LoggerFactory.getLogger(PaymentController.class); 
	
	@Autowired private DoctypeService doctypeService;
	@Autowired private MemberService memService;
	@Autowired private PaymentService paymentService;
	@Autowired private DocformService docformService;
	
	@RequestMapping(value="/write/insertPaydoc.do",method=RequestMethod.POST)
	public String insertPaydoc(@RequestParam String memNo,@RequestParam int formNo,@RequestParam String title,
			@RequestParam String content,@RequestParam String keep,
			@RequestParam int typeNo, Model model) {
		logger.info("기안 작성 처리, 파라미터 memNo={},formNo={}",memNo,formNo);
		logger.info("title={},content={}",title,content);
		logger.info("keep={}",keep);
		
		PaymentVO paymentVo = new PaymentVO();
		paymentVo.setMemNo(memNo);
		paymentVo.setFormNo(formNo);
		paymentVo.setTypeNo(typeNo);
		paymentVo.setTitle(title);
		paymentVo.setContent(content);
		paymentVo.setKeep(Integer.parseInt(keep));
		
		int cnt = paymentService.insertPaydoc(paymentVo);
		String msg="기안작성실패!",url="/payment/close.do";
		if(cnt>0) {
			msg="기안 작성 완료!";
		}
		
		model.addAttribute("msg",msg);
		model.addAttribute("url",url);

		return "common/message";
	}
	
	@RequestMapping("/write/payList.do")
	public void payList(Model model) {
		logger.info("기안 목록 보여주기");
		
		List<DoctypeVO> doctypelist = doctypeService.selectAll();
		
		List<PaymentviewVO> list = paymentService.selectAll();
		
		model.addAttribute("doctypelist",doctypelist);
		model.addAttribute("list",list);
	}
	
	@RequestMapping(value="/write/writePay.do",method=RequestMethod.POST)
	public void writePayment(@RequestParam int typeNo,Model model,
			HttpSession session) {
		logger.info("기안 작성 창 보여주기, 파라미터 docType={}",typeNo);
		String identNum = (String)session.getAttribute("identNum");
		
		String typeName = doctypeService.choosenType(typeNo);
		MemberVO_log memVo = memService.selectMember(identNum);
		List<DocformVO> formlist = docformService.selectAllForm();
		
		model.addAttribute("typeName",typeName);
		model.addAttribute("memVo",memVo);
		model.addAttribute("formlist",formlist);
	}

	@RequestMapping("/write/selectPayLine.do")
	public void selectPayLine() {
		logger.info("결재선 지정하기");
		
	}
	
	@RequestMapping("/docView.do")
	public void docView() {
		logger.info("문서 상세보기");
		
	}
	
	@RequestMapping("/close.do")
	public void close(){
		logger.info("팝업 닫기");
	}
	/*
	 * @RequestMapping("/write/imsyBox.do") public void imsyBox() {
	 * logger.info("임시보관 목록 보여주기");
	 * 
	 * }
	 * 
	 * @RequestMapping("/write/sentpayList.do") public void sentpayList() {
	 * logger.info("기안완료 목록 보여주기");
	 * 
	 * }
	 * 
	 * 
	 * @RequestMapping("/confirm/notcheckedList.do") public void notcheckedList() {
	 * logger.info("미결재 목록 보여주기");
	 * 
	 * }
	 */
}
