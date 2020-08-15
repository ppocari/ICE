package com.will.ice.resource.controller;

import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.will.ice.address.model.AddressUtility;
import com.will.ice.common.FileUploadUtil;
import com.will.ice.common.PaginationInfo;
import com.will.ice.resource.model.ResKindVo;
import com.will.ice.resource.model.ResManageSearchVO;
import com.will.ice.resource.model.ResManageVO;
import com.will.ice.resource.model.ResReserveVO;
import com.will.ice.resource.model.ResourceService;
import com.will.ice.schedule.model.ScheduleService;
import com.will.ice.schedule.model.ScheduleVo;

@Controller
@RequestMapping("/resourceUser")
public class ResourceUserController {

	@Autowired
	private ResourceService service;
	
	@Autowired
	private ScheduleService scheduleService;

	@Autowired private FileUploadUtil fileUploadUtil;

	
	private final Logger logger = LoggerFactory.getLogger(ResourceController.class);

	/* 메인 페이지 */
	@RequestMapping("/resourceMain.do")
	public String main_get(@ModelAttribute ResManageSearchVO rmsVo, 
			HttpServletRequest request, Model model) {
		logger.info("자원관리 메인 화면");

		HttpSession session= request.getSession();
		String memNo = (String)session.getAttribute("identNum");

		String msg="먼저 로그인하세요!";
		String url="/log/login.do";
		if(memNo==null || memNo.isEmpty()) {
			model.addAttribute("msg", msg);
			model.addAttribute("url", url);

			return "common/message";
		}

		logger.info("파라미터 memNo={}", memNo);

		//[1] PaginationInfo 
		PaginationInfo pagingInfo = new PaginationInfo();
		pagingInfo.setBlockSize(AddressUtility.BLOCKSIZE);
		pagingInfo.setRecordCountPerPage(AddressUtility.RECORD_COUNT);
		pagingInfo.setCurrentPage(rmsVo.getCurrentPage());

		//[2] SearchVo 
		rmsVo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());
		rmsVo.setRecordCountPerPage(AddressUtility.RECORD_COUNT);
		logger.info("db 처리 전 rmsVo={}", rmsVo);

		List<ResManageVO> manageList = service.selectResManager(rmsVo);
		logger.info("자원관리 조회 결과, list.size={}", manageList.size());

		int totalRecord=service.selectTotalRecord(); 
		logger.info("전체 레코드 : " +	totalRecord);

		pagingInfo.setTotalRecord(totalRecord);

		//3 
		model.addAttribute("pagingInfo", pagingInfo);
		model.addAttribute("manageList", manageList);

		return "resourceUser/resourceMain";
	}
	
	@RequestMapping(value="/addReservation.do", method = RequestMethod.GET)
	public void reserve_get(@RequestParam int resNo, HttpServletRequest request,
			Model model) {
		logger.info("자원예약신청 화면, 파라미터 resNo={}", resNo);
		
		ResManageVO rmVo = service.selectResManageOne(resNo);
		logger.info("조회결과 rmVo={}",rmVo);

		List<ResReserveVO> rvResNoList = service.selectReserveResNo(rmVo.getResNo());
		logger.info("조회결과 rvResNoList.size={}",rvResNoList.size());
		
		
		model.addAttribute("rvResNoList", rvResNoList);
		model.addAttribute("rmVo", rmVo);
	}
	
	/* 시작 날짜 선택 시 시작 select 자동 처리  */
	@RequestMapping("/ajaxStartPicker.do")
	@ResponseBody
	public List<ResReserveVO> ajaxStart(@RequestParam String pickStart, @RequestParam int resNo) {		
		logger.info("시작 날짜 선택 시 select 자동 처리, 파라미터 resNo={}, pickStart={}", resNo, pickStart);
		
		//ResReserveVo에 셋팅
		ResReserveVO seVo = new ResReserveVO(resNo, pickStart);
		
		List<ResReserveVO> hourList = service.selectStartAvailableHour(seVo);
		logger.info("hourList={}", hourList.size());
		for(ResReserveVO vo : hourList) {
			logger.info("vo.getRvNo()="+vo.getRvNo());
			logger.info("vo.getRvStart()="+vo.getRvStart());
			logger.info("vo.getRvEnd()="+vo.getRvEnd());
		}
		return hourList;
	}
	
	/* 시작 시간 선택 시 끝 날짜 및 select 자동 처리  */
	@RequestMapping("/ajaxEndPicker.do")
	@ResponseBody
	public ResReserveVO ajaxEnd(@RequestParam String pickStart, @RequestParam int resNo) {		
		logger.info("시작 시간 선택 시 끝 날짜 및 select 자동 처리, 파라미터 resNo={}, pickStart={}", resNo, pickStart);
		
		//ResReserveVo에 셋팅
		ResReserveVO seVo = new ResReserveVO(resNo, pickStart);
		
		ResReserveVO rsVo = service.selectEndAvailableHour(seVo);
		if(rsVo!=null) {
			logger.info("rsVo.getRvStart()="+rsVo.getRvStart());
		}
		
		return rsVo;
	}
	
	@RequestMapping(value="/addReservation.do", method = RequestMethod.POST)
	public String reserve_post(@ModelAttribute ResReserveVO rsVo, HttpServletRequest request,
			Model model) {
		
		 HttpSession session= request.getSession(); 
		 String memNo=(String)session.getAttribute("identNum");
		rsVo.setMemNo(memNo);
		
		logger.info("자원예약 신청 처리, rsVo={}", rsVo);
		
		String startStr= rsVo.getStartDate();
		startStr+=" "+rsVo.getStartHour()+":00";
		String endStr=rsVo.getEndDate();
		endStr+=" "+rsVo.getEndHour()+":00";
		
		Timestamp rvStart=  Timestamp.valueOf(startStr);
		Timestamp rvEnd=  Timestamp.valueOf(endStr);

		rsVo.setRvStart(rvStart);
		rsVo.setRvEnd(rvEnd);
		
		int cnt= service.insertResReserve(rsVo);
		String msg="자원예약 신청 실패하였습니다.";
		String url="/resourceUser/addReservation.do?resNo="+rsVo.getResNo();
		
		if(cnt>0) {
			logger.info("자원예약 신청 처리 완료!");
			msg="자원예약 신청이 접수되었습니다.";
			url="/resourceUser/resourceMain.do";
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
		
	}
}
	
	
