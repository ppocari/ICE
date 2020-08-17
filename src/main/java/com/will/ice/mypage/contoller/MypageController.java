package com.will.ice.mypage.contoller;

import java.util.List;
import java.util.Map;

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
import org.springframework.web.bind.annotation.ResponseBody;

import com.will.ice.common.FileUploadUtil;
import com.will.ice.mypage.model.MypageService;
import com.will.ice.mypage.model.MypageVO;

@Controller
@RequestMapping("/mypage")
public class MypageController {
	private static final Logger logger
		= LoggerFactory.getLogger(MypageController.class);
	@Autowired MypageService mypageService;
	@Autowired private FileUploadUtil fileUploadUtil;
	
	
	@RequestMapping(value = "/mypage.do",method = RequestMethod.GET)
	public void mypage_get(HttpSession session, Model model) {
		
	  String memNo = (String)session.getAttribute("identNum");
	  logger.info("마이페이지 보여주기 ,사원번호 memNo={}",memNo);
	  
	  MypageVO vo = mypageService.selectEmployee(memNo);
	  logger.info("마이페이지 조회결과 ,파라미터 vo={}",vo);
	  
	  model.addAttribute("vo",vo);

	}
	
	
	@RequestMapping("/ajaxPwd.do")
	@ResponseBody
	public int ajaxPwd(@ModelAttribute MypageVO vo) {
		logger.info("vo={}",vo);
		int result = mypageService.loginCheck(vo.getMemNo(), vo.getPwd());
		logger.info("비밀번호 체크 결과 result={}",result);
		
		return result;
	}
	
	@RequestMapping(value = "/mypage.do", method = RequestMethod.POST)
	public String mypage_post(@ModelAttribute MypageVO vo, @RequestParam String email3,
			HttpServletRequest request, HttpSession session, Model model) {
		
		String memNo = (String) session.getAttribute("identNum");
		logger.info("회원정보 수정하기, 아이디 memNo={},vo={}",memNo,vo);
		logger.info("vo.getEmail2={}",vo.getEmail2());
		if(vo.getEmail2().equals("etc")) {
			vo.setEmail2(email3);
			logger.info("vo.getEmail2={}",vo.getEmail2());
		}
		//파일 업로드 처리
		List<Map<String, Object>> fileList
		=fileUploadUtil.fileUpload(request, FileUploadUtil.PATH_PD_IMAGE);
		
		String imageURL="" , originName="";
		long filesize=0;
		for(Map<String, Object> map : fileList) {
			imageURL=(String) map.get("fileName");
			originName = (String) map.get("originalFileName");
			filesize =  (Long) map.get("fileSize");
		}
		vo.setProFileURL(imageURL);
		vo.setOriginalFileName(originName);
		vo.setFileSize(filesize);
		logger.info("파일 업로드 결과 fileURL={}"+vo.getProFileURL());
		logger.info("파일 업로드 결과 FileSize={}"+vo.getFileSize());
		logger.info("파일 업로드 결과 OriginalFileName={}"+vo.getOriginalFileName());
		
		//db작업
		int cnt = mypageService.updateEmployee(vo);
		logger.info("수정결과 cnt={}",cnt);
		String msg="회원 수정 실패", url = "/mypage/mypage.do";
		if(cnt>0) {
			msg="회원 수정성공!";
			url = "/main/main_user.do";
			
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
	}
}

