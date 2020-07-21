package com.will.ice.spay.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class SpayController {
	
	@RequestMapping("/spay/spay.do")
	public String spay() {
		
		return "spay/spay";
	}
}