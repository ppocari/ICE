package com.will.ice.mypagecontroller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MypageController {
	
	@RequestMapping("/mypage/mypage.do")
	public String mypage() {
		
		return "mypage/mypage";
	}
}
