package com.will.ice.member.controller;


import java.text.SimpleDateFormat;
import java.util.Date;
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

import com.will.ice.member.model.MemberListVO;
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
	
	@RequestMapping(value ="/memWrite.do" , method = RequestMethod.GET)
	public void memWrite(Model model) {
		logger.info("사원 등록 화면 memWrite");
		
		List<DepartmentVO> deptList = etcService.DeptAll();
		List<PositionVO> posList = etcService.PosAll();
		
		model.addAttribute("deptList", deptList);
		model.addAttribute("posList", posList);
	}
	
	@RequestMapping(value ="/memWrite.do" , method = RequestMethod.POST)
	public String memWriteMulti(@ModelAttribute MemberListVO memListVO,
			Model model) {
		logger.info("사원 등록 처리 memWriteMulti, memListVO={}",memListVO);
		
		int cnt = 0;
		try {
			List<MemberVO> memList = memListVO.getMemItems();
			cnt = memberService.registerMulti(memList);
		
			String msg = "사원번호 중복!", url = "/member/memWrite.do";
			if(cnt > 0) {
				msg = "사원등록 성공!";
				url = "/member/memList.do";
				
			}
			model.addAttribute("msg", msg);
			model.addAttribute("url", url);
			
		}catch (Exception e) {
			e.printStackTrace();
		}
	
		return "/common/message";
	}
	

	
	@RequestMapping(value = "/memList.do", method = RequestMethod.GET)
	public void memeList_get(Model model) {
		logger.info("사원 조회");
		
		List<DepartmentVO> deptList = etcService.DeptAll();
		List<PositionVO> posList = etcService.PosAll();
		
		model.addAttribute("deptList", deptList);
		model.addAttribute("posList", posList);
	}
	
	@RequestMapping(value ="/memList.do", method = RequestMethod.POST)
	public void memeList_post(@RequestParam(required = false) String searchKeyword, Model model) {
		logger.info("사원 조회 결과 화면");
		
		
		
		List<MemberVO> list = memberService.searchAllmember(searchKeyword);
		
		
		model.addAttribute("list", list);
		
	}
	
	@RequestMapping(value = "/memEdit.do", method = RequestMethod.GET)
	public void memEdit_get(@RequestParam(required = false) String memeNo, Model model) {
		logger.info("사원 수정 화면");
		
		MemberVO vo = memberService.selectMember(memeNo);
		List<DepartmentVO> deptList = etcService.DeptAll();
		List<PositionVO> posList = etcService.PosAll();
		
		model.addAttribute("deptList", deptList);
		model.addAttribute("posList", posList);
		model.addAttribute("vo", vo);
	}
	
	@RequestMapping("/memClose.do")
	public void memClose() {
		logger.info("사원 수정완료");	
	}
	
	@RequestMapping(value = "/memEdit.do", method = RequestMethod.POST)
	public String memEdit_post(@ModelAttribute MemberVO memvo, Model model) {
		logger.info("사원 수정 처리 memvo={}",memvo);
		
		int cnt = memberService.updateSelectMember(memvo);
		logger.info("사원 수정 결과  cnt={}",cnt);
		
		
		String msg = "사원수정 실패", url = "/member/memList.do";
		if(cnt > 0) {
			msg = "사원수정 성공";
			url = "/member/memClose.do";
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
	
	}
	
	@RequestMapping("/memDelete.do")
	public String memDelete(@RequestParam String memNo, Model model) {
		logger.info("사원 삭제 ");
		
		Date fireDate = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		
		MemberVO memvo = new MemberVO();
		memvo.setFiredate(sdf.format(fireDate));
		memvo.setMemNo(memNo);
		
		logger.info("memvo = {}", memvo);
		
		int cnt = memberService.deleteSelectMember(memvo);
		String msg = "사원삭제 실패", url = "/member/memEdit.do";
		if(cnt > 0) {
			msg = "사원삭제 성공";
			url = "/member/memClose.do";
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
		
	}
	
}
