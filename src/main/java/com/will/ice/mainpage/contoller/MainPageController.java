package com.will.ice.mainpage.contoller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MainPageController {
	
	@RequestMapping("/mainpage/main.do")
	public String mainpage() {
		
		return "mainpage/main";
	}
	
	//경리용
	@RequestMapping("/mainpage/AccountMain.do")
	public String mainpage2() {
		
		return "mainpage/AccountMain";
	}
}
