package com.will.ice.companyCard.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

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

import com.will.ice.common.DateSearchVO;
import com.will.ice.common.Depart_posi_dateVO;
import com.will.ice.common.FileUploadUtil;
import com.will.ice.companyCard.model.ComCardFileVO;
import com.will.ice.companyCard.model.ComCardListVO;
import com.will.ice.companyCard.model.ComcardService;
import com.will.ice.companyCard.model.ComcardVO;
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

	@Autowired private FileUploadUtil fileUploadUtil;


	@RequestMapping("/comCardList.do")
	public void comCardList(@ModelAttribute Depart_posi_dateVO dpdvo, Model model) {
		logger.info("법인카드 조회 dpdvo={}",dpdvo);

		List<DepartmentVO> deptList = etcService.DeptAll();
		List<PositionVO> posList = etcService.PosAll();

		List<ComcardVO> list = comcardService.selectListComcard(dpdvo);



		model.addAttribute("deptList", deptList);
		model.addAttribute("posList", posList);
		model.addAttribute("list", list);
		model.addAttribute("dpdvo", dpdvo);

	}



	@RequestMapping(value ="/comCardUse.do", method = RequestMethod.GET)
	public void comCardUse_get() {
		logger.info("법인카드 미등록/등록 ");


	}

	@RequestMapping(value ="/comCardUse.do", method = RequestMethod.POST)
	public void comCardUse_post(@RequestParam(required = false) String year,
			@RequestParam(required = false) String month, Model model) {
		logger.info("법인카드 미등록/등록 year={},  month={}",year,month);

		if(month.length()==1) {
			month = "0"+month;
		}
		String end_month = Integer.toString(Integer.parseInt(month)+1);
		if(end_month.length()==1) {
			end_month = "0"+end_month;
		}

		String startDay = year+"-"+month+"-01";	//2020-07-01
		String endDay = year+"-"+end_month+"-01";	////2020-08-01

		DateSearchVO search_dsvo = new DateSearchVO();
		search_dsvo.setStartDay(startDay);
		search_dsvo.setEndDay(endDay);
		logger.info("법인카드 미등록/등록 search_dsvo={}",search_dsvo);

		// 계정코드가 없는 것들만 읽어온다
		List<ComcardVO> list = comcardService.selectUnUseComcard(search_dsvo);
		logger.info("법인카드 미등록/등록 list.size()={}",list.size());
		logger.info("법인카드 미등록/등록 list={}",list);

		model.addAttribute("list", list);
		model.addAttribute("year", year);
		model.addAttribute("month", month);

	}

	@RequestMapping(value ="/comCardAjax.do", method = RequestMethod.GET)
	@ResponseBody
	public ComcardVO comCardAjax(@RequestParam(defaultValue = "0") int comcard_no) {
		logger.info("법인카드 미등록->등록 이동 comcard_no={}", comcard_no);

		ComcardVO comvo = comcardService.selectNoComcard(comcard_no);
		logger.info("법인카드 미등록->등록 이동 comvo={}", comvo);
		return comvo;
	}



	//excel 파일 화며
	@RequestMapping(value ="/comCardUpload.do", method = RequestMethod.GET)
	public void comUpload_get() {
		logger.info("법인카드 내역 업로드 ");
	}

	@RequestMapping(value ="/comCardUpload.do", method = RequestMethod.POST)
	public String comUpload_post(@ModelAttribute ComCardListVO ccListVO,
			HttpServletRequest request , Model model) {
		logger.info("법인카드 내역 업로드 처리 ccListVO={}",ccListVO);

		int cnt = 0;
		try {
			
			ComCardFileVO ccfvo = comcardService.selectCCFile_recent();
			

			List<ComcardVO> ccList = ccListVO.getComCardItmes();
			cnt = comcardService.insertCCMulti(ccList, ccfvo);

			String msg = "법인카드 내역 업로드 성공실패!", url = "/member/memWrite.do";
			if(cnt > 0) {
				msg = "법인카드 내역 업로드 성공!";
				url = "/companyCard/comCardUse.do";

			}
			model.addAttribute("msg", msg);
			model.addAttribute("url", url);

		}catch (Exception e) {
			e.printStackTrace();
		}

		return "/common/message";


	}




}