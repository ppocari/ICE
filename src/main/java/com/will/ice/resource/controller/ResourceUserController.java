package com.will.ice.resource.controller;

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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.will.ice.address.model.AddressUtility;
import com.will.ice.common.FileUploadUtil;
import com.will.ice.common.PaginationInfo;
import com.will.ice.resource.model.ResManageSearchVO;
import com.will.ice.resource.model.ResManageVO;
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
	
	@RequestMapping("/reserveResource.do")
	public void reserve_get(@RequestParam int resNo, HttpServletRequest request,
			Model model) {
		logger.info("자원예약신청 화면, 파라미터 resNo={}", resNo);
		
		ResManageVO rmVo = service.selectResManageOne(resNo);
		
		model.addAttribute("rmVo", rmVo);
	}
	
	@RequestMapping("/ajaxWrite.do")
	@ResponseBody
	public ScheduleVo ajaxWrite(@ModelAttribute ScheduleVo scheduleVo, @RequestParam int resNo,
			HttpSession session) {
		String memNo = (String) session.getAttribute("identNum");
		scheduleVo.setMemNo(memNo);
		logger.info("ajax 임시방편, 파라미터 scheduleVo={},memNo={}",scheduleVo,memNo);
		
		if(scheduleVo.getPlace().equals("1")) {
			scheduleVo.setResourceId("a");
			scheduleVo.setPlace("업무관련");
		}else if(scheduleVo.getPlace().equals("2")) {
			scheduleVo.setResourceId("b");
			scheduleVo.setPlace("기타");
		}else if(scheduleVo.getPlace().equals("3")) {
			scheduleVo.setResourceId("c");
			scheduleVo.setPlace("휴가,연차");
		}else {
			scheduleVo.setResourceId("d");
			scheduleVo.setPlace("유연근무");
		}
		
		int cnt = scheduleService.insertSchedule(scheduleVo);
		logger.info("스케줄 등록 결과, cnt={}",cnt);
		
		ScheduleVo vo = scheduleService.selectRownum(memNo);
		
		return vo;
	}
	
	/*
	 * HttpSession session=(HttpSession) request.getSession(); String
	 * memNo=(String)session.getAttribute("idenNum");
	 */}
