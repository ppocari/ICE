package com.will.ice.spay.controller;

import java.util.List;
import java.util.Map;

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

import com.will.ice.member.model.MemberService;
import com.will.ice.member.model.MemberVO;
import com.will.ice.spay.model.SpayService;
import com.will.ice.spay.model.SpayVO;

@Controller
@RequestMapping("/spay")
public class SpayController {
	
	private static final Logger logger
	=LoggerFactory.getLogger(SpayController.class);
	
	@Autowired private MemberService memberService;
	@Autowired private SpayService spayService;
	
	@RequestMapping("/sbuy.do")
	public void sbuy() {
		logger.info("구입 페이지 보여주기");
	
	}

	@RequestMapping("/sList.do")
	public String sList(HttpSession session, Model model) {
		int MemNo=Integer.parseInt((String)session.getAttribute("MemNo"));
		
		List<Map<String, Object>> sVo=spayService.selectSpayView(MemNo);
		logger.info("구매 내역 결과 vo={}", sVo);
		
		model.addAttribute("sVo", sVo);
		
		return "/spay/sList";
	}

	@RequestMapping(value="/spay.do", method=RequestMethod.GET)
	public String spay_get(HttpSession session, Model model,
			int TICPRICE, int TICQUANTITY) {
		String userid=(String) session.getAttribute("userid");
		
		logger.info("주문하기 - 조회, 파라미터 userid={}", userid);
		
		MemberVO memVo=memberService.selectMember(userid);
		logger.info("주문하기 - 회원조회 결과 vo={}", memVo);

		SpayVO sVo = new SpayVO();
		sVo.setTICPRICE(TICPRICE);
		sVo.setTICQUANTITY(TICQUANTITY);
		int cnt=spayService.insertTic(sVo);
		logger.info("주문하기 - 데이터 결과 cnt={}", cnt);

		model.addAttribute("memVo", memVo);
		model.addAttribute("sVo", sVo);
		
		return "spay/spay";	
	}
	
	@RequestMapping(value="/spay.do", method=RequestMethod.POST)
	public String sbuy_post(HttpSession session, Model model, SpayVO sVo,
			int TICPRICE, int TICQUANTITY) {
		String userName=(String) session.getAttribute("userName");
		
		logger.info("주문하기, 파라미터 TICPRICE={}, TICQUANTITY={}", TICPRICE, TICQUANTITY );
		
		int cnt=spayService.insertTic(sVo);
		logger.info("주문하기 결과, cnt={}", cnt);
		
		return "redirect:/spay/sok.do?userName=" + sVo.getTICNO();
	}
		
	@RequestMapping("/spay/sok.do")
	public void sok(@RequestParam(defaultValue = "0") 
		int MEMNO, Model model) {
		logger.info("주문완료 페이지, 파라미터 orderNo={}", MEMNO);
		
		List<Map<String, Object>> map=spayService.selectSpayView(MEMNO);
		logger.info("주문완료 - 상세주문 내역 조회 결과, map={}", map);
		
		model.addAttribute("orderMap", map);
		
	}
	
}