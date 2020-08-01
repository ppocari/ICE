package com.will.ice.workrecord.controller;

import java.text.ParseException; 
import java.text.SimpleDateFormat; 
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.will.ice.workrecord.model.WorkRecordService;
import com.will.ice.workrecord.model.WorkRecordVO;

@Controller
@RequestMapping("/workRecord")
public class WorkRecordController {
	private static final Logger logger
		= LoggerFactory.getLogger(WorkRecordController.class);
	
	
	
	@Autowired WorkRecordService workService;
	
	@RequestMapping(value = "/workRecord.do",method = RequestMethod.GET)		
	public String workRecord_get(HttpServletRequest request,Model model) {
		//사원번호,이름 셋팅
		HttpSession session = request.getSession();
		String userName = (String)session.getAttribute("userName");
		String memNo = (String) session.getAttribute("identNum");
		
		WorkRecordVO vo = workService.selectToday(memNo);
		/*
		 <select id="selectToday" resultType="WorkRecordVO" parameterType="String">
		select * from workRecord 
        where memno=#{memNo} and cmp_out is not null
		</select>
		  
		  내 포스트잇 왜 무시해 ....
		  
		 
		 */
		
		logger.info("workRecord 보여주기 vo={},userName={}",vo,userName);
		model.addAttribute("vo",vo);
		model.addAttribute("userName",userName);
		
		return "workRecord/workRecord";
	}
	
	/*
	@RequestMapping(value = "/workRecord.do",method = RequestMethod.POST)		
	public String workRecord_post(HttpServletRequest request,Model model) {
		//사원번호,이름 셋팅
		HttpSession session = request.getSession();
		String userName = (String)session.getAttribute("userName");
		String memNo = (String) session.getAttribute("identNum");
		WorkRecordVO vo = new WorkRecordVO();
		vo.setMemNo(memNo);
		
		List<WorkRecordVO>list = workService.selectWorkList(vo);
		
		logger.info("workRecord 보여주기 vo={},userName={}",vo,userName);
		model.addAttribute("vo",vo);
		model.addAttribute("list",list);
		model.addAttribute("userName",userName);
		
		return "workRecord/workRecord";
	}
	*/
	
	
	//출근
	@RequestMapping("/start.do")
	public String start(@ModelAttribute WorkRecordVO Svo,HttpServletRequest request,
			Model model) {
		//사원번호 셋팅
		HttpSession session = request.getSession();
		String memNo = (String) session.getAttribute("identNum");
		Svo.setMemNo(memNo);
		logger.info("출근!! , 파라미터 memNo={},Svo={}"+Svo,memNo);
		
		//출근
		//현재 시간으로 출근시간 셋팅
		Date d = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("HH:mm");
		String Sdate = sdf.format(d);
		Svo.setCmpIn(Sdate); 
		
		//9시 셋팅
		Date er = new Date();
		SimpleDateFormat sdf2 = new SimpleDateFormat("09:00");
		String error = sdf2.format(d);
		
		//CmpRegdate 현재날짜로 셋팅
		Svo.setCmpRegdate(d);
		
		/*
		 * 
		 * cmp_regdate yyyy-mm-dd 형식으로 저장으로 바꿔줘....
		 * 
		 * 그리고 date랑 sdf를 너무 많이 써서 헷갈리니까  맨위에 private 밑에다가 모아두고 가져다가 쓰는걸로 바꿨으면 좋겠어
		 */
		
		// cmp_month 셋팅
		SimpleDateFormat sdf4 = new SimpleDateFormat("yyyy-MM");
		String date = sdf4.format(Svo.getCmpRegdate());
		Svo.setCmpMonth(date);
		
		
		//6~9시 아닌 시간에 출근시 결근
		try {
			d = sdf.parse(Sdate); //출근버튼 클릭
			er = sdf2.parse(error); // 오늘날짜 9시 정각
		} catch (ParseException e1) {
			e1.printStackTrace();
		} 
		if(er.after(d)){//결근
			Svo.setCmpStatus("결근");
		}else {
			Svo.setCmpStatus("출근");
		}
		logger.info("status={}"+Svo.getCmpStatus());
		
		
		int cnt = workService.insertWork_status(Svo);
		logger.info("출근 결과 cnt={}"+cnt);
		
		model.addAttribute("Svo",Svo);
		model.addAttribute("Sdate",Sdate);
		
		return "redirect:/workRecord/workRecord.do";
	}
	
	//퇴근
	@RequestMapping("/end.do")
	public String end(@ModelAttribute WorkRecordVO Evo,HttpServletRequest request,
			Model model) {
		//사원번호 셋팅
		HttpSession session = request.getSession();
		String memNo = (String) session.getAttribute("identNum");
		Evo.setMemNo(memNo);
		logger.info("퇴근!! , 파라미터 memNo={}, Evo={}", memNo, Evo);
		
		// cmp_month 셋팅
		SimpleDateFormat sdf3 = new SimpleDateFormat("MM");
		String date = sdf3.format(Evo.getCmpRegdate());
		Evo.setCmpMonth(date);
		
		/* 조회 이거 영역 나누기로 했잖아... 당신 내말 이해 못했지....
		//조회
		List<WorkRecordVO>list = workService.selectWorkList(Evo);
		logger.info("조회결과 list.size={}"+list.size());
		for (int i = 0; i < list.size(); i++) {
			Evo = list.get(i);
		}
		*/
		
		//현재 시간으로 퇴근시간 셋팅
		Date d = new Date();
		SimpleDateFormat sdf2 = new SimpleDateFormat("HH:mm");
		String Edate = sdf2.format(d);
		Evo.setCmpOut(Edate);
		
		//결근시 결근으로 저장
		if(Evo.getCmpStatus().equals("결근")) {
			Evo.setCmpStatus("결근");
		}else {
			Evo.setCmpStatus("퇴근");
		}
		logger.info("퇴근 후 vo={}"+Evo);
		
		
/**
 	<update id="updateWork" parameterType="WorkRecordVO">
		update workRecord 
		set cmp_out=#{cmpOut}, cmp_status=#{cmpStatus}
		where memno=#{memNo} 
	</update>
	
	cmp_status 이거를 출근 퇴근 , 결근 , 이걸로 상태 표시 하기에는 시간 계산으로 판단 할 수 없잖아
	cmp_status 는 시간 계산 할걸로 바꿩 제발
	18:00 - 9:00 -> 9시간
	그리고 나중에 조회 에서 숫자를 불러서 거기서  
	if( (cmp_status-1, 점심시간 제외) > 8){
		야근
	}else if ((cmp_status-1, 점심시간 제외) < 8){
		이상(반차)
		관리자에게 결재를 보낼 수 있도록 결재하기로 이동할 수 있는 버튼 활성화
	}else{
		정상(??출근??)
	}
 */
		
		int cnt = workService.updateWork(Evo);
		logger.info("퇴근 결과 cnt={}",cnt);
		
		
		model.addAttribute("Sdate",Evo.getCmpIn());
		model.addAttribute("Edate",Edate);
		model.addAttribute("Evo",Evo);
		
		return "redirect:/workRecord/workRecord.do";
	}
	
	//조회
	@RequestMapping("/searchWork.do")
	public String searchWork(@RequestParam String selectDate, HttpServletRequest request
			, Model model) {
		//사원번호 셋팅
		HttpSession session = request.getSession();
		String memNo = (String) session.getAttribute("identNum");
		WorkRecordVO searchVo = new WorkRecordVO();
		searchVo.setMemNo(memNo);
		logger.info("selectDate={}"+selectDate);
		
		// cmp_month 셋팅
		SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy-MM");
		String date = sdf2.format(searchVo.getCmpRegdate());
		searchVo.setCmpMonth(date);
		
		//조회
		List<WorkRecordVO>Slist = workService.selectWorkList(searchVo);
		for (int i = 0; i < Slist.size(); i++) {
			searchVo = Slist.get(i);
		}
		logger.info("=================================searchVo={}",searchVo);
		logger.info("=================================Slist.size={}",Slist.size());
		
		logger.info("================searchVo.getCmpMonth={}"+searchVo.getCmpMonth());
		//조회결과 없을시
		if(!selectDate.equals(searchVo.getCmpMonth())) {
			String msg = "조회결과가 없습니다.";
			String url = "/workRecord/workRecord.do";
			
			model.addAttribute("msg",msg);
			model.addAttribute("url",url);
			
			return "common/message";
		}
		
		model.addAttribute("searchVo",searchVo);
		model.addAttribute("Slist",Slist);
		
		return "workRecord/workRecord";
	}
	
	
	@RequestMapping("/detail.do")
	public void detail(HttpServletRequest request,Model model) {
		//사원번호 셋팅
		HttpSession session = request.getSession();
		String memNo = (String) session.getAttribute("identNum");
		WorkRecordVO Dvo = new WorkRecordVO();
		Dvo.setMemNo(memNo);
		logger.info("출퇴근 상세보기 memNo={}",memNo);
		
		//CmpRegdate 현재날짜로 셋팅
		Date d = new Date();
		Dvo.setCmpRegdate(d);
		
		
		// cmp_month 셋팅
		SimpleDateFormat sdf3 = new SimpleDateFormat("MM");
		String date = sdf3.format(Dvo.getCmpRegdate());
		Dvo.setCmpMonth(date);
		
		//조회
		List<WorkRecordVO>list = workService.selectWorkList(Dvo);
		for (int i = 0; i < list.size(); i++) {
			Dvo = list.get(i);
		}
		
		model.addAttribute("Dvo",Dvo);
		
	}
	
}
