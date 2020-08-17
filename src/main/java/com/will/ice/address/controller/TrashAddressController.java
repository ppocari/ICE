package com.will.ice.address.controller;

import java.util.List;

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

import com.will.ice.address.model.AddressListVO;
import com.will.ice.address.model.AddressSearchVO;
import com.will.ice.address.model.AddressService;
import com.will.ice.address.model.AddressUtility;
import com.will.ice.address.model.AddressVO;
import com.will.ice.common.PaginationInfo;

@Controller
@RequestMapping("/address")
public class TrashAddressController {
	
	private final Logger logger
	=LoggerFactory.getLogger(AddressController.class);

	@Autowired
	private AddressService service;
	
	/* 주소를 휴지통으로 이동 */
	@RequestMapping("/trashMulti.do")
	public String trashMulti(@ModelAttribute AddressListVO adListVo
			, HttpServletRequest request, Model model) {

		//1.
		logger.info("선택한 주소를 휴지통으로 이동, 파라미터 pdListVo={}", adListVo);
		
		List<AddressVO> adList=adListVo.getAdItems();
		
		//2.
		int cnt=service.updateTrashMulti(adList);
		
		logger.info("선택한 주소를 휴지통으로 이동 결과, cnt={})", cnt);
		String msg="", url="/address/addressMain.do";
		
		if(cnt>0) {
			msg="선택한 주소를 휴지통으로 이동하였습니다.";
		}else {
			msg="선택한 상품들 삭제시 에러 발생!!";
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";

	}
	
	/* 휴지통 - 조회 */
	@RequestMapping("/trashAddress.do")
	public String address_get(@ModelAttribute AddressSearchVO adSearchVo, HttpServletRequest request, Model model) {
		
		 HttpSession session= request.getSession(); 
		 String memNo=(String)session.getAttribute("identNum");
		
		 logger.info("주소록 휴지통 보기, memNo={}, AddressSearchVo={}", memNo, adSearchVo);
		 
		 String url="/log/login.do", msg="먼저 로그인 해주세요!";
		 if(memNo==null) {
			 model.addAttribute("msg", msg);
			 model.addAttribute("url", url);
			 
			 return "common/message";
		 }
		/* String memNo="111910"; */
		
		//[1] PaginationInfo
		PaginationInfo pagingInfo = new PaginationInfo();
		pagingInfo.setBlockSize(AddressUtility.BLOCKSIZE);
		pagingInfo.setRecordCountPerPage(AddressUtility.RECORD_COUNT);
		pagingInfo.setCurrentPage(adSearchVo.getCurrentPage());
		
		//[2] SearchVo
		adSearchVo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());
		adSearchVo.setRecordCountPerPage(AddressUtility.RECORD_COUNT);
		
		//2
		adSearchVo.setMemNo(memNo);
		adSearchVo.setIsTrash("yes");
		
		List<AddressVO> adList=service.selectAddress(adSearchVo);
		logger.info("주소록 휴지통 조회 결과, list.size={}", adList.size());

		int totalRecord=service.selectTotalRecord(adSearchVo);
		logger.info("전체 레코드={} " + totalRecord);
		
		pagingInfo.setTotalRecord(totalRecord);
				
		//3
		model.addAttribute("adList", adList);
		model.addAttribute("pagingInfo", pagingInfo);
		
		//4
		return "address/trashAddress";
		
	}
	
	/* 휴지통 복원 */
	@RequestMapping("/backMulti.do")
	public String backMult(@ModelAttribute AddressListVO adListVo
			, HttpServletRequest request, Model model) {
		
		//1.
		logger.info("선택한 주소 복원, 파라미터 pdListVo={}", adListVo);
		
		List<AddressVO> adList=adListVo.getAdItems();
		
		//2.
		int cnt=service.updateBackMulti(adList);
		
		logger.info("선택한 주소 복원 결과, cnt={})", cnt);
		String msg="", url="/address/trashAddress.do";
		
		if(cnt>0) {
			msg="선택한 주소를 복원하였습니다.";
		}else {
			msg="선택한 주소들 복원시 에러 발생!!";
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
		
	}
	
	/* 휴지통 삭제 */
	@RequestMapping("/deleteMulti.do")
	public String delMult(@ModelAttribute AddressListVO adListVo
			, HttpServletRequest request, Model model) {
		
		//1.
		logger.info("선택한 주소 삭제, 파라미터 pdListVo={}", adListVo);
		
		List<AddressVO> adList=adListVo.getAdItems();
		
		//2.
		int cnt=service.deleteMulti(adList);
		
		logger.info("선택한 주소 삭제 결과, cnt={})", cnt);
		String msg="", url="/address/trashAddress.do";
		
		if(cnt>0) {
			msg="선택한 주소를 삭제하였습니다.";
		}else {
			msg="선택한 주소들 삭제시 에러 발생!!";
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
		
	}
	
}
