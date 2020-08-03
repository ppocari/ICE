package com.will.ice.companyCard.controller;

import java.util.List;

import org.apache.commons.io.filefilter.FalseFileFilter;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.will.ice.accode.model.AccodeService;
import com.will.ice.accode.model.AccodeVO;
import com.will.ice.companyCard.model.ComcardService;
import com.will.ice.companyCard.model.ComcardVO;
import com.will.ice.member.model.MemberVO;
import com.will.ice.model.DepartmentVO;
import com.will.ice.model.EtcService;
import com.will.ice.model.PositionVO;
import com.will.ice.model.SearchYearMonthVO;

@Controller
@RequestMapping("/companyCard")
 public class CompanyCardController {
	private static final Logger logger 
		= LoggerFactory.getLogger(CompanyCardController.class);

	@Autowired private ComcardService comcardService;

	@Autowired private EtcService etcService;
	@Autowired private AccodeService accodeService;
	
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
	

	
	@RequestMapping(value ="/comCardUse.do", method = RequestMethod.GET)
	public void comCardUse_get() {
		logger.info("법인카드 미등록/등록 ");
		
		
	}
	
	@RequestMapping(value ="/comCardUse.do", method = RequestMethod.POST)
	public void comCardUse_post(@RequestParam String year, @RequestParam String month, Model model) {
		logger.info("법인카드 미등록/등록 year={}, month={}",year, month);
		
		if(month.length()==1) {
			month = "0"+month;
		}
		int end_month =Integer.parseInt(month)+1;
		
		String begin_ym = year+"-"+month+"-01";	//2020-07-01
		String end_ym = year+"-"+end_month+"-01";	////2020-08-01
				
		SearchYearMonthVO ymvo = new SearchYearMonthVO(begin_ym, end_ym);	//생성자 만들어 놓으면 자동으로 set됨
		logger.info("법인카드 미등록/등록 ymvo={}",ymvo);
		
		// 계정코드가 없는 것들만 읽어온다
		List<ComcardVO> list = comcardService.selectUnUseComcard(ymvo);
		logger.info("법인카드 미등록/등록 list.size()={}",list.size());
		
		model.addAttribute("list", list);
		
	}
	
	@RequestMapping(value ="/comCardAjax.do", method = RequestMethod.GET)
	@ResponseBody
	public ComcardVO comCardAjax(@RequestParam(defaultValue = "0") int comcard_no) {
		logger.info("법인카드 미등록->등록 이동 comcard_no={}", comcard_no);
		
		ComcardVO comvo = comcardService.selectNoComcard(comcard_no);
		logger.info("법인카드 미등록->등록 이동 comvo={}", comvo);
		return comvo;
	}
	
	
	
	@RequestMapping(value = "/comCardAccode.do", method = RequestMethod.GET)
	public void comCardAccode_get() {
		logger.info("법인카드 ");
		
		
	}
	
	@RequestMapping(value = "/comCardAccode.do", method = RequestMethod.POST)
	public void comCardAccode_post(@RequestParam(required = false) String useplace, Model model) {
		logger.info("법인카드 useplace={}",useplace);
		
		List<AccodeVO> list = accodeService.selectAccode(useplace);
		logger.info("계정코드 list.size={} ",list);
		
		model.addAttribute("list", list);
	}
	
	
	@RequestMapping(value ="/comCardUpload.do", method = RequestMethod.GET)
	public void comCardUpload_get() {
		logger.info("법인카드 미등록/등록 ");
		
		
	}
		
	
}