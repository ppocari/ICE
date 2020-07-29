package com.will.ice.address.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

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
	public String address_get( @RequestParam(required = false, defaultValue = "1") int orderNo,  //address 첫화면 일 때 default로 대표 주소록을 보여줌. 
			HttpServletRequest request, Model model) {
		
		logger.info("주소록 메인");
		
		/*
		 * HttpSession session= request.getSession(); 
		 * String memNo=(String)session.getAttribute("memNo");
		 */
		
		String memNo="111910";
		
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
	
	@RequestMapping("/addressNav.do")
	public void addressNav_get() {
		logger.info("주소록 메뉴");
	}
	
	/* 주소록 insert 관련 */
	@RequestMapping(value="/addAddress.do", method=RequestMethod.GET)
	public void addAddress_get() {
		
		logger.info("주소록 등록");
	}

	@RequestMapping(value="/addAddress.do", method=RequestMethod.POST)
	public void addAddress_post() {
		
	}
	
	
}
