package com.will.ice.payment.confirm.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.will.ice.common.FileUploadUtil;
import com.will.ice.common.PaymentSearchVO;
import com.will.ice.document.model.DoctypeService;
import com.will.ice.document.model.DoctypeVO;
import com.will.ice.document.model.DocumentviewVO;
import com.will.ice.paycomment.model.PaycommentVO;
import com.will.ice.payline.model.PaylineVO;
import com.will.ice.payment.model.PaylistViewVO;
import com.will.ice.payment.model.PaymentService;
import com.will.ice.payment.model.PaymentviewVO;
import com.will.ice.paymentfile.model.PaymentfileVO;

@Controller
@RequestMapping("/payment")
public class ConfirmController {
	private static final Logger logger = LoggerFactory.getLogger(ConfirmController.class); 
	
	@Autowired PaymentService paymentService;
	@Autowired DoctypeService doctypeService;
	@Autowired private FileUploadUtil fileUploadUtil;
	
	@RequestMapping("/confirm/undecided.do")
	public void undecided(HttpSession session, @ModelAttribute PaymentSearchVO paysearchVo,
			Model model) {
		logger.info("미결함 보여주기");
		
		String identNum = (String)session.getAttribute("identNum");
		paysearchVo.setIdentNum(identNum);
		//미결문서번호 리스트 뽑아서 for문으로 돌리기
		List<Integer> docNolist = paymentService.docNolist();
		logger.info("docNolist={}",docNolist);
		logger.info("검색vo={}",paysearchVo);
		
		List<PaylistViewVO> list = paymentService.selectUndecided2(paysearchVo,docNolist);
		logger.info("미결함 목록 조회 결과={}",list.size());
		List<DoctypeVO> doctypelist = doctypeService.selectAll();
		
		model.addAttribute("list",list);
		model.addAttribute("doctypelist",doctypelist);
		model.addAttribute("paysearchVo",paysearchVo);
	}
	
	@RequestMapping("/docView.do")
	public void docView(@RequestParam int docNo, Model model, HttpSession session) {
		//결재자가 확인하는 문서보기
		logger.info("결재자 문서보기, 파라미터 docNo={}",docNo);
		String memNo = (String)session.getAttribute("identNum");
		
		//읽음 처리
		PaylineVO plVo = new PaylineVO();
		plVo.setDocNo(docNo);
		plVo.setMemNo(memNo);
		int read = paymentService.updateRead(plVo);
		logger.info("읽기처리 : {}",read);
		
		List<PaycommentVO> signList = paymentService.selectSign(docNo);
		PaymentviewVO payVo = paymentService.selectDocument(docNo);
		List<DocumentviewVO> plList = paymentService.selectPayLine(docNo);
		logger.info("결재선, 파라미터 plList={}",plList.size());
		PaymentfileVO fileVo = paymentService.getFile(docNo);
		logger.info("첨부파일 fileVo={}",fileVo);
		
		model.addAttribute("signList",signList);
		model.addAttribute("payVo",payVo);
		model.addAttribute("plList",plList);
		model.addAttribute("fileVo",fileVo);
	}
	
	@RequestMapping("/approve.do")
	public String approve(@ModelAttribute PaycommentVO comVo, HttpServletRequest request,
			HttpSession session, Model model) {
		logger.info("승인처리 , 파라미터 comVo={}",comVo);
		String identNum = (String)session.getAttribute("identNum");
		
		//파일 업로드 처리
		List<Map<String, Object>> fileList = fileUploadUtil.fileUpload(request, fileUploadUtil.PATH_SIGN_FILE);
		String fileURL="",originalFileName="";
		if(fileList!=null) {
			for(Map<String, Object> map : fileList) {
				fileURL=(String) map.get("fileName");
				originalFileName = (String)map.get("originalFileName");
			}
		}
		comVo.setSignName(fileURL);
		comVo.setOriginalSignName(originalFileName);
		comVo.setMemNo(identNum);
		
		//결재상태 업데이트
		int cnt = paymentService.insertComment(comVo); //댓글작성, 결재일 등록	
		
		String msg="승인 처리에 실패하였습니다",url="/payment/docView.do?docNo="+comVo.getDocNo();
		if(cnt>0) {
			msg="승인 처리되었습니다";
			url="/payment/close.do";
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);

		return "common/message";
	}

	@RequestMapping("/reject.do")
	public void reject() {
		
	}
}
