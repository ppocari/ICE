package com.will.ice.workrecord.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
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
import org.springframework.web.bind.annotation.RequestMethod;

import com.will.ice.workrecord.model.WorkRecordService;
import com.will.ice.workrecord.model.WorkRecordVO;

@Controller
@RequestMapping("/workRecord")
public class WorkRecordController {
	private static final Logger logger
		= LoggerFactory.getLogger(WorkRecordController.class);
	
	@Autowired WorkRecordService workService;
	
	@RequestMapping(value = "/workRecord.do",method = RequestMethod.GET)		
	public String workRecord(HttpServletRequest request,Model model) {
		HttpSession session = request.getSession();
		String userName = (String)session.getAttribute("userName");
		
		logger.info("workRecord 보여주기 userName={}",userName);
		model.addAttribute("userName",userName);
		
		return "workRecord/workRecord";
	}
	
	/*
	@RequestMapping(value = "/workRecord.do",method = RequestMethod.POST)		
	public String SearchRecord(HttpServletRequest request,Model model) {
		HttpSession session = request.getSession();
		String userName = (String)session.getAttribute("userName");
		String memNo = (String) session.getAttribute("identNum");
		logger.info("workRecord 보여주기 userName={}",userName);
		
		WorkRecordVO vo = new WorkRecordVO();
		if(vo.getCmpIn() != null && vo.getCmpIn().isEmpty()) {
			List<WorkRecordVO>list = workService.selectWorkList(Integer.parseInt(memNo));
			logger.info("조회결과 list.size={}",list.size());
			for (int i = 0; i < list.size(); i++) {
				vo = list.get(i);
			}
			model.addAttribute("userName",userName);
			model.addAttribute("vo",vo);
			return "workRecord/workRecord";
		}
		
		return "workRecord/workRecord";
	}
	*/
	
	//출근
	@RequestMapping("/start.do")
	public String start(@ModelAttribute WorkRecordVO Svo,HttpServletRequest request,
			Model model) {
		HttpSession session = request.getSession();
		String memNo = (String) session.getAttribute("identNum");
		Svo.setMemNo(memNo);
		logger.info("출근!! , 파라미터 memNo={},Svo={}"+Svo,memNo);
		
		//현재 시간으로 출근시간 셋팅
		Date d = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yy-MM-dd HH:mm");
		String Sdate = sdf.format(d);
		Svo.setCmpIn(Sdate); Svo.setCmpStatus("출근");
		
		int cnt = workService.insertWork_status(Svo);
		logger.info("출근 결과 cnt={}"+cnt);
		
		model.addAttribute("Svo",Svo);
		model.addAttribute("Sdate",Sdate);
		
		return "workRecord/workRecord";
	}
	
	//퇴근
	@RequestMapping("/end.do")
	public String end(@ModelAttribute WorkRecordVO Evo,HttpServletRequest request,
			Model model) {
		HttpSession session = request.getSession();
		String memNo = (String) session.getAttribute("identNum");
		Evo.setMemNo(memNo);
		logger.info("퇴근!! , 파라미터 memNo={},Evo={}"+Evo,memNo);
		
		//조회
		List<WorkRecordVO>list = workService.selectWorkList(Integer.parseInt(memNo));
		logger.info("조회결과 list.size={}"+list.size());
		for (int i = 0; i < list.size(); i++) {
			Evo = list.get(i);
		}
		
		//현재 시간으로 퇴근시간 셋팅
		Date d = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yy-MM-dd HH:mm");
		String Edate = sdf.format(d);
		Evo.setCmpStatus("퇴근"); Evo.setCmpOut(Edate);
		
		int cnt = workService.updateWork(Evo);
		logger.info("퇴근 결과 cnt={}",cnt);
		
		model.addAttribute("Edate",Edate);
		model.addAttribute("Evo",Evo);
		
		return "workRecord/workRecord";
	}
	
	
}
