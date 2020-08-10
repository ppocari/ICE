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
	
	
	@RequestMapping("ajaxDetail.do")
	@ResponseBody
	public ScheduleVo ajaxDetail(@RequestParam String dbId, HttpSession session,Model model) {
		String memNo = (String) session.getAttribute("identNum");
		logger.info("ajaxDetail 파라미터 dbId={}"+dbId);
		
		ScheduleVo detailVo  = null;
		List<ScheduleVo> list = new ArrayList<ScheduleVo>();
		
		list = scheduleService.selectSchedule(memNo);
		logger.info("조회결과 list.size={}",list.size());
		
		for (int i = 0; i < list.size(); i++) {
			ScheduleVo vo = list.get(i);
			
			if(dbId.equals(Integer.toString(vo.getSchNo()))) {
				detailVo = vo;
				break;
			}
		}
		
		return detailVo;
	}
	
	@RequestMapping("detailSchedule.do")
	public void detailSchedule(@ModelAttribute ScheduleVo vo ,@RequestParam String dbId,Model model) {
		logger.info("스케줄 디테일 보여주기 dbId={}",dbId);
		
		model.addAttribute("title",vo.getTitle());
		model.addAttribute("memNo",vo.getMemNo());
		model.addAttribute("content",vo.getContent());
		model.addAttribute("place",vo.getPlace());
		model.addAttribute("schNo",dbId);
		model.addAttribute("startDay",vo.getStartDay());
		model.addAttribute("endDay",vo.getEndDay());
	}
	
	@RequestMapping("scheduleClose.do")
	public void ScheduleClose() {
		logger.info("창닫기완료!");
	}
	
	@RequestMapping("deleteSchedule.do")
	public String deleteSchedule(@RequestParam String schNo , Model model) {
		int cnt = scheduleService.deleteSchedule(schNo);
		
		String msg = "삭제를 실패하였습니다.", url = "/schedule/scheduleClose.do";
		if(cnt > 0) {
			msg = "삭제완료!";
		}
		
		model.addAttribute("msg",msg);
		model.addAttribute("url",url);
		
		return "common/message";
	}
	
	@RequestMapping("scheduleUpdate.do")
	public String scheduleUpdate(@ModelAttribute ScheduleVo vo, Model model) {
		logger.info("vo={}",vo);
		logger.info("vo.getPlace={}",vo.getPlace());
		
		if(vo.getPlace().equals("1")) {
			vo.setResourceId("a");
			vo.setPlace("업무관련");
		}else if(vo.getPlace().equals("2")) {
			vo.setResourceId("b");
			vo.setPlace("기타");
		}else if(vo.getPlace().equals("3")) {
			vo.setResourceId("c");
			vo.setPlace("휴가,연차");
		}else {
			vo.setResourceId("d");
			vo.setPlace("유연근무");
		}
		
		int cnt = scheduleService.updateSchedule(vo);
		logger.info("수정 결과 cnt={}",cnt);
		
		String msg = "수정을 실패하였습니다.", url = "/schedule/scheduleClose.do";
		if(cnt > 0) {
			msg = "수정완료!";
		}
		
		model.addAttribute("msg",msg);
		model.addAttribute("url",url);
		
		return "common/message";
	}
	
	@RequestMapping("/scheduleWrite.do")
	public void scheduleWrite() {
		logger.info("스케줄 입력!");
	}
}
