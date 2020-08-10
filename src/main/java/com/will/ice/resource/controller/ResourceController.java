package com.will.ice.resource.controller;

import java.util.List;
import java.util.Map;

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

import com.will.ice.common.FileUploadUtil;

import com.will.ice.resource.model.ResManageVO;
import com.will.ice.resource.model.ResourceService;

@Controller
@RequestMapping("/resource")
public class ResourceController {

	@Autowired
	private ResourceService service;

	@Autowired private FileUploadUtil fileUploadUtil;


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


		model.addAttribute("manageList", manageList);


		return "resource/resourceMain";

	}

	/* 등록 페이지 */
	@RequestMapping(value="/addResource.do", method = RequestMethod.GET)
	public String addResource_get(@ModelAttribute ResManageVO rmVo, 
			HttpServletRequest request, Model model) {

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


		return "resource/addResource";

	}

	@RequestMapping(value="/addResource.do", method = RequestMethod.POST)
	public String addResource_post(@ModelAttribute ResManageVO rmVo, Model model,
			HttpServletRequest request) {

		logger.info("자원관리 등록 화면 처리, rmVo={}", rmVo);


		List<Map<String, Object>> list =fileUploadUtil.fileUpload(request,
				FileUploadUtil.PATH_RESOURCE_FILE);

		String fileName="", originalFileName=""; long fileSize=0;

		for(Map<String , Object> map : list) { 
			fileName=(String)map.get("fileName"); 
			fileSize=(Long) map.get("fileSize");
			originalFileName=(String) map.get("originalFileName"); 
		}

		rmVo.setResImage(fileName);
		rmVo.setResSize(fileSize);
		rmVo.setResOriginalImage(originalFileName);


		int cnt=service.insertResManage(rmVo);

		String msg="자원 등록이 실패하였습니다!", url="/resource/addResource.do";
		if(cnt>0) {
			msg="자원이 등록되었습니다.";

			url="/resource/resourceClose.do";

		}			

		model.addAttribute("msg", msg);
		model.addAttribute("url", url);

		return "common/message";

	}

	@RequestMapping("/resourceClose.do") 
	public void resWindowClose() {
		logger.info("자원 관리 등록 처리 완료!");

	}

}
