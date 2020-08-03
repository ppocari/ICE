package com.will.ice.workrecord.controller;

import java.text.DateFormat;
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
	private SimpleDateFormat hm = new SimpleDateFormat("HH:mm");
	private SimpleDateFormat h9 = new SimpleDateFormat("09:00");
	private SimpleDateFormat ym = new SimpleDateFormat("yyyy-MM");
	private SimpleDateFormat mm = new SimpleDateFormat("MM");
	
	
	@Autowired WorkRecordService workService;
	
	@RequestMapping(value = "/workRecord.do",method = RequestMethod.GET)		
	public String workRecord_get(HttpServletRequest request,Model model) {
		//사원번호,이름 셋팅
		HttpSession session = request.getSession();
		String userName = (String)session.getAttribute("userName");
		String memNo = (String) session.getAttribute("identNum");
		
		WorkRecordVO vo = workService.selectToday(memNo);
		logger.info("workRecord 보여주기 vo={},userName={}",vo,userName);
		Date d = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String date = sdf.format(d);
		
		/*
		 <select id="selectToday" resultType="WorkRecordVO" parameterType="String">
		select * from workRecord 
        where memno=#{memNo} and cmp_in is not null
		</select>
		  
		  내 포스트잇 왜 무시해 ....
		 */
		logger.info("date={}"+date);
		model.addAttribute("date",date);
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
		Date day = new Date();
		String day_format = hm.format(day);
		Svo.setCmpIn(day_format); 
		
		//9시 셋팅
		Date nine = new Date();
		String nine_format = h9.format(nine);
		
		//CmpRegdate 현재날짜로 셋팅
		Svo.setCmpRegdate(day);
		/*
		//regdate
		//ymd 형식으로 변경	
		SimpleDateFormat ymd = new SimpleDateFormat("yyyy-MM-dd");
		String ymdString = ymd.format(Svo.getCmpRegdate());
		logger.info("Svo.getCmpRegdate={}"+Svo.getCmpRegdate());
		logger.info("ymdString"+ymdString);
		
		//date 변환
		DateFormat dateformat = new SimpleDateFormat("yyyy-MM-dd");
		Date format_reg = new Date();
		try {
			format_reg = dateformat.parse(ymdString);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		
		//regdate 셋팅
		Svo.setCmpRegdate(format_reg);
		//ymd.format(Svo.getCmpRegdate());
		
		logger.info("Svo.getCmpRegdate={}"+Svo.getCmpRegdate()); 
		*/
		
		/*
		 * 
		 * cmp_regdate yyyy-mm-dd 형식으로 저장으로 바꿔줘.... => jsp에서 변환함
		 * 
		 * 그리고 date랑 sdf를 너무 많이 써서 헷갈리니까  맨위에 private 밑에다가 모아두고 가져다가 쓰는걸로 바꿨으면 좋겠어  => 바꿈
		 */
		
		// cmp_month 셋팅
		String date = ym.format(Svo.getCmpRegdate());
		Svo.setCmpMonth(date);
		
		
		//6~9시 아닌 시간에 출근시 결근
		try {
			day = hm.parse(day_format); //출근버튼 클릭
			nine = h9.parse(nine_format); // 오늘날짜 9시 정각
		} catch (ParseException e1) {
			e1.printStackTrace();
		} 
		
		
		if(nine.after(day)){
			Svo.setCmpStatus("9"); // nine > day 출근
		}else {
			Svo.setCmpStatus("0"); // nine < day 결근
		}
		logger.info("status={}"+Svo.getCmpStatus());
		
		
		int cnt = workService.insertWork_status(Svo);
		logger.info("출근 결과 cnt={}"+cnt);
		
		model.addAttribute("Svo",Svo);
		model.addAttribute("day",day);
		
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
		
		Evo = workService.selectToday(memNo);
		
		// cmp_month 셋팅
		String date = mm.format(Evo.getCmpRegdate());
		Evo.setCmpMonth(date);
		logger.info("===============Evo={}"+Evo);
		
		//현재 시간으로 퇴근시간 셋팅
		Date d = new Date();
		String Edate = hm.format(d);
		Evo.setCmpOut(Edate);
		
		
		
		int nomal = Integer.parseInt(Evo.getCmpStatus());
		
		//결근시 결근으로 저장
		if( (nomal-1) > 8 ) {
			Evo.setCmpStatus("야근");
		}else if( (nomal-1) < 8 ) {
			Evo.setCmpStatus("반차");
		}else {
			Evo.setCmpStatus("출근");
		}
		logger.info("퇴근 후 vo={},Evo.getCmpStatus={}"+Evo,Evo.getCmpStatus());
		
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
		
		searchVo = workService.selectToday(memNo);
		
		if(searchVo == null) {
			String msg = "조회결과가 없습니다.";
			String url = "/workRecord/workRecord.do";
			
			model.addAttribute("msg",msg);
			model.addAttribute("url",url);
			
			return "common/message";
		}
		
		Date d = new Date();
		try {
			d = ym.parse(selectDate);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		
		// cmp_month 셋팅
		String date = ym.format(d);
		searchVo.setCmpMonth(date);
		
		//조회
		List<WorkRecordVO>Slist = workService.selectWorkList(searchVo);
		for (int i = 0; i < Slist.size(); i++) {
			searchVo = Slist.get(i);
		}
		logger.info("=================================searchVo={}",searchVo);
		logger.info("=================================Slist.size={}",Slist.size());
		
		logger.info("================searchVo.getCmpMonth={}"+searchVo.getCmpMonth());
		logger.info("==================================");
		logger.info("Slist"+Slist);
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
		String date = mm.format(Dvo.getCmpRegdate());
		Dvo.setCmpMonth(date);
		
		//조회
		List<WorkRecordVO>list = workService.selectWorkList(Dvo);
		for (int i = 0; i < list.size(); i++) {
			Dvo = list.get(i);
		}
		
		model.addAttribute("Dvo",Dvo);
		
	}
	
}
