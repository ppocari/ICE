package com.will.ice.payment.controller;

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

import com.will.ice.common.PaymentSearchVO;
import com.will.ice.document.model.DocformService;
import com.will.ice.document.model.DocformVO;
import com.will.ice.document.model.DoctypeService;
import com.will.ice.document.model.DoctypeVO;
import com.will.ice.document.model.DocumentviewVO;
import com.will.ice.member.model.MemberService;
import com.will.ice.member.model.MemberVO;
import com.will.ice.payment.model.PaylinedocVO;
import com.will.ice.payment.model.PaylistViewVO;
import com.will.ice.payment.model.PaymentService;
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
	public String insertPaydoc(@RequestParam(required = false) String memNo,@RequestParam int formNo,@RequestParam String title,
			@RequestParam String content,@RequestParam String keep,@RequestParam int typeNo, Model model,HttpSession session) {
		String identNum = (String)session.getAttribute("identNum");
		logger.info("기안 작성 처리, 파라미터 memNo={},formNo={}",memNo,formNo);
		logger.info("title={},content={}",title,content);
		logger.info("keep={}",keep);
		logger.info("결재선, 사원번호={}",identNum);
		
		MemberVO memVo = memService.selectMember(identNum);
		List<MemberVO> memlist = 
				paymentService.selectAllMem(Integer.parseInt(memVo.getPosCode()));
		logger.info("내 직급보다 높은 사원목록 조회 결과, memlist={}",memlist.size());
		
		model.addAttribute("memlist",memlist);
		PaylinedocVO pldVo = new PaylinedocVO();
		pldVo.setWritememNo(identNum);
		pldVo.setFormNo(formNo);
		pldVo.setTypeNo(typeNo);
		pldVo.setTitle(title);
		pldVo.setContent(content);
		pldVo.setKeep(Integer.parseInt(keep));
		
		model.addAttribute("pldVo",pldVo);
		
		return "payment/write/selectPayLine";
	}
	
	@RequestMapping("/write/imsyInsert.do")
	public String imsyInsert(@RequestParam(required = false) String memNo,@RequestParam int formNo,@RequestParam String title,
			@RequestParam String content,@RequestParam String keep,@RequestParam(defaultValue = "N") String imsy,
			@RequestParam int typeNo,HttpSession session,Model model) {
		String identNum = (String)session.getAttribute("identNum");
		PaylinedocVO pldVo = new PaylinedocVO();
		pldVo.setWritememNo(identNum);
		pldVo.setFormNo(formNo);
		pldVo.setTypeNo(typeNo);
		pldVo.setTitle(title);
		pldVo.setContent(content);
		pldVo.setKeep(Integer.parseInt(keep));
		pldVo.setImsy(imsy);
		pldVo.setProgress("결재진행중");
		
		int cnt = paymentService.insertOnePay(pldVo);
		String msg="임시보관 저장 실패!",url="/payment/close.do";
		if(cnt>0) {
			msg="임시보관함에 저장 되었습니다.";
		}
		
		model.addAttribute("msg",msg);
		model.addAttribute("url",url);
		
		return "common/message";
	}
	
	@RequestMapping("/write/payList.do")
	public void payList(Model model,HttpSession session) {
		String identNum = (String)session.getAttribute("identNum");
		logger.info("기안 목록 보여주기,사원번호={}",identNum);
		
		List<DoctypeVO> doctypelist = doctypeService.selectAll();
		
		MemberVO memVo = memService.selectMember(identNum);
		List<DocformVO> formlist = docformService.selectAllForm();
		
		model.addAttribute("memVo",memVo);
		model.addAttribute("formlist",formlist);
		model.addAttribute("doctypelist",doctypelist);
	}
	
	@RequestMapping("/getForm.do")
	@ResponseBody
	public DocformVO getForm(@RequestParam int formNo) {
		logger.info("폼내용 가져오기, 파라미터 formNo={}",formNo);
		
		DocformVO formVo = docformService.getcontent(formNo);
		logger.info("폼내용 조회 결과, formVo={}",formVo);
		
		return formVo;
	}
	
	@RequestMapping("/checkDocView.do")
	public void docView(@RequestParam int docNo, Model model) {
		logger.info("문서 상세보기, 파라미터 docNo={}",docNo);
		
		PaymentviewVO payVo = paymentService.selectDocument(docNo);
		List<DocumentviewVO> plList = paymentService.selectPayLine(docNo);
		logger.info("결재선, 파라미터 plList={}",plList.size());
		
		model.addAttribute("payVo",payVo);
		model.addAttribute("plList",plList);
	}
	
	@RequestMapping("/deletePayline.do")
	public String deletePayline(@RequestParam int docNo,Model model) {
		logger.info("결재상신 취소, 파라미터 docNo={}",docNo);
		
		int cnt = paymentService.deletePayLine(docNo);
		String msg="결재상신 취소 실패!",url="/payment/write/checkDocView.do?docNo="+docNo;
		if(cnt>0) {
			msg="결재상신 취소되었습니다";
			url="/payment/close.do";
		}else if(cnt==-1) {
			msg="결재 처리 중 으로 취소할 수 없습니다";
			url="/payment/close.do";
		}
		
		model.addAttribute("msg",msg);
		model.addAttribute("url",url);
		
		return "common/message";
	}
	
	@RequestMapping("/close.do")
	public void close(){
		logger.info("팝업 닫기");
	}
	
	@RequestMapping("/write/sentpayList.do") 
	public void sentpayList_get(Model model,HttpSession session,@ModelAttribute PaymentSearchVO paysearchVo) {
		String identNum = (String)session.getAttribute("identNum");
		logger.info("기안완료 목록 보여주기,사원번호={}",identNum);
		paysearchVo.setCustomerId(identNum);
		logger.info("PaymentSearchVO={}",paysearchVo);
		
		List<PaylistViewVO> list = paymentService.selectSent(paysearchVo);
		logger.info("list.size()={}",list.size());
		List<DoctypeVO> doctypelist = doctypeService.selectAll();
		
		model.addAttribute("list",list);
		model.addAttribute("doctypelist",doctypelist);
		model.addAttribute("paysearchVo",paysearchVo);
	}
	
	@RequestMapping("/write/imsyBox.do") 
	public void imsyBox(Model model,HttpSession session,@ModelAttribute PaymentSearchVO paysearchVo) {
		String identNum = (String)session.getAttribute("identNum");
		logger.info("임시보관 목록 보여주기,사원번호={}",identNum);
		paysearchVo.setCustomerId(identNum);
		logger.info("PaymentSearchVO={}",paysearchVo);
		
		List<PaymentviewVO> list = paymentService.selectImsy(paysearchVo);
		logger.info("임시보관 목록 조회결과,list.size()={}",list.size());
		
		List<DoctypeVO> doctypelist = doctypeService.selectAll();
		
		model.addAttribute("list",list);
		model.addAttribute("doctypelist",doctypelist);
	}
	
	@RequestMapping("/summer.do")
	public void summer() {
		logger.info("썸머노트");
	}
	 /* @RequestMapping("/confirm/notcheckedList.do") public void notcheckedList() {
	 * logger.info("미결재 목록 보여주기");
	 * 
	 * }
	 */
}
