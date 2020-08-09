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
import org.springframework.web.bind.annotation.RequestMethod;

import com.will.ice.resource.model.LocationVO;
import com.will.ice.resource.model.ResManageVO;
import com.will.ice.resource.model.ResourceService;

@Controller
@RequestMapping("/resource")
public class ResourceController {
	
	@Autowired
	private ResourceService service;
	
	private final Logger logger = LoggerFactory.getLogger(ResourceController.class);
	
	/* 메인 페이지 */
	@RequestMapping("/resourceMain.do")
	public String main_get(HttpServletRequest request, Model model) {
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
		
		List<ResManageVO> manageList = service.selectResManage();
		List<LocationVO> locList= service.selectLocation();
		
		model.addAttribute("manageList", manageList);
		model.addAttribute("locList", locList);
		
		return "resource/resourceMain";
		
	}
	
	/* 등록 페이지 */
	@RequestMapping(value="/addResource.do", method = RequestMethod.GET)
	public String addResource_get(HttpServletRequest request, Model model) {
		logger.info("자원관리 등록 화면");
		
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
		
		List<LocationVO> locList= service.selectLocation();
		
		model.addAttribute("locList", locList);
		
		return "resource/addResource";
		
	}
	
	@RequestMapping(value="/addResource.do", method = RequestMethod.POST)
	public String addResource_post(@ModelAttribute ResManageVO rmVo, Model model) {
		logger.info("자원관리 등록 화면 처리, rmVo={}", rmVo);
		
		int cnt=service.insertResManage(rmVo);
		
		String msg="자원 등록이 실패하였습니다!", url="/resource/addResource.do";
		if(cnt>0) {
			msg="자원이 등록되었습니다.";
			url="/resource/resourcesMain.do";
		}			
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
	}

}
