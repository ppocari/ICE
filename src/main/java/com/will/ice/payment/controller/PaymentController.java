package com.will.ice.payment.controller;

import java.io.File;
import java.util.HashMap;
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
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.will.ice.common.FileUploadUtil;
import com.will.ice.common.PaymentSearchVO;
import com.will.ice.document.model.ChkDocumentviewVO;
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
import com.will.ice.paymentfile.model.PaymentfileVO;

@Controller
@RequestMapping("/payment")
public class PaymentController {

	private static final Logger logger = LoggerFactory.getLogger(PaymentController.class); 
	
	@Autowired private DoctypeService doctypeService;
	@Autowired private MemberService memService;
	@Autowired private PaymentService paymentService;
	@Autowired private DocformService docformService;
	@Autowired private FileUploadUtil fileUploadUtil;
	
	@RequestMapping(value="/write/insertPaydoc.do",method=RequestMethod.POST)
	public String insertPaydoc(@ModelAttribute PaylinedocVO pldVo, Model model ,HttpServletRequest request,HttpSession session) {
		String identNum=(String)session.getAttribute("identNum");
		pldVo.setWritememNo(identNum);
		logger.info("기안작성=>완료함, pldVo={}",pldVo);
		
		//파일 업로드 처리
		List<Map<String, Object>> fileList = fileUploadUtil.fileUpload(request, fileUploadUtil.PATH_PAYMENT_FILE);
		String fileURL="",originalFileName="";long fileSize=0;
		if(fileList!=null) {
			for(Map<String, Object> map : fileList) {
				fileURL=(String) map.get("fileName");
				fileSize=(Long)map.get("fileSize");
				originalFileName = (String)map.get("originalFileName");
			}
		}
		PaymentfileVO fileVo = new PaymentfileVO(); 
		fileVo.setFileName(fileURL);
		fileVo.setOriginalFileName(originalFileName);
		fileVo.setFileSize(fileSize);
		
		MemberVO memVo = memService.selectMember(identNum);
		List<MemberVO> memlist = 
				paymentService.selectAllMem(Integer.parseInt(memVo.getPosCode()));
		logger.info("내 직급보다 높은 사원목록 조회 결과, memlist={}",memlist.size());
		
		int update=0;
		model.addAttribute("memlist",memlist);
		model.addAttribute("update",update);
		model.addAttribute("pldVo",pldVo);
		model.addAttribute("fileVo",fileVo);
		
		return "payment/write/selectPayLine";
	}
	
	@RequestMapping(value="/write/editPayment.do",method=RequestMethod.GET)
	public void editPayment_get(@RequestParam int docNo,Model model,HttpSession session,
			@RequestParam(required = false) String rew) {
		logger.info("임시보관 항목 수정하기, 파라미터 docNo={}",docNo);
		
		if(rew.equals("t")) {
			paymentService.rewritePay1(docNo);
			paymentService.rewritePay2(docNo);
			logger.info("기존 결재선, 사인파일 삭제");
		}
		
		String identNum = (String)session.getAttribute("identNum");
		logger.info("기안 목록 보여주기,사원번호={}",identNum);
		
		List<DoctypeVO> doctypelist = doctypeService.selectAll();
		PaymentfileVO fileVo = paymentService.getFile(docNo);
		logger.info("첨부된 파일,fileVo={}",fileVo);
		MemberVO memVo = memService.selectMember(identNum);
		List<DocformVO> formlist = docformService.selectAllForm();
		
		PaymentviewVO payVo = paymentService.selectDocument(docNo);
		logger.info("기안 내용,payVo={}",payVo);
		
		model.addAttribute("memVo",memVo);
		model.addAttribute("formlist",formlist);
		model.addAttribute("fileVo",fileVo);
		model.addAttribute("doctypelist",doctypelist);
		model.addAttribute("payVo",payVo);
	}
	
	@RequestMapping("/write/imsyInsert.do")
	public String imsyInsert(@ModelAttribute PaylinedocVO pldVo,HttpSession session,Model model,HttpServletRequest request) {
		String identNum = (String)session.getAttribute("identNum");
		pldVo.setWritememNo(identNum);
		logger.info("기안작성=>임시보관함, pldVo={}",pldVo);
		
		//파일 업로드 처리
		List<Map<String, Object>> fileList = fileUploadUtil.fileUpload(request, fileUploadUtil.PATH_PAYMENT_FILE);
		
		String fileURL="",originalFileName="";long fileSize=0;
		for(Map<String, Object> map : fileList) {
			fileURL=(String) map.get("fileName");
			fileSize=(Long)map.get("fileSize");
			originalFileName = (String)map.get("originalFileName");
		}
		
		PaymentfileVO fileVo = new PaymentfileVO(); 
		fileVo.setFileName(fileURL);
		fileVo.setOriginalFileName(originalFileName);
		fileVo.setFileSize(fileSize);

		int cnt = paymentService.insertImsyPay(pldVo,fileVo);
		String msg="임시보관 저장 실패!",url="/payment/write/imsyBox.do";
		if(cnt>0) {
			msg="임시보관함에 저장 되었습니다.";
		}
		
		model.addAttribute("msg",msg);
		model.addAttribute("url",url);
		
		return "common/message";
	}

	@RequestMapping(value="/write/editPaydoc.do",method=RequestMethod.POST)
	public String editPaydoc_post(@ModelAttribute PaylinedocVO pldVo,
			Model model,HttpServletRequest request,HttpSession session,@RequestParam String keep,
			@RequestParam String oldfileName) {
		//임시보관함에서 결재선 등록시
		String identNum = (String)session.getAttribute("identNum");
		pldVo.setKeep(Integer.parseInt(keep));
		pldVo.setWritememNo(identNum);
		pldVo.setImsy("N");
		pldVo.setProgress("waiting");
		logger.info("임시보관함=>완료함, pldVo={}",pldVo);
		
		MemberVO memVo = memService.selectMember(identNum);
		List<MemberVO> memlist = 
				paymentService.selectAllMem(Integer.parseInt(memVo.getPosCode()));
		logger.info("내 직급보다 높은 사원목록 조회 결과, memlist={}",memlist.size());

		//파일 업로드 처리
		List<Map<String, Object>> fileList 
			= fileUploadUtil.fileUpload(request, fileUploadUtil.PATH_PAYMENT_FILE);
		String fileURL="",originalFileName="";
		long fileSize=0;
		if(fileList!=null) {
			for(Map<String, Object> map : fileList) {
				fileURL=(String) map.get("fileName");
				originalFileName = (String)map.get("originalFileName");
				fileSize=(Long)map.get("fileSize");
			}
		}
		PaymentfileVO fileVo = new PaymentfileVO(); 
		fileVo.setFileName(fileURL);
		fileVo.setOriginalFileName(originalFileName);
		fileVo.setFileSize(fileSize);

		int update=1;
		model.addAttribute("oldfileName",oldfileName);
		model.addAttribute("fileVo",fileVo);
		model.addAttribute("memlist",memlist);
		model.addAttribute("update",update);
		model.addAttribute("pldVo",pldVo);
		
		return "payment/write/selectPayLine";
	}
	
	@RequestMapping("/write/imsyEdit.do")
	public String imsyEdit(@ModelAttribute PaylinedocVO pldVo,HttpSession session,
			Model model,HttpServletRequest request,@RequestParam String oldfileName) {
		//임시보관함에서 임시보관
		String identNum = (String)session.getAttribute("identNum");
		pldVo.setWritememNo(identNum);
		logger.info("임시보관함=>임시보관함, pldVo={}",pldVo);
		logger.info("첨부되있던 옛날파일={}",oldfileName);
		logger.info("문서번호={}",pldVo.getDocNo());
		
		int cnt=0;
		//파일 업로드 처리
		List<Map<String, Object>> fileList 
			= fileUploadUtil.fileUpload(request, fileUploadUtil.PATH_PAYMENT_FILE);
		String fileURL="",originalFileName="";
		long fileSize=0;
		if(fileList!=null) {
			for(Map<String, Object> map : fileList) {
				fileURL=(String) map.get("fileName");
				originalFileName = (String)map.get("originalFileName");
				fileSize=(Long)map.get("fileSize");
			}
		}
		PaymentfileVO fileVo = new PaymentfileVO(); 
		fileVo.setFileName(fileURL);
		fileVo.setOriginalFileName(originalFileName);
		fileVo.setFileSize(fileSize);
		
		cnt = paymentService.updatePaydoc(pldVo,fileVo,oldfileName);
		
		String msg="임시보관 저장 실패!",url="/payment/close.do";
		if(cnt>0) {
			msg="임시보관함에 저장 되었습니다.";
			if(fileURL!=null && !fileURL.isEmpty()) {
				if(oldfileName!=null && !oldfileName.isEmpty()) {
					String oldFileName=paymentService.getFile(pldVo.getDocNo()).getFileName();
					String upPath 
						= fileUploadUtil.getUploadPath(request, FileUploadUtil.PATH_PAYMENT_FILE);
					File file = new File(upPath, oldFileName);
					if(file.exists()) {
						boolean bool=file.delete();
						logger.info("파일 삭제 여부: {}", bool);
					}
				}
			}
		}
		
		model.addAttribute("msg",msg);
		model.addAttribute("url",url);
		
		return "common/message";
	}
	
	@RequestMapping("/write/payList.do")
	public void payList(Model model,HttpSession session) {
		//기안 작성
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
		//문서 양식목록 ajax불러오기
		logger.info("폼내용 가져오기, 파라미터 formNo={}",formNo);
		
		DocformVO formVo = docformService.getcontent(formNo);
		logger.info("폼내용 조회 결과, formVo={}",formVo);
		
		return formVo;
	}
	
	@RequestMapping("/checkDocView.do")
	public void checkdocView(@RequestParam int docNo, Model model) {
		//작성자가 확인하는 문서보기
		logger.info("문서 상세보기, 파라미터 docNo={}",docNo);
		
		PaymentviewVO payVo = paymentService.selectDocument(docNo);
		List<ChkDocumentviewVO> plList = paymentService.selectPayLine(docNo);
		List<DocumentviewVO> plList2 = paymentService.selectPayLine2(docNo);
		logger.info("결재선, 파라미터 plList={}",plList.size());
		PaymentfileVO fileVo = paymentService.getFile(docNo);
		logger.info("첨부파일 fileVo={}",fileVo);
		
		model.addAttribute("payVo",payVo);
		model.addAttribute("fileVo",fileVo);
		model.addAttribute("plList",plList);
		model.addAttribute("plList2",plList2);
	}
	
	@RequestMapping("/deletePayline.do")
	public String deletePayline(@RequestParam int docNo,Model model) {
		//결재선이 읽지 않았을 경우 결재상신 취소하기
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
	@RequestMapping("/write/close2.do")
	public void close2(){
		logger.info("팝업 닫기");
	}
	
	@RequestMapping("/write/sentpayList.do") 
	public void sentpayList(Model model,HttpSession session,@ModelAttribute PaymentSearchVO paysearchVo) {
		//작성완료 결재함
		String identNum = (String)session.getAttribute("identNum");
		logger.info("기안완료 목록 보여주기,사원번호={}",identNum);
		paysearchVo.setIdentNum(identNum);
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
		//임시보관함
		String identNum = (String)session.getAttribute("identNum");
		logger.info("임시보관 목록 보여주기,사원번호={}",identNum);
		paysearchVo.setIdentNum(identNum);
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
	
	@RequestMapping("/download.do")
	public ModelAndView download(@RequestParam int docNo,@RequestParam String fileName,
			HttpServletRequest request) {
		//첨부파일 다운로드
		//1
		logger.info("다운로드 파라미터, docNo={}, fileName={}", docNo, fileName);
		
		//다운로드 처리를 위한 페이지로 넘겨준다
		String upPath
			=fileUploadUtil.getUploadPath(request, FileUploadUtil.PATH_PAYMENT_FILE);
		File file = new File(upPath, fileName);
		
		//3
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("file", file);
		
		//4
		ModelAndView mav = new ModelAndView("paymentdownloadView", map);
		return mav;
	}
}