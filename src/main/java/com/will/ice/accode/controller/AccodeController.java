package com.will.ice.accode.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.will.ice.accode.model.AccodeService;
import com.will.ice.accode.model.AccodeVO;
import com.will.ice.common.Depart_posi_dateVO;
import com.will.ice.common.SearchVO;


@Controller
public class AccodeController {
	private static final Logger logger 
		= LoggerFactory.getLogger(AccodeController.class);
	
	@Autowired private AccodeService accodeService;
	
	@RequestMapping("/companyCard/Accode.do")
	public void selectListAccode(@ModelAttribute SearchVO searchVO, Model model) {
		logger.info("계정과목 목록 보여주기 searchVO={}",searchVO);
		
		List<AccodeVO> list = accodeService.selectListAccode(searchVO);
		logger.info("계정과목 목록 보여주기 list.size()={}",list.size());
		
		model.addAttribute("list", list);
	}
	
}
