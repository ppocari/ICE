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
import com.will.ice.document.model.ChkDocumentviewVO;
import com.will.ice.document.model.DoctypeService;
import com.will.ice.document.model.DoctypeVO;
import com.will.ice.document.model.DocumentviewVO;
import com.will.ice.paycomment.model.CommentviewVO;
import com.will.ice.paycomment.model.PaycommentVO;
import com.will.ice.payline.model.PaylineVO;
import com.will.ice.payment.model.PaylistViewVO;
import com.will.ice.payment.model.PaymentService;
import com.will.ice.payment.model.PaymentVO;
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
	
	@RequestMapping("/confirm/decided.do")
	public void decided(HttpSession session, @ModelAttribute PaymentSearchVO paysearchVo,
			Model model) {
		logger.info("기결함 보여주기 검색vo={}",paysearchVo);
		
		String identNum = (String)session.getAttribute("identNum");
		paysearchVo.setIdentNum(identNum);
		//기결문서번호 리스트 progress로 찾아오기
		
		List<PaylistViewVO> list = paymentService.selectDecided(paysearchVo);
		List<DoctypeVO> doctypelist = doctypeService.selectAll();
		
		model.addAttribute("list",list);
		model.addAttribute("doctypelist",doctypelist);
		model.addAttribute("paysearchVo",paysearchVo);
	}
	
	@RequestMapping("/confirm/rejected.do")
	public void rejected(HttpSession session, @ModelAttribute PaymentSearchVO paysearchVo,
			Model model) {
		String identNum = (String)session.getAttribute("identNum");
		paysearchVo.setIdentNum(identNum);
		logger.info("반려함 보여주기  검색vo={}",paysearchVo);
		
		
		List<PaymentviewVO> list = paymentService.selectRejected(paysearchVo);
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
		List<DocumentviewVO> plList2 = paymentService.selectPayLine2(docNo);
		List<ChkDocumentviewVO> plList = paymentService.selectPayLine(docNo);
		logger.info("결재선, 파라미터 plList={}",plList.size());
		PaymentfileVO fileVo = paymentService.getFile(docNo);
		logger.info("첨부파일 fileVo={}",fileVo);
		
		model.addAttribute("signList",signList);
		model.addAttribute("payVo",payVo);
		model.addAttribute("plList2",plList2);
		model.addAttribute("plList",plList);
		model.addAttribute("fileVo",fileVo);
	}

	@RequestMapping("/rejectedDocView.do")
	public void rejectedDocView(@RequestParam int docNo, Model model, HttpSession session) {
		//결재자가 확인하는 문서보기
		logger.info("반려된 문서보기, 파라미터 docNo={}",docNo);
		String memNo = (String)session.getAttribute("identNum");
		
		List<CommentviewVO> commentList = paymentService.selectComment(docNo);
		List<PaycommentVO> signList = paymentService.selectSign(docNo);
		PaymentviewVO payVo = paymentService.selectDocument(docNo);
		List<DocumentviewVO> plList2 = paymentService.selectPayLine2(docNo);
		List<ChkDocumentviewVO> plList = paymentService.selectPayLine(docNo);
		logger.info("결재선, 파라미터 plList={}",plList.size());
		PaymentfileVO fileVo = paymentService.getFile(docNo);
		logger.info("첨부파일 fileVo={}",fileVo);
		
		model.addAttribute("commentList",commentList);
		model.addAttribute("signList",signList);
		model.addAttribute("payVo",payVo);
		model.addAttribute("plList2",plList2);
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
	public String reject(@ModelAttribute PaycommentVO comVo,HttpSession session, Model model) {
		logger.info("반려처리 , 파라미터 comVo={}",comVo);
		String identNum = (String)session.getAttribute("identNum");
		comVo.setMemNo(identNum);
		comVo.setSignName("");
		comVo.setOriginalSignName("");
		
		//코멘트 저장하고 progress'반려'
		int cnt = paymentService.insertComment(comVo);
		PaymentviewVO vo = new PaymentviewVO();
		vo.setDocNo(comVo.getDocNo());
		vo.setProgress("reject");
		paymentService.updateProgress(vo);
		
		String msg="반려 처리 실패!", url="/payment/close.do";
		if(cnt>0) {
			msg="반려 처리되었습니다!";
		}
		
		model.addAttribute("msg",msg);
		model.addAttribute("url",url);
		
		return "common/message";
	}
}
