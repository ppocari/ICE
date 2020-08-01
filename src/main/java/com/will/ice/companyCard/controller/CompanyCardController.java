package com.will.ice.companyCard.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.will.ice.companyCard.model.ComcardService;
import com.will.ice.companyCard.model.ComcardVO;
import com.will.ice.member.model.MemberVO;
import com.will.ice.model.DepartmentVO;
import com.will.ice.model.EtcService;
import com.will.ice.model.PositionVO;

@Controller
@RequestMapping("/companyCard")
public class CompanyCardController {
	
	private static final Logger logger
		= LoggerFactory.getLogger(CompanyCardController.class);

	@Autowired private ComcardService comcardService;

	@Autowired private EtcService etcService;
	
	@RequestMapping("/comCardList.do")
	public void comCardList(Model model) {
		logger.info("법인카드 조회");
		
		List<DepartmentVO> deptList = etcService.DeptAll();
		List<PositionVO> posList = etcService.PosAll();
		
		List<ComcardVO> list = comcardService.selectAllComcard();
		
		MemberVO memvo = new MemberVO();
		for(int i=0; i<list.size(); i++) {
			ComcardVO comvo = list.get(i);
			logger.info("comvo.getMEMNO() ={}", comvo.getMEMNO());
		}
		
		model.addAttribute("deptList", deptList);
		model.addAttribute("posList", posList);
		model.addAttribute("list", list);
		model.addAttribute("memvo", memvo);
		
	}
	
	@RequestMapping("/comCardStatistic.do")
	public void comCardStatistic() {
		logger.info("법인카드 통계");
	}
	
	@RequestMapping("/comCardUpload.do")
	public void comCardUpload() {
		logger.info("법인카드 파일업로드");
	}
	
	@RequestMapping("/comCardUse.do")
	public void comCardUse() {
		logger.info("법인카드 미등록/등록");
	}
}
