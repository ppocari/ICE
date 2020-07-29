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
import org.springframework.web.bind.annotation.RequestParam;

import com.will.ice.address.model.AddressGroupVO;
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
		/* String memNo="111910"; */
		
		/*주소록 조회*/
		
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
	
	/* 주소록 insert 관련 */
	@RequestMapping(value="/addAddress.do", method=RequestMethod.GET)
	public void addAddress_get(HttpServletRequest request, Model model) {
		
		HttpSession session= request.getSession();
		String memNo=(String)session.getAttribute("identNum");
		
		logger.info("주소록 등록 화면, memNo={}", memNo);
		
		List<AddressGroupVO> adgList= service.selectGroupName(memNo);
		
		logger.info("주소록 등록 화면 처리 결과, adgList.size={}", adgList.size());
		
		model.addAttribute("adgList", adgList);
	}

	/*
	 * @RequestMapping(value="/addAddress.do", method=RequestMethod.POST) public
	 * String addAddress_post(@ModelAttribute AddressVO adVo, HttpServletRequest
	 * request, Model model) {
	 * 
	 * HttpSession session= request.getSession(); String
	 * memNo=(String)session.getAttribute("identNum");
	 * 
	 * logger.info("주소록 등록 addressVo={}", adVo);
	 * 
	 * 
	 * int cnt=service.insertAddress(adVo, memNo); logger.info("주소록 등록 결과 cnt={}",
	 * cnt);
	 * 
	 * String msg="", url=""; if(cnt>0) { msg="주소록 등록 완료!";
	 * url="/address/addressMain.do"; }
	 * 
	 * model.addAttribute("msg", msg); model.addAttribute("url", url);
	 * 
	 * return "common/message.jsp"; }
	 */
	
	
}
