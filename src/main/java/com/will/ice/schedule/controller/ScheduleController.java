package com.will.ice.schedule.controller;

import java.util.ArrayList;
import java.util.List;

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

import com.will.ice.schedule.model.ScheduleService;
import com.will.ice.schedule.model.ScheduleVo;

@Controller
@RequestMapping("/schedule")
public class ScheduleController {
	private static final Logger logger = LoggerFactory.getLogger(ScheduleController.class);
	@Autowired private ScheduleService scheduleService;
	
	@RequestMapping(value = "/schedule.do", method = RequestMethod.GET)
	public void calendar_get(HttpSession session,Model model) {
		String memNo = (String) session.getAttribute("identNum");
		logger.info("ajax 스케줄 조회, 사원번호 memNo={}",memNo);
		
		List<ScheduleVo> list = new ArrayList<ScheduleVo>();
		
		list = scheduleService.selectSchedule(memNo);
		logger.info("조회결과 list.size={}",list.size());
		
		model.addAttribute("list",list);
	}
	
	
	@RequestMapping("/ajaxWrite.do")
	@ResponseBody
	public ScheduleVo ajaxWrite(@ModelAttribute ScheduleVo scheduleVo,
			HttpSession session) {
		String memNo = (String) session.getAttribute("identNum");
		scheduleVo.setMemNo(memNo);
		logger.info("ajax 스케줄 등록, 파라미터 scheduleVo={},memNo={}",scheduleVo,memNo);
		
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
	
	
	@SuppressWarnings("unlikely-arg-type")
	@RequestMapping("ajaxDetail.do")
	@ResponseBody
	public ScheduleVo ajaxDetail(@RequestParam String dbId, HttpSession session,Model model) {
		String memNo = (String) session.getAttribute("identNum");
		logger.info("ajaxDetail 파라미터 dbId={}"+dbId);
		
		ScheduleVo vo = new ScheduleVo();
		ScheduleVo detailVo  = new ScheduleVo();
		List<ScheduleVo> list = new ArrayList<ScheduleVo>();
		
		list = scheduleService.selectSchedule(memNo);
		logger.info("조회결과 list.size={}",list.size());
		
		for (int i = 0; i < list.size(); i++) {
			vo = list.get(i);
			if(dbId.equals(vo.getSchNo())) {
				detailVo = scheduleService.selectDetail(vo);
			}
			if("35".equals(vo.getSchNo())) {
				logger.info("35번입니다.");
			}
			logger.info("vo.getSchNo={}",vo.getSchNo());
		}
		
		logger.info("detailVo={}",detailVo);
		
		return detailVo;
	}
}
