package com.will.ice.accode.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.will.ice.accode.model.AccodeListVO;
import com.will.ice.accode.model.AccodeService;
import com.will.ice.accode.model.AccodeVO;
import com.will.ice.common.PaginationInfo;
import com.will.ice.common.SearchVO;
import com.will.ice.common.Utility;


@Controller
@RequestMapping("/companyCard")
public class AccodeController {
	private static final Logger logger 
		= LoggerFactory.getLogger(AccodeController.class);
	
	@Autowired private AccodeService accodeService;
	
	@RequestMapping("/Accode.do")
	public void selectListAccode(@ModelAttribute SearchVO searchVO, Model model) {
		logger.info("계정과목 목록 보여주기 searchVO={}",searchVO);
		
		//[1] PaginationInfo 생성
		PaginationInfo pagingInfo = new PaginationInfo();
		pagingInfo.setBlockSize(Utility.BLOCKSIZE);
		pagingInfo.setRecordCountPerPage(Utility.RECORD_COUNT);
		pagingInfo.setCurrentPage(searchVO.getCurrentPage());
		
		//[2] SearchVo 에 값 셋팅
		searchVO.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());
		searchVO.setRecordCountPerPage(Utility.RECORD_COUNT);
		
		List<AccodeVO> list = accodeService.selectListAccode(searchVO);
		logger.info("계정과목 목록 보여주기 list.size()={}",list.size());
		
		int totalRecord=accodeService.selectTotalRecord(searchVO);
		logger.info("글목록, 전체 레코드 개수 : " + totalRecord);
		
		pagingInfo.setTotalRecord(totalRecord);
		
		model.addAttribute("list", list);
		model.addAttribute("pagingInfo", pagingInfo);
	}
	
	//미등록 사용내역에 계쩡코드 입력
	@RequestMapping(value = "/regAccode.do" , method = RequestMethod.POST)
	public String regAccodeList(@ModelAttribute AccodeListVO accListVO, Model model) {
		logger.info("계정코드 등록 accListVO={}", accListVO);
		
		int cnt = 0;
		

		try {
			List<AccodeVO> accList = accListVO.getAccItems();
			cnt = accodeService.accRegisterMulti(accList);

			String msg = "계정코드 등록 실패 !", url = "/companyCard/comCardUse.do";
			if(cnt > 0) {
				msg = "계정코드 등록 성공!";
				url = "/companyCard/comCardList.do";

			}
			model.addAttribute("msg", msg);
			model.addAttribute("url", url);

		}catch (Exception e) {
			e.printStackTrace();
		}

		return "/common/message"; 
		  
	}
}
