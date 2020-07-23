package com.will.ice.mypage.contoller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.will.ice.mypage.model.MypageService;
import com.will.ice.mypage.model.MypageVO;

@Controller
@RequestMapping("/mypage")
public class MypageController {
	private static final Logger logger
		= LoggerFactory.getLogger(MypageController.class);
	@Autowired MypageService mypageService;
	
	@RequestMapping(value = "/mypage.do", method = RequestMethod.GET)
	public String mypage_get(@RequestParam String empNo,Model model) {
		logger.info("마이페이지 보여주기");
		
		MypageVO vo = mypageService.selectEmployee(empNo);
		model.addAttribute("vo",vo);
		
		return "mypage/mypage";
	}
	
	@RequestMapping(value = "/mypageEdit.do", method = RequestMethod.POST)
	public String mypage_post(@ModelAttribute MypageVO vo,Model model) {
		logger.info("마이페이지 수정하기, 파라미터 vo={}",vo);
		
		int cnt = mypageService.updateEmployee(vo);
		
		String msg = "수정실패", url = "/mypage/mypage.do";
		if(cnt > 0) {
			msg = "수정성공";
		}
		
		model.addAttribute("msg",msg);
		model.addAttribute("url",url);
		
		return "common/message";
	}
}

