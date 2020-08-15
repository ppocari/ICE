package com.will.ice.dongChart.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.will.ice.mypage.model.MypageService;
import com.will.ice.mypage.model.MypageVO;
import com.will.ice.workrecord.controller.WorkRecordController;
import com.will.ice.workrecord.model.WorkRecordService;
import com.will.ice.workrecord.model.WorkRecordVO;

@Controller
@RequestMapping("main")
public class DongChart {
	private static final Logger logger
	= LoggerFactory.getLogger(WorkRecordController.class);
	
	@Autowired WorkRecordService workService;
	@Autowired MypageService mypage;
	
	
	@RequestMapping("/userChart.do")
	public String SelectMonthChart(@RequestParam String year,@RequestParam String month,HttpSession session,Model model) {
		String memNo = (String) session.getAttribute("identNum");
		WorkRecordVO vo = new WorkRecordVO(); vo.setMemNo(memNo);
		
		MypageVO Mvo = mypage.selectEmployee(memNo);
		int pos = Mvo.getPosCode();
		
		//월별 조회
		if(year != null && !year.isEmpty() || month != null && !month.isEmpty()) {
			String ym = year+"-"+month; vo.setCmpMonth(ym);
			
			vo.setCmpStatus("지각"); int under = workService.selectMonthCount(vo);
			vo.setCmpStatus("반차"); int half = workService.selectMonthCount(vo);
			vo.setCmpStatus("초과근무"); int over = workService.selectMonthCount(vo);
			vo.setCmpStatus("퇴근"); int avg = workService.selectMonthCount(vo);
			
			model.addAttribute("under",under); model.addAttribute("half",half);
			model.addAttribute("over",over); model.addAttribute("avg",avg);
			model.addAttribute("year",year); model.addAttribute("month",month);
		}
		if(pos == 999) {
			return "main/main_admin";
		}
		if(pos == 919) {
			return "main/main_account";
		}
		if(pos == 930) {
			return "main/main_restaurant";
		}
			
		return "main/main_user";
	}
}
