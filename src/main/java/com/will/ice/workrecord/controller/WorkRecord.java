package com.will.ice.workrecord.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.will.ice.workrecord.model.WorkRecordService;
import com.will.ice.workrecord.model.WorkRecordVO;

@Controller
@RequestMapping("/workRecord")
public class WorkRecord {
	private static final Logger logger
		= LoggerFactory.getLogger(WorkRecord.class);
	
	@Autowired WorkRecordService workService;
	
	@RequestMapping(value = "/workRecord.do",method = RequestMethod.GET)		
	public void workRecord(HttpServletRequest request,Model model) {
		HttpSession session = request.getSession();
		String userName = (String)session.getAttribute("userName");
		
		logger.info("workRecord 보여주기 userName={}",userName);
		
		model.addAttribute("userName",userName);
	}
	
	@RequestMapping(value = "/workRecord.do",method = RequestMethod.POST)		
	public void SearchRecord(@RequestParam String cmtNo,
			@RequestParam Date start,@RequestParam Date end,
			HttpServletRequest request,Model model) {
		HttpSession session = request.getSession();
		String userName = (String)session.getAttribute("userName");
		
		logger.info("workRecord 보여주기 userName={}",userName);
		
		List<WorkRecordVO> list = new ArrayList<WorkRecordVO>();
		
		//일정조회
		list = workService.selectWork(cmtNo);
		WorkRecordVO vo=new WorkRecordVO();
		
		/*
		for (int i = 0; i < list.size(); i++) {
			vo=list.get(i);
		}
		
		SimpleDateFormat sdf = new SimpleDateFormat("yy-MM");
		
		
		String cmpStart = sdf.format(vo.getCmpIn());
		if(cmpStart.equals(start)) {
			
		}
		*/
		
		
		model.addAttribute("list",list);
		model.addAttribute("userName",userName);
	}
	
	
	@RequestMapping("/ajaxStart.do")
	@ResponseBody
	public String ajaxWork() {
		logger.info("ajaxWork 보여주기");
		
		Date d = new Date();
		Date d2 = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yy-MM-dd");
		SimpleDateFormat sdf2 = new SimpleDateFormat("HH:mm");
		String date = sdf.format(d);
		String date2 = sdf2.format(d2);
		
		return date2;
	}
	
	@RequestMapping("/ajaxEnd.do")
	@ResponseBody
	public String ajaxOut() {
		logger.info("ajaxOut 보여주기");
		
		Date d = new Date();
		Date d2 = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yy-MM-dd");
		SimpleDateFormat sdf2 = new SimpleDateFormat("HH:mm");
		String date = sdf.format(d);
		String date2 = sdf2.format(d2);
		
		return date2;
	}
	
	@RequestMapping("/detail.do")
	public void detail() {
		logger.info("출퇴근 상세보기");
	}
}
