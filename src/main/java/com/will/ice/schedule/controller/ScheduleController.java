package com.will.ice.schedule.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.will.ice.schedule.model.ScheduleService;
import com.will.ice.schedule.model.ScheduleVo;

@Controller
@RequestMapping("/schedule")
public class ScheduleController {
	private static final Logger logger = LoggerFactory.getLogger(ScheduleController.class);
	@Autowired private ScheduleService scheduleService;
	
	@RequestMapping(value = "/schedule.do", method = RequestMethod.GET)
	public void calendar_get() {
		logger.info("캘린더 열기");
	}
	
	
	@RequestMapping("/ajaxWrite.do")
	@ResponseBody
	public void ajaxWrite(@ModelAttribute ScheduleVo scheduleVo,
			HttpSession session) {
		String memNo = (String) session.getAttribute("identNum");
		scheduleVo.setMemNo(memNo);
		logger.info("ajax 스케줄 등록, 파라미터 scheduleVo={},memNo={}"+scheduleVo,memNo);
		
		if(scheduleVo.getPlace() == null || scheduleVo.getPlace().isEmpty()) {
			scheduleVo.setPlace("기타");
		}
		
		int cnt = scheduleService.insertSchedule(scheduleVo);
		logger.info("스케줄 등록 결과, cnt={}",cnt);
		
	}
	
	@RequestMapping("/ajaxSelect.do")
	@ResponseBody
	public List<ScheduleVo> ajaxSelect(HttpSession session) {
		String memNo = (String) session.getAttribute("identNum");
		logger.info("ajax 스케줄 조회, 사원번호 memNo={}",memNo);
		
		List<ScheduleVo> list = new ArrayList<ScheduleVo>();
		list = scheduleService.selectSchedule(memNo);
		logger.info("조회결과 list.size={}",list.size());
		
		return list;
	}
	
}
