package com.will.ice.spay.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
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

import com.will.ice.common.Utility;
import com.will.ice.common.DateSearchVO;
import com.will.ice.common.PaginationInfo;
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
	public void sList(@ModelAttribute DateSearchVO dateSearchVo,
			HttpSession session, Model model) {
		int MemNo=Integer.parseInt((String)session.getAttribute("MemNo"));
		String identNum = (String)session.getAttribute("identNum");
		dateSearchVo.setMemNo(identNum);
		logger.info("구매 내역 파라미터 dateSearchVo={}", dateSearchVo);
		
		PaginationInfo pagingInfo = new PaginationInfo();
		pagingInfo.setBlockSize(Utility.BLOCKSIZE);
		pagingInfo.setCurrentPage(dateSearchVo.getCurrentPage());
		pagingInfo.setRecordCountPerPage(Utility.RECORD_COUNT);
		
		dateSearchVo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());
		dateSearchVo.setRecordCountPerPage(Utility.RECORD_COUNT);
		
		String startDay=dateSearchVo.getStartDay();
		if(startDay==null || startDay.isEmpty()) {
			Date today = new Date();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			String str=sdf.format(today);
			dateSearchVo.setStartDay(str);
			dateSearchVo.setEndDay(str);			
		}
		
		int totalRecord=spayService.selectDay(dateSearchVo);
			logger.info("구매내역 개수 조회 결과, totalRecord={}", totalRecord);
			
			pagingInfo.setTotalRecord(totalRecord);
		
		
		List<Map<String, Object>> list=spayService.selectSpayView(MemNo);
		logger.info("구매 내역 결과 vo={}", list);
		
		model.addAttribute("list", list);
		model.addAttribute("pagingInfo", pagingInfo);	

	}

	@RequestMapping(value="/spay.do", method=RequestMethod.GET)
	public String spay_get(HttpSession session, Model model,
			int TICPRICE, int TICQUANTITY) {
		int MemNo=Integer.parseInt((String)session.getAttribute("MemNo"));
		String identNum=(String) session.getAttribute("identNum");
		
		logger.info("주문하기 - 조회, 파라미터 identNum={}", MemNo);
		
		MemberVO memVo=memberService.selectMember(identNum);
		logger.info("주문하기 - 회원조회 결과 vo={}", memVo);

		SpayVO sVo = new SpayVO();
		sVo.setTICPRICE(TICPRICE);
		sVo.setTICQUANTITY(TICQUANTITY);
		List<Map<String, Object>> cnt=spayService.selectSpayView(MemNo);
		logger.info("주문하기 - 데이터 결과 cnt={}", cnt);

		model.addAttribute("memVo", memVo);
		model.addAttribute("sVo", sVo);
		
		return "spay/spay";	
	}
	
	@RequestMapping(value="/spay.do", method=RequestMethod.POST)
	public String spay_post(HttpSession session, Model model,
			SpayVO sVo) {
		String MemNo=(String) session.getAttribute("MemNo");
		String identNum=(String) session.getAttribute("identNum");
		sVo.setMEMNO(MemNo);
		logger.info("주문하기, 파라미터 sVo={}", sVo);
		
		int cnt=spayService.insertTic(sVo);
		logger.info("주문하기 결과, cnt={}", cnt);
		
		MemberVO memVo=memberService.selectMember(identNum);
		logger.info("주문하기 - 회원조회 결과 vo={}", memVo);
		
		model.addAttribute("sVo", sVo);
		model.addAttribute("memVo", memVo);
		
		return "spay/spay";
		
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