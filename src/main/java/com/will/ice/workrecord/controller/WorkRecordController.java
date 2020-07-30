package com.will.ice.workrecord.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat; 
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
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
		String memNo = (String) session.getAttribute("identNum");
		WorkRecordVO vo = new WorkRecordVO();
		
		List<WorkRecordVO>list = workService.selectWorkList(Integer.parseInt(memNo));
		for (int i = 0; i < list.size(); i++) {
			vo = list.get(i);
		}
		
		logger.info("workRecord 보여주기 vo={},userName={}",vo,userName);
		model.addAttribute("vo",vo);
		//model.addAttribute("list",list);
		model.addAttribute("userName",userName);
		
		return "workRecord/workRecord";
	}
	
	
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
		
		return "redirect:/workRecord/workRecord.do";
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
		logger.info("퇴근 후 vo={}"+Evo);
		
		int cnt = workService.updateWork(Evo);
		logger.info("퇴근 결과 cnt={}",cnt);
		
		
		
		model.addAttribute("Sdate",Evo.getCmpIn());
		model.addAttribute("Edate",Edate);
		model.addAttribute("Evo",Evo);
		
		return "redirect:/workRecord/workRecord.do";
	}
	
	@RequestMapping("/searchWork.do")
	public String searchWork(@DateTimeFormat (pattern = "yyyy-MM-dd") Date searchInput, HttpServletRequest request
			, Model model) {
		HttpSession session = request.getSession();
		String memNo = (String) session.getAttribute("identNum");
		WorkRecordVO searchVo = new WorkRecordVO();
		logger.info("searchInput={}"+searchInput);
		
		List<WorkRecordVO>Slist = workService.selectWorkList(Integer.parseInt(memNo));
		for (int i = 0; i < Slist.size(); i++) {
			searchVo = Slist.get(i);
		}
		logger.info("==================================searchVo={}"+searchVo);
		SimpleDateFormat sdf = new SimpleDateFormat("yy-MM-dd");
		String newDate = sdf.format(searchInput);
		String dbDate = searchVo.getCmpIn();
		Date d = new Date();
		try {
			d = sdf.parse(dbDate);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		String dbDateFormat = sdf.format(d);
		logger.info("===========================newDate={}"+newDate);
		logger.info("==========================dbDateFormat={}"+dbDateFormat);
		
		if(!newDate.equals(dbDateFormat)) {
			String msg = "조회결과가 없습니다.";
			String url = "/workRecord/workRecord.do";
			
			model.addAttribute("msg",msg);
			model.addAttribute("url",url);
			
			return "common/message";
		}
		model.addAttribute("searchVo",searchVo);
		model.addAttribute("Slist",Slist);
		return "workRecord/workRecord";
	}
	
	
	@RequestMapping("/detail.do")
	public void detail(HttpServletRequest request,Model model) {
		HttpSession session = request.getSession();
		String memNo = (String) session.getAttribute("identNum");
		logger.info("출퇴근 상세보기 memNo={}",memNo);
		
		List<WorkRecordVO>list = workService.selectWorkList(Integer.parseInt(memNo));
		WorkRecordVO Dvo = new WorkRecordVO();
		for (int i = 0; i < list.size(); i++) {
			Dvo = list.get(i);
		}
		
		
		model.addAttribute("Dvo",Dvo);
		
	}
	
}
