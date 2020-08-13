package com.will.ice.insa.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

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
import org.springframework.web.bind.annotation.ResponseBody;

import com.will.ice.common.Depart_posi_dateVO;
import com.will.ice.member.controller.MemberController;
import com.will.ice.member.model.MemberListVO;
import com.will.ice.member.model.MemberService;
import com.will.ice.member.model.MemberVO;
import com.will.ice.model.DepartmentVO;
import com.will.ice.model.EtcService;
import com.will.ice.model.PositionVO;

@Controller
@RequestMapping("/insa")
public class InsaController {

	private static final Logger logger
	= LoggerFactory.getLogger(MemberController.class);

	@Autowired private MemberService memberService;
	@Autowired private EtcService etcService;

	@RequestMapping(value ="/insaScore.do" , method = RequestMethod.GET)
	public void insaScore(Model model) {
		logger.info("사원 등록 화면 insaScore");

		List<DepartmentVO> deptList = etcService.DeptAll();
		List<PositionVO> posList = etcService.PosAll();

		model.addAttribute("deptList", deptList);
		model.addAttribute("posList", posList);
	}

	@RequestMapping(value ="/insaScore.do" , method = RequestMethod.POST)
	public String insaScoreMulti(@ModelAttribute MemberListVO memListVO,
			Model model) {
		logger.info("사원 등록 처리 insaScoreMulti, memListVO={}",memListVO);

		int cnt = 0;
		try {
			List<MemberVO> memList = memListVO.getMemItems();
			cnt = memberService.registerMulti(memList);

			String msg = "사원번호 중복!", url = "/member/memWrite.do";
			if(cnt > 0) {
				msg = "사원등록 성공!";
				url = "/member/memList.do";

			}
			model.addAttribute("msg", msg);
			model.addAttribute("url", url);

		}catch (Exception e) {
			e.printStackTrace();
		}

		return "/common/message";
	}



	@RequestMapping(value = "/insaList.do", method = RequestMethod.GET)
	public void insaList_get(Model model) {
		logger.info("사원 조회");

		List<DepartmentVO> deptList = etcService.DeptAll();
		List<PositionVO> posList = etcService.PosAll();

		model.addAttribute("deptList", deptList);
		model.addAttribute("posList", posList);
	}

	@RequestMapping(value ="/insaList.do", method = RequestMethod.POST)
	public void insaList_post(@ModelAttribute Depart_posi_dateVO dpdvo, Model model) {
		logger.info("인사 조회 결과 화면 dpdvo={}", dpdvo);

		List<MemberVO> list = memberService.selectMemberList(dpdvo);
		List<DepartmentVO> deptList = etcService.DeptAll();
		List<PositionVO> posList = etcService.PosAll();

		model.addAttribute("deptList", deptList);
		model.addAttribute("posList", posList);
		model.addAttribute("list", list);
		model.addAttribute("dpdvo", dpdvo);

	}

	@RequestMapping(value = "/memEdit.do", method = RequestMethod.GET)
	public void memEdit_get(@RequestParam(required = false) String memeNo, Model model) {
		logger.info("사원 수정 화면");

		MemberVO vo = memberService.selectMember(memeNo);
		List<DepartmentVO> deptList = etcService.DeptAll();
		List<PositionVO> posList = etcService.PosAll();

		model.addAttribute("deptList", deptList);
		model.addAttribute("posList", posList);
		model.addAttribute("vo", vo);
	}

	@RequestMapping("/memClose.do")
	public void memClose() {
		logger.info("사원 수정완료");	
	}

	@RequestMapping(value = "/memEdit.do", method = RequestMethod.POST)
	public String memEdit_post(@ModelAttribute MemberVO memvo, Model model) {
		logger.info("사원 수정 처리 memvo={}",memvo);

		int cnt = memberService.updateSelectMember(memvo);
		logger.info("사원 수정 결과  cnt={}",cnt);


		String msg = "사원수정 실패", url = "/member/memList.do";
		if(cnt > 0) {
			msg = "사원수정 성공";
			url = "/member/memClose.do";
		}

		model.addAttribute("msg", msg);
		model.addAttribute("url", url);

		return "common/message";

	}

	@RequestMapping("/memDelete.do")
	public String memDelete(@RequestParam String memNo, Model model) {
		logger.info("사원 삭제 ");

		Date fireDate = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

		MemberVO memvo = new MemberVO();
		memvo.setFiredate(sdf.format(fireDate));
		memvo.setMemNo(memNo);

		logger.info("memvo = {}", memvo);

		int cnt = memberService.deleteSelectMember(memvo);
		String msg = "사원삭제 실패", url = "/member/memEdit.do";
		if(cnt > 0) {
			msg = "사원삭제 성공";
			url = "/member/memClose.do";
		}

		model.addAttribute("msg", msg);
		model.addAttribute("url", url);

		return "common/message";

	}

	@RequestMapping(value="/memPwd.do", method = RequestMethod.GET)
	public void memPwd_get() {
		logger.info("사원 수정 비밀번호");	
	}


	@RequestMapping(value = "/memCheck.do", method = RequestMethod.POST) 
	@ResponseBody 
	public boolean memPwd(@RequestParam String pwd) { 
		logger.info("PwCheck"); 
		boolean check = false; 
		String pw_chk = "^(?=.*[A-Za-z])(?=.*[0-9])(?=.*[$@$!%*?&`~'\"+=])[A-Za-z[0-9]$@$!%*?&`~'\"+=]{6,18}$"; 
		Pattern pattern_symbol = Pattern.compile(pw_chk); 
		Matcher matcher_symbol = pattern_symbol.matcher(pwd); 
		if(matcher_symbol.find()) { 
			check = true; 
		} 
		return check; 
	}

	@RequestMapping(value="/memPwd.do", method = RequestMethod.POST)
	public String memPwd_post(@ModelAttribute MemberVO memVo, HttpSession session,Model model) {
		logger.info("사원 수정 비밀번호 처리");	
		String memNo = (String)session.getAttribute("identNum");
		MemberVO db_memVo = memberService.selectMember(memNo);
		
		String msg = "비밀번호 설정 실패", url = "/member/memPwd.do";
		if(db_memVo.getSsn1().equals(memVo.getPwd())) {
			//생년월일은 비밀번호로 쓸 수 없다
			msg = "생년월일 앞자리 6자리는 비밀번호로 사용하실 수 없습니다";
		}else {
			
			memVo.setMemNo(memNo);
			logger.info("memVo={}",memVo);	
			
			int cnt = memberService.newPwd(memVo);
			
			if(cnt > 0) {
				msg = "비밀번호 설정 성공";
				url = "/mypage/mypage.do";
			}
			
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		return "/common/message";
		
	}
}
