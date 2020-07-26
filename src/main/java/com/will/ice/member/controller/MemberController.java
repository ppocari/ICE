package com.will.ice.member.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.will.ice.member.model.MemberService;
import com.will.ice.member.model.MemberVO;
import com.will.ice.model.DepartmentVO;
import com.will.ice.model.EtcService;
import com.will.ice.model.PositionVO;

@Controller
@RequestMapping("/member")
public class MemberController {

	private static final Logger logger
		 = LoggerFactory.getLogger(MemberController.class);
	
	@Autowired private MemberService memberService;
	@Autowired private EtcService etcService;
	
	
	@RequestMapping("/management.do")
	public void management_get() {
		logger.info("사원 관리 화면");
	}
	
	@RequestMapping(value = "/register.do" , method = RequestMethod.GET)
	public void register_get() {
		logger.info("사원 등록 화면");
	}
	
	@RequestMapping(value="/register.do", method = RequestMethod.POST)
	public String register_post(@ModelAttribute MemberVO vo, Model model) {
		logger.info("사원 등록 처리");
		
		//여러개의 사원 데이터를 받아서 insert 하기
		int cnt = memberService.admin_regist_member(vo);
		logger.info("사원 등록 결과, cnt={}", cnt);
		
		String msg = "사원등록 실패", url = "/member/register.do";
		if(cnt > 0) {
			msg = "사원등록 성공";
			url = "/member/memeList.do";
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "/common/message";
		
	}
	
	
	@RequestMapping(value = "/memList.do", method = RequestMethod.GET)
	public void memeList_get() {
		logger.info("사원 조회");
	}
	
	@RequestMapping(value ="/memList.do", method = RequestMethod.POST)
	public void memeList_post(@RequestParam(required = false) String searchKeyword, Model model) {
		logger.info("사원 조회 결과 화면");
		
		List<DepartmentVO> deptList = etcService.DeptAll();
		List<PositionVO> posList = etcService.PosAll();
		
		List<MemberVO> list = memberService.searchAllmember(searchKeyword);
		
		model.addAttribute("deptList", deptList);
		model.addAttribute("posList", posList);
		model.addAttribute("list", list);
		
	}
}
