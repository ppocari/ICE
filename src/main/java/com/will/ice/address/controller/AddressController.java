package com.will.ice.address.controller;

import java.io.File;
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
import org.springframework.web.bind.annotation.RequestParam;

import com.will.ice.address.model.AddressGroupVO;
import com.will.ice.address.model.AddressListVO;
import com.will.ice.address.model.AddressService;
import com.will.ice.address.model.AddressVO;
import com.will.ice.member.model.MemberVO;
import com.will.ice.model.DepartmentVO;

@Controller
@RequestMapping("/address")
public class AddressController {
	
	private final Logger logger
	=LoggerFactory.getLogger(AddressController.class);

	@Autowired
	private AddressService service;
	
	/* 주소록 조회 */
	@RequestMapping("/addressMain.do")
	public String address_get(HttpServletRequest request, Model model) {
		
		logger.info("주소록 메인");
		
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
		
		List<AddressVO> adList=service.selectAddress(memNo);
		logger.info("주소록 조회 결과, list.size={}", adList.size());
		
		
		model.addAttribute("adList", adList);
		
		return "address/addressMain";
		
	}
	
	@RequestMapping("/organizeChart.do")
	public void showOrganization(Model model) {
		logger.info("조직도 보기");
		
		List<MemberVO> organList=service.selectMemDeptPosForOrgan();
		
		List<DepartmentVO> deptList=service.selectDepartment();
		logger.info("조직도 보기 결과 organList.size={}, deptList.size={}", 
				organList.size(), deptList.size());
		
		model.addAttribute("organList", organList);
		model.addAttribute("deptList", deptList);
		
	}
	
	/* 주소록 상세보기 */
	@RequestMapping("/detailAddress.do")
	public void editAddress_get(@RequestParam (defaultValue="0") int adNo, Model model) {
		
		logger.info("주소록 상세보기 화면, 파라미터 adNo={}", adNo);
		
		AddressVO adVo=service.selectOneAdderss(adNo);
		logger.info("주소록 상세보기 화면 보여주기, adVo={},", adVo);
		
		model.addAttribute("adVo", adVo);
		
	}
	
	/* 주소록 insert 관련 */
	@RequestMapping(value="/addAddress.do", method=RequestMethod.GET)
	public void addAddress_get(HttpServletRequest request, Model model) {
		
		HttpSession session= request.getSession();
		String memNo=(String)session.getAttribute("identNum");
		logger.info("주소록 등록 화면, memNo={}", memNo);
		
		List<AddressGroupVO> adgList= service.selectAddressGroup(memNo);
		logger.info("주소록 등록 화면 처리 결과, adgList.size={}", adgList.size());
		
		model.addAttribute("adgList", adgList);
	}

	@RequestMapping(value="/addAddress.do", method=RequestMethod.POST) 
	public String addAddress_post(@ModelAttribute AddressVO adVo, Model model) {
 
		logger.info("주소록 등록 addressVo={}", adVo);
  
		int cnt=service.insertAddress(adVo); 
		logger.info("주소록 등록 결과 cnt={}", cnt);
  
		String msg="주소록 등록에 실패하였습니다.", url="/address/addressMain.do"; 
		if(cnt>0) { 
			msg="주소록이 등록되었습니다.";
		}
  
		model.addAttribute("msg", msg); 
		model.addAttribute("url", url);
  
		return "common/message"; 
		  
	}
	
	/* 주소록 수정 */
	@RequestMapping(value="/editAddress.do", method=RequestMethod.GET)
	public void editAddress_get(@RequestParam (defaultValue="0") int adNo,
			HttpServletRequest request, Model model) {
		
		HttpSession session= request.getSession();
		String memNo=(String)session.getAttribute("identNum");
		
		/* 주소 정보 뿌려주기 */
		logger.info("주소록 수정 화면, 파라미터 adNo={}, memNo={}", adNo, memNo);
		
		AddressVO adVo=service.selectOneAdderss(adNo);
		
		/* 그룹 리스트 보여주기 */
		List<AddressGroupVO> adgList= service.selectAddressGroup(memNo);
		logger.info("주소록 수정 화면 보여주기, adVo={}, adgList.size={}", adVo, adgList.size());
		
		model.addAttribute("adgList", adgList);
		model.addAttribute("adVo", adVo);
		
	}
	
	@RequestMapping(value="/editAddress.do", method=RequestMethod.POST)
	public String editAddress_post(@ModelAttribute AddressVO adVo, Model model) {
		
		logger.info("주소록 수정, 파라미터 adVo={}", adVo);
		
		int cnt=service.updateAddress(adVo);
		logger.info("주소록 수정 결과, cnt={}", cnt);
		
		String url="", msg="";
		if(cnt>0) {
			url="/address/addressMain.do";
			msg="주소록이 수정되었습니다.";
			
		}
		
		model.addAttribute("url", url);
		model.addAttribute("msg", msg);
		
		return "common/message";
	}
	
	@RequestMapping("/deleteMulti.do")
	public String delMult(@ModelAttribute AddressListVO adListVo
			, HttpServletRequest request, Model model) {

		//1.
		logger.info("선택한 상품 삭제, 파라미터 pdListVo={}", adListVo);
		
		List<AddressVO> adList=adListVo.getAdItems();
		
		//2.
		int cnt=service.deleteMulti(adList);
		
		logger.info("선택한 주소 삭제 결과, cnt={})", cnt);
		String msg="", url="/address/addressMain.do";
		
		if(cnt>0) {
			msg="선택한 주소를 삭제하였습니다.";
		}else {
			msg="선택한 상품들 삭제시 에러 발생!!";
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
	}
	
}
