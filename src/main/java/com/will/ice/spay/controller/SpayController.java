package com.will.ice.spay.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
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

import com.will.ice.common.Utility;
import com.will.ice.common.DateSearchVO;
import com.will.ice.common.PaginationInfo;
import com.will.ice.member.model.MemberService;
import com.will.ice.member.model.MemberVO;
import com.will.ice.spay.model.SpayService;
import com.will.ice.spay.model.SpayVO;
import com.will.ice.spay.model.SpayViewVO;

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
	
	@RequestMapping("/port.do")
	public void port() {
		logger.info("I'm port 페이지 보여주기");
		
	}

	@RequestMapping("/sList.do")
	public void sList(@ModelAttribute DateSearchVO dateSearchVo,
			HttpSession session, Model model) {
		String identNum = (String)session.getAttribute("identNum");
		dateSearchVo.setMemNo(identNum);
		logger.info("구매 목록 파라미터 dateSearchVo={}", dateSearchVo);
		
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
		
		List<SpayViewVO> list=spayService.selectSpayView(dateSearchVo);
		logger.info("구매 내역 결과 list.size={}", list.size());
		
		int totalRecord=spayService.selectTotalRecord(dateSearchVo);
		logger.info("구매내역 조회 결과, totalRecord={}", totalRecord);
			
		pagingInfo.setTotalRecord(totalRecord);
		
		model.addAttribute("list", list);
		model.addAttribute("pagingInfo", pagingInfo);	

	}

	@RequestMapping(value="/spay.do")
	public void spay_post(HttpSession session, Model model,
			int TICPRICE, int TICQUANTITY) {
		String identNum=(String) session.getAttribute("identNum");
		
		SpayVO sVo = new SpayVO();
		sVo.setTICPRICE(TICPRICE);
		sVo.setTICQUANTITY(TICQUANTITY);
		
		MemberVO memVo=memberService.selectMember(identNum);
		logger.info("주문하기 - 회원조회 결과 vo={}", memVo);
		
		model.addAttribute("sVo", sVo);
		model.addAttribute("memVo", memVo);
		
	}
		
	@RequestMapping(value = "/sok.do", method = RequestMethod.GET)
	public void sok_get(@ModelAttribute SpayVO sVo,
			HttpSession session, Model model) {
		int MemNo=Integer.parseInt((String)session.getAttribute("MemNo"));
		String userid=(String) session.getAttribute("MemNo");
		
		int ticno = spayService.searchNum(MemNo);
		logger.info("가장최근구매내역, 파라미터 tinco={}", ticno);
		
		SpayVO vo = spayService.searchAll(ticno);
		logger.info("구매확인, 파라미터 vo={}", vo);

		MemberVO memVo = memberService.selectMember(userid);
		logger.info("구매자, 파라미터 memVo={}", memVo);
		
		model.addAttribute("memVo", memVo);
		model.addAttribute("vo", vo);
	}
	
	@ResponseBody
	@RequestMapping(value = "/sok.do", method = RequestMethod.POST)
	public String sok_post(@ModelAttribute SpayVO sVo,
			HttpSession session, Model model,
			@RequestParam int TICPRICE, @RequestParam int TICQUANTITY) {
		String MemNo=(String) session.getAttribute("MemNo");
		
		sVo.setMEMNO(MemNo);
		sVo.setTICPRICE(TICPRICE);
		sVo.setTICQUANTITY(TICQUANTITY);
		
		logger.info("구매, 파라미터 sVo={}", sVo);
		
		int cnt=spayService.insertTic(sVo);
		logger.info("주문하기 결과, cnt={}", cnt);
		
		model.addAttribute("sVo", sVo);
		
		return "spay/sok";
	}
	
	@RequestMapping("/sListAll.do")
	public String sListAll(@ModelAttribute DateSearchVO dateSearchVo,
			HttpSession session, Model model) {
		String identNum=(String) session.getAttribute("identNum");
		int MemNo=Integer.parseInt((String)session.getAttribute("MemNo"));
		logger.info("사원번호 MemNo={}", MemNo);
		if(MemNo==999999) {
			
			dateSearchVo.setMemNo(identNum);
			logger.info("구매 조회 파라미터 dateSearchVo={}", dateSearchVo);
			
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
			
			List<SpayViewVO> list=spayService.selectSpayViewAll(dateSearchVo);
			logger.info("구매 내역 결과 list.size={}", list.size());
			
			int totalRecord=spayService.selectTotalRecordAll(dateSearchVo);
			logger.info("구매내역 조회 결과, totalRecord={}", totalRecord);
				
			pagingInfo.setTotalRecord(totalRecord);
			
			model.addAttribute("list", list);
			model.addAttribute("pagingInfo", pagingInfo);	

		}else {
			return "authority";
		}
		
		return "spay/sListAll";
	}
	
}