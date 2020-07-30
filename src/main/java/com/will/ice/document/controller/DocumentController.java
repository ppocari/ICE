package com.will.ice.document.controller;


import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.will.ice.document.model.DocformListVO;
import com.will.ice.document.model.DocformService;
import com.will.ice.document.model.DocformVO;

@Controller
@RequestMapping("/payment")
public class DocumentController {
	private static final Logger logger = LoggerFactory.getLogger(DocumentController.class);
	
	@Autowired
	DocformService docformService;
	
	@RequestMapping(value="/write/insertForm.do",method=RequestMethod.GET)
	public void insertForm_get() {
		logger.info("폼 작성창 보여주기");
	}
	
	@RequestMapping(value="/write/insertForm.do",method=RequestMethod.POST)
	public String insertForm_post(@RequestParam String formName,@RequestParam String content,
			Model model) {
		logger.info("폼 저장 처리, 파라미터 formName={}, content={}",formName,content);
		DocformVO docformVo = new DocformVO();
		docformVo.setContent(content);
		docformVo.setFormName(formName);
		
		int cnt = docformService.insertForm(docformVo);
		logger.info("폼 등록 결과 cnt={}",cnt);
		
		String msg="양식 추가 실패!",url="/payment/write/insertForm.do";
		if(cnt>0) {
			msg="양식 등록되었습니다!";
			url="/payment/close.do";
		}
		
		model.addAttribute("msg",msg);
		model.addAttribute("url",url);
		
		return "common/message";
	}
	
	@RequestMapping("/write/setForm.do")
	public void setform(Model model) {
		logger.info("폼 목록 불러오기");
		
		List<DocformVO> formlist = docformService.selectAllForm();
		logger.info("폼 목록 조회결과 formlist={}",formlist.size());
		
		model.addAttribute("formlist",formlist);
	}
	
	@RequestMapping("/deleteForm.do")
	public String deleteForm(@ModelAttribute DocformListVO formlistVo,Model model) {
		logger.info("문서 양식 삭제, 파라미터  formlistVo={}",formlistVo);
		
		List<DocformVO> formList = formlistVo.getFormItems();
		int cnt = docformService.deleteFormMulti(formList);
		
		String msg="문서 양식 삭제 실패!", url="/payment/close.do";
		if(cnt>0) {
			msg="문서 양식 삭제되었습니다.";
		}
		
		model.addAttribute("msg",msg);
		model.addAttribute("url",url);
		
		return "common/message";
	}
}
