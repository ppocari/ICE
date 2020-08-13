package com.will.ice.notice.controller;

import java.io.File;
import java.util.HashMap;
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
import org.springframework.web.servlet.ModelAndView;

import com.will.ice.common.FileUploadUtil;
import com.will.ice.common.PaginationInfo;
import com.will.ice.common.SearchVO;
import com.will.ice.common.Utility;
import com.will.ice.notice.model.NoticeService;
import com.will.ice.notice.model.NoticeVO;
import com.will.ice.noticeComment.model.NoticeCommentService;
import com.will.ice.noticeComment.model.NoticeCommentVO;
import com.will.ice.noticeComment.model.NoticeCommentViewVO;


@Controller
@RequestMapping("/notice")
public class NoticeController {

	private static final Logger logger 
		= LoggerFactory.getLogger(NoticeController.class);
	
	@Autowired private NoticeService noticeService;
	
	@Autowired private FileUploadUtil fileUploadUtil;
	
	@Autowired private NoticeCommentService noticeCommentService;
	
	@RequestMapping(value="/noticeWrite.do", method = RequestMethod.GET)
	public void noticeWrite_get(@ModelAttribute NoticeVO noticeVo,
			HttpSession session) {
		logger.info("공지사항 글쓰기 화면 실행");
		
		String memNo = (String) session.getAttribute("identNum");
		noticeVo.setMemNo(memNo);
		
		logger.info("memNo 가져왔나? memNo={}",memNo);
		
		
	}
	
	//관리자 공지사항 작성
	@RequestMapping(value="/noticeWrite.do", method = RequestMethod.POST)
	public String noticeWrite_post(@ModelAttribute NoticeVO noticeVo,
			Model model, HttpSession session,
			HttpServletRequest request) {
		//맴버정보 받아오기
		String memNo = (String) session.getAttribute("identNum");
		noticeVo.setMemNo(memNo);
		logger.info("memNo 가져왔나? memNo={}",memNo);
		
		
		
		//메인여부 체크안할시 N
				if(noticeVo.getMain()==null || noticeVo.getMain().isEmpty()) {
					noticeVo.setMain("N");
				}
				
		
		//파일 업로드
		List<Map<String, Object>> list
			=fileUploadUtil.fileUpload(request, FileUploadUtil.PATH_PDS);
		
		String fileName="", orFileName="";
		long fileSize=0;
		
		for(Map<String, Object> map : list) {
			fileSize= (Long) map.get("fileSize");
			fileName= (String) map.get("fileName");
			orFileName= (String) map.get("originalFileName");
		}
		
		noticeVo.setFileName(fileName);
		noticeVo.setOrFileName(orFileName);
		noticeVo.setFileSize(fileSize);
		
		logger.info("공지사항 등록, 파라미터 vo={}, identNum={}", noticeVo, memNo);
		//첨부파일 없을때 null값 넣기
		if(noticeVo.getFileName()==null || noticeVo.getFileName().isEmpty()) {
			noticeVo.setFileName(""); 
			noticeVo.setOrFileName("");
		}
				
		int cnt=noticeService.insertNotice(noticeVo);
		logger.info("공지사항 등록 결과, cnt={}", cnt);
		
		String msg="공지사항 등록 실패", url="/notice/noticeWrite.do";
		if(cnt>0) {
			msg="공지사항 등록되었습니다.";
			url="/notice/noticeList.do";
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
	}
	
	
	@RequestMapping("/noticeList.do")
	public String noticeList(@ModelAttribute SearchVO searchVo, Model model,
			HttpSession session) {

		logger.info("공지사항 실행");
		logger.info("글 목록 파라미터 searchVo={}", searchVo);

				
		//[1] PaginationInfo 생성
		PaginationInfo pagingInfo = new PaginationInfo();
		pagingInfo.setBlockSize(Utility.BLOCKSIZE);
		pagingInfo.setRecordCountPerPage(Utility.RECORD_COUNT);
		pagingInfo.setCurrentPage(searchVo.getCurrentPage());
		
		//[2] SearchVo 에 값 셋팅
		searchVo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());
		searchVo.setRecordCountPerPage(Utility.RECORD_COUNT);
		
		List<NoticeVO> list=noticeService.selectAll(searchVo);
		logger.info("글목록 결과, list.size={}", list.size());
		
		int totalRecord=noticeService.selectTotalRecord(searchVo);
		logger.info("글목록, 전체 레코드 개수 ={}" , totalRecord);
		
		pagingInfo.setTotalRecord(totalRecord);
		
		//3
		model.addAttribute("list", list);
		model.addAttribute("pagingInfo", pagingInfo);
		
		return "notice/noticeList";
	}
	
	@RequestMapping("/noticeCountUpdate.do")
	public String noticeCountUpdate(@RequestParam(defaultValue = "0") int noticeNo,
			Model model) {
		//1
		logger.info("조회수 증가, 파라미터 no={}", noticeNo);
		if(noticeNo==0) {
			model.addAttribute("msg", "잘못된 url 입니다.");
			model.addAttribute("url", "/notice/noticeList.do");
			
			return "common/message";
		}
		
		//2
		int cnt=noticeService.updateReadCount(noticeNo);
		logger.info("조회수 증가 결과, cnt={}", cnt);
		
		
		//3		
		//4
		return "notice/noticeList";/*"redirect:/reboard/detail.do?no="+no;*/
	}
	
	@RequestMapping("noticeDetail.do")
	public String noticeDetail(@RequestParam(defaultValue = "0")int noticeNo,
			HttpServletRequest request, Model model) {
		//1.
		logger.info("상세보기, 파라미터 no={}", noticeNo);
		
		if(noticeNo==0) {
			model.addAttribute("msg", "잘못된 url입니다.");
			model.addAttribute("url", "/notice/noticeList.do");
			
			return "common/message";
		}
		
		NoticeVO vo=noticeService.selectByNo(noticeNo);
		logger.info("상세보기 조회 결과, vo={}", vo);
		
		String fileInfo="", downInfo="";
		if(vo.getOrFileName()!=null &&
				!vo.getOrFileName().isEmpty()) { 
			float fileSize=Math.round(vo.getFileSize()/1024f*10)/10f;
			fileInfo 
				= Utility.getFileInfo(vo.getOrFileName(), request)
				+ "( "+fileSize +"KB )";
			
			downInfo = "다운 : " + vo.getDowncount();
		}
		
		//댓글
		List<NoticeCommentViewVO> list = noticeCommentService.commentList(noticeNo);
		
		model.addAttribute("vo", vo);
		model.addAttribute("fileInfo", fileInfo);
		model.addAttribute("downInfo", downInfo);
		model.addAttribute("list", list);
		
		return "notice/noticeDetail";
	}
	
	@RequestMapping(value="noticeDelete.do", method = RequestMethod.GET)
	public String noticeDelete_get(@RequestParam(defaultValue = "0") int noticeNo,
			Model model) {
		logger.info("삭제 화면 파라미터 no={}", noticeNo);
		
		if(noticeNo==0) {
			model.addAttribute("msg", "잘못된 url입니다.");
			model.addAttribute("url", "/notice/noticeList.do");
			
			return "common/message";
		}
		
		return "notice/noticeDelete";
	}
	
	@RequestMapping(value="noticeDelete.do", method = RequestMethod.POST)
	public String noticeDelete_post(@RequestParam(defaultValue = "0") int noticeNo,
			HttpSession session, Model model) {
		logger.info("삭제처리 파라미터 noticeNo={}", noticeNo);
		
		int cnt=noticeService.deleteNotice(noticeNo);
		String msg="삭제 실패하였습니다", 
			   url="/notice/noticeDetail.do?noticeNo="+noticeNo;
		if(cnt>0) {
			msg="삭제되었습니다.";
			url="/notice/noticeClose.do";
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
	}
	
	@RequestMapping("/noticeClose.do")
	   public void noticeClose() {
	      logger.info("사내게시판 삭제완료");   
	   }
	
	@RequestMapping(value="noticeEdit.do", method= RequestMethod.GET)
		public String noticeEdit_get(@RequestParam(defaultValue = "0") int noticeNo,
				HttpServletRequest request, Model model) {
		logger.info("수정화면, 파라미터 noticeNo={}",noticeNo);
		
		if(noticeNo==0) {
			model.addAttribute("msg", "잘못된 url입니다");
			model.addAttribute("url", "/notice/noticeList.do");
			
			return "notice/noticeEdit";
		}
		
		NoticeVO vo=noticeService.selectByNo(noticeNo);
		logger.info("수정화면 조회 결과 vo={}", vo);
		
		model.addAttribute("vo", vo);
		
		return "notice/noticeEdit";
	}
	
	@RequestMapping(value="noticeEdit.do", method= RequestMethod.POST)
	public String noticeEdit_post(@ModelAttribute NoticeVO noticeVo,
			HttpServletRequest request, Model model, HttpSession session) {
		logger.info("수정 처리 파라미터 vo={}", noticeVo);
		
		//맴버정보 받아오기
		String memNo = (String) session.getAttribute("identNum");
		noticeVo.setMemNo(memNo);
		logger.info("memNo 가져왔나? memNo={}",memNo);
				
		//첨부파일 없을때 null값 넣기
		if(noticeVo.getFileName()==null || noticeVo.getOrFileName()==null
				|| noticeVo.getFileName().isEmpty() || noticeVo.getOrFileName().isEmpty()) {
			noticeVo.setFileName("0"); 
			noticeVo.setOrFileName("0");
		}
		
		//메인여부 체크안할시 N
		if(noticeVo.getMain()==null || noticeVo.getMain().isEmpty()) {
				noticeVo.setMain("N");
		}
		
		logger.info("공지사항 수정, 파라미터 vo={}, identNum={}", noticeVo);
		
		/*
		//파일 업로드
		List<Map<String, Object>> list
			=fileUploadUtil.fileUpload(request, FileUploadUtil.PATH_PDS);
		
		String NOTI_FILENAME="", NOTI_ORFILENAME="";
		long NOTI_FILESIZE=0;
		
		for(Map<String, Object> map : list) {
			NOTI_FILESIZE= (Long) map.get("NOTI_FILESIZE");
			NOTI_FILENAME= (String) map.get("NOTI_FILENAME");
			NOTI_ORFILENAME= (String) map.get("NOTI_ORFILENAME");
		}
		
		noticeVo.setNOTI_FILENAME(NOTI_FILENAME);
		noticeVo.setNOTI_ORFILENAME(NOTI_ORFILENAME);
		noticeVo.setNOTI_FILESIZE(NOTI_FILESIZE);
		*/
		
		int cnt=noticeService.updateNotice(noticeVo);
		logger.info("공지사항 수정 결과, cnt={}", cnt);
		
		String msg="공지사항 수정 실패", url="/notice/noticeWrite.do";
		if(cnt>0) {
			msg="공지사항 수정되었습니다.";
			url="/notice/noticeList.do";
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
	}
	
	@RequestMapping("/countUpdate.do")
	public String countUpdate(@RequestParam(defaultValue = "0")int noticeNo,
			Model model) {
		logger.info("조회수 증가, 파라미터 no={}", noticeNo);
		if(noticeNo==0) {
			model.addAttribute("msg", "잘못된 url 입니다.");
			model.addAttribute("url", "/notice/noticeList.do");
			
			return "common/message";
		}
		int cnt=noticeService.updateReadCount(noticeNo);
		logger.info("조회수 증가 결과, cnt={}", cnt);
		
		return "redirect:/notice/noticeDetail.do?noticeNo="+noticeNo;
	}
	
	@RequestMapping("download.do")
	public ModelAndView download( 
		@RequestParam String fileName, HttpServletRequest request,
		@ModelAttribute NoticeVO noticeVo, HttpSession session) {
		String noticeNo = (String) session.getAttribute("noticeNo");
		noticeVo.setNoticeNo(Integer.parseInt(noticeNo));
		logger.info("noticeNo={}", noticeNo);	
		//1
		logger.info("다운로드 파라미터, no={}, fileName={}", noticeNo, fileName);
		
		//2
		int cnt=noticeService.updateDownCount(Integer.parseInt(noticeNo));
		
		//다운로드 처리를 위한 페이지로 넘겨준다
		String upPath
		=fileUploadUtil.getUploadPath(request, FileUploadUtil.PATH_PDS);
		File file = new File(upPath, fileName);
		
		//3
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("file", file);
		
		//4
		//ModelAndView(String viewName, Map<String, ?> model)
		ModelAndView mav = new ModelAndView("NoticeDownloadView", map);
		return mav;
	}
}
