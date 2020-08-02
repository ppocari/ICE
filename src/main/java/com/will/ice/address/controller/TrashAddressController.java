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
import com.will.ice.address.model.AddressService;
import com.will.ice.address.model.AddressVO;

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
	public String trash_get(HttpServletRequest request, Model model) {
		
		logger.info("주소록(휴지통) 조회");
		
		 HttpSession session= request.getSession(); 
		 String memNo=(String)session.getAttribute("identNum");
		
		 logger.info("memNo={}", memNo);

		 String url="/log/login.do", msg="먼저 로그인 해주세요!";
		 if(memNo==null) {
			 model.addAttribute("msg", msg);
			 model.addAttribute("url", url);
			 
			 return "common/message";
		 }
		/* String memNo="111910"; */
		
		List<AddressVO> adList=service.selectTrashAddress(memNo);
		logger.info("주소록(휴지통) 조회 결과, list.size={}", adList.size());
		
		model.addAttribute("adList", adList);
		
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
