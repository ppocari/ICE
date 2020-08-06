package com.will.ice.notice.controller;

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

import com.will.ice.common.FileUploadUtil;
import com.will.ice.common.PaginationInfo;
import com.will.ice.common.SearchVO;
import com.will.ice.common.Utility;
import com.will.ice.notice.model.NoticeService;
import com.will.ice.notice.model.NoticeVO;


@Controller
@RequestMapping("/notice")
public class NoticeController {

   private static final Logger logger 
      = LoggerFactory.getLogger(NoticeController.class);
   
   @Autowired private NoticeService noticeService;
   
   @Autowired private FileUploadUtil fileUploadUtil;
   
   @RequestMapping(value="/noticeWrite.do", method = RequestMethod.GET)
   public void noticeWrite_get(@ModelAttribute NoticeVO noticeVo,
         HttpSession session) {
      logger.info("공지사항 글쓰기 화면 실행");
      
      String memNo = (String) session.getAttribute("identNum");
      noticeVo.setMEMNO(memNo);
      
      logger.info("memNo 가져왔나? memNo={}",memNo);
      
      
   }
   
   //관리자 공지사항 작성
   @RequestMapping(value="/noticeWrite.do", method = RequestMethod.POST)
   public String noticeWrite_post(@ModelAttribute NoticeVO noticeVo,
         Model model, HttpSession session,
         HttpServletRequest request) {
      //맴버정보 받아오기
      String memNo = (String) session.getAttribute("identNum");
      noticeVo.setMEMNO(memNo);
      logger.info("memNo 가져왔나? memNo={}",memNo);
      
      //첨부파일 없을때 null값 넣기
      if(noticeVo.getNOTI_FILENAME()==null || noticeVo.getNOTI_ORFILENAME()==null
            || noticeVo.getNOTI_FILENAME().isEmpty() || noticeVo.getNOTI_ORFILENAME().isEmpty()) {
         noticeVo.setNOTI_FILENAME(""); 
         noticeVo.setNOTI_ORFILENAME("");
      }
      
      //메인여부 체크안할시 N
            if(noticeVo.getNOTI_MAIN()==null || noticeVo.getNOTI_MAIN().isEmpty()) {
               noticeVo.setNOTI_MAIN("N");
            }
            
      logger.info("공지사항 등록, 파라미터 vo={}, identNum={}", noticeVo, memNo);
      
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
      
      for( int i=0; i<list.size(); i++) {
    	  NoticeVO nvo = list.get(i);
    	  logger.info("글목록 결과, nvo={}", nvo);
      }
      
      int totalRecord=noticeService.selectTotalRecord(searchVo);
      logger.info("글목록, 전체 레코드 개수 ={}" , totalRecord);
      
      pagingInfo.setTotalRecord(totalRecord);
      
      //3
      model.addAttribute("list", list);
      model.addAttribute("pagingInfo", pagingInfo);
      
      return "notice/noticeList";
   }
   
   
   /*
    * @RequestMapping("/noticeList.do") public String noticeList(@ModelAttribute
    * SearchVO searchVo, Model model) { logger.info("글 목록 파라미터 searchVo",
    * searchVo);
    * 
    * //[1] PaginationInfo 생성 PaginationInfo pagingInfo = new PaginationInfo();
    * pagingInfo.setBlockSize(Utility.BLOCKSIZE);
    * pagingInfo.setRecordCountPerPage(Utility.RECORD_COUNT);
    * pagingInfo.setCurrentPage(searchVo.getCurrentPage());
    * 
    * //[2] SearchVo 에 값 셋팅
    * searchVo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());
    * searchVo.setRecordCountPerPage(Utility.RECORD_COUNT);
    * 
    * //2 List<NoticeVO> list=noticeService.selectAll(searchVo);
    * logger.info("글목록 결과, list.size="+list.size());
    * 
    * int totalRecord=noticeService.selectTotalRecord(searchVo);
    * logger.info("글목록, 전체 레코드 개수 : " + totalRecord);
    * 
    * pagingInfo.setTotalRecord(totalRecord);
    * 
    * //3 model.addAttribute("list", list); model.addAttribute("pagingInfo",
    * pagingInfo);
    * 
    * return "/notice/noticeList"; }
    */
   
   @RequestMapping("/noticeCountUpdate.do")
   public String noticeCountUpdate(@RequestParam(defaultValue = "0") int no,
         Model model) {
      //1
      logger.info("조회수 증가, 파라미터 no={}", no);
      if(no==0) {
         model.addAttribute("msg", "잘못된 url 입니다.");
         model.addAttribute("url", "/notice/noticeList.do");
         
         return "common/message";
      }
      
      //2
      int cnt=noticeService.updateReadCount(no);
      logger.info("조회수 증가 결과, cnt={}", cnt);
      
      
      //3      
      //4
      return "notice/noticeList";/*"redirect:/reboard/detail.do?no="+no;*/
   }
   
   @RequestMapping("noticeDetail.do")
   public String noticeDetail(@RequestParam(defaultValue = "0")int NOTI_NO,
         HttpServletRequest request, Model model) {
      //1.
      logger.info("상세보기, 파라미터 no={}", NOTI_NO);
      
      if(NOTI_NO==0) {
         model.addAttribute("msg", "잘못된 url입니다.");
         model.addAttribute("url", "/notice/noticeList.do");
         
         return "common/message";
      }
      
      NoticeVO vo = noticeService.selectByNo(NOTI_NO);
      logger.info("상세보기 조회 결과, vo={}", vo);
      
      model.addAttribute("vo", vo);
      
      return "notice/noticeDetail";
   }
   
}