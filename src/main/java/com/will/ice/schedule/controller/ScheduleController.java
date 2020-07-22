package com.will.ice.schedule.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.will.ice.schedule.model.ScheduleService;
import com.will.ice.schedule.model.ScheduleVo;

@Controller
public class ScheduleController {
	private static final Logger logger = LoggerFactory.getLogger(ScheduleController.class);
	@Autowired private ScheduleService scheduleService;
	
	@RequestMapping(value = "/schedule/schedule.do", method = RequestMethod.GET)
	public void calendar_get() {
		logger.info("캘린더 열기");
		
		
	}
	
	@RequestMapping(value = "/schedule/scheduleWrite.do", method = RequestMethod.POST)
	public String calendar_post(@ModelAttribute ScheduleVo scheduleVo,Model model) {
		logger.info("캘린더 등록 , 파라미터 scheduleVo={}",scheduleVo);
		
		int cnt = scheduleService.insertSchedule(scheduleVo);
		logger.info("스케줄 등록 결과, cnt={}",cnt);
		/*
		logger.info("스케줄 등록 결과, cnt={}",cnt);
		String msg = "등록 실패..." , 
url = "/schedule/schedule.do?scheduleStart="+scheduleVo.getScheduleStart()+"&scheduleEnd="+scheduleVo.getScheduleEnd();
		if(cnt > 0) {
			msg = "등록 성공!";
		}
		
		
		model.addAttribute("msg",msg);
		model.addAttribute("url",url);
		
		*/
		
		return "/schedule/schedule";
	}
	
}
