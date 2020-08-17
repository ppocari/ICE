package com.will.ice.resource.controller;

import java.io.File;
import java.text.SimpleDateFormat;
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
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;


import com.will.ice.address.model.AddressUtility;
import com.will.ice.common.FileUploadUtil;
import com.will.ice.common.PaginationInfo;
import com.will.ice.common.Utility;
import com.will.ice.resource.model.ResKindVo;
import com.will.ice.resource.model.ResManageSearchVO;

import com.will.ice.resource.model.ResManageVO;
import com.will.ice.resource.model.ResReserveSearchVO;
import com.will.ice.resource.model.ResReserveVO;
import com.will.ice.resource.model.ResourceService;
import com.will.ice.resource.model.StringIntVo;

@Controller
@RequestMapping("/resource")
public class ResourceController {

	@Autowired
	private ResourceService service;

	@Autowired private FileUploadUtil fileUploadUtil;


	private final Logger logger = LoggerFactory.getLogger(ResourceController.class);

	/* 메인 페이지 */
	@RequestMapping("/resourceMain.do")
	public String main_get(@ModelAttribute ResManageSearchVO rmsVo, 
			HttpServletRequest request, Model model) {
		logger.info("자원관리 메인 화면");

		HttpSession session= request.getSession();
		String memNo = (String)session.getAttribute("identNum");

		String msg="먼저 로그인하세요!";
		String url="/log/login.do";
		if(memNo==null || memNo.isEmpty()) {
			model.addAttribute("msg", msg);
			model.addAttribute("url", url);

			return "common/message";
		}

		logger.info("파라미터 memNo={}", memNo);

		
		//[1] PaginationInfo 
		PaginationInfo pagingInfo = new PaginationInfo();
		pagingInfo.setBlockSize(AddressUtility.BLOCKSIZE);
		pagingInfo.setRecordCountPerPage(AddressUtility.RECORD_COUNT);
		pagingInfo.setCurrentPage(rmsVo.getCurrentPage());

		//[2] SearchVo 
		rmsVo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());
		rmsVo.setRecordCountPerPage(AddressUtility.RECORD_COUNT);
		logger.info("db 처리 전 rmsVo={}", rmsVo);

		List<ResManageVO> manageList = service.selectResManager(rmsVo);
		logger.info("자원관리 조회 결과, list.size={}", manageList.size());

		int totalRecord=service.selectTotalRecord(); 
		logger.info("전체 레코드 : " +	totalRecord);

		pagingInfo.setTotalRecord(totalRecord);

		//3 
		model.addAttribute("pagingInfo", pagingInfo);
		model.addAttribute("manageList", manageList);


		return "resource/resourceMain";

	}

	/* 등록 페이지 */
	@RequestMapping(value="/addResource.do", method = RequestMethod.GET)
	public String addResource_get(@ModelAttribute ResManageVO rmVo, 
			HttpServletRequest request, Model model) {

		logger.info("자원관리 등록 화면");

		HttpSession session= request.getSession();
		String memNo = (String)session.getAttribute("identNum");

		String msg="먼저 로그인하세요!";
		String url="/log/login.do";
		if(memNo==null || memNo.isEmpty()) {
			model.addAttribute("msg", msg);
			model.addAttribute("url", url);

			return "common/message";
		}

		logger.info("파라미터 memNo={}", memNo);

		
		List<ResKindVo> rkList= service.selectResKind();
		logger.info("자원관리 등록 화면 rkList.size={}", rkList.size());
		
		model.addAttribute("rkList", rkList);

		return "resource/addResource";

	}

	@RequestMapping(value="/addResource.do", method = RequestMethod.POST)
	public String addResource_post(@ModelAttribute ResManageVO rmVo, Model model,
			HttpServletRequest request) {

		logger.info("자원관리 등록 화면 처리, rmVo={}", rmVo);


		List<Map<String, Object>> list =fileUploadUtil.fileUpload(request,
				FileUploadUtil.PATH_RESOURCE_FILE);

		String fileName="", originalFileName=""; long fileSize=0;

		for(Map<String , Object> map : list) { 
			fileName=(String)map.get("fileName"); 
			fileSize=(Long) map.get("fileSize");
			originalFileName=(String) map.get("originalFileName"); 
		}

		rmVo.setResImage(fileName);
		rmVo.setResSize(fileSize);
		rmVo.setResOriginalImage(originalFileName);


		int cnt=service.insertResManage(rmVo);

		String msg="자원 등록이 실패하였습니다!", url="/resource/addResource.do";
		if(cnt>0) {
			msg="자원이 등록되었습니다.";

			url="/resource/resourceClose.do";

		}			

		model.addAttribute("msg", msg);
		model.addAttribute("url", url);

		return "common/message";

	}

	@RequestMapping("/resourceClose.do") 
	public void resWindowClose() {

		logger.info("자원관리 등록 처리 완료!");
	}
	
	
	/* 자원관리 수정 */
	@RequestMapping(value="/editResource.do", method=RequestMethod.GET)
	public void edit_get(@RequestParam (defaultValue ="0") int resNo, Model model
			, HttpServletRequest request) {
		logger.info("자원관리 수정 화면");
		
		ResManageVO rmVo= service.selectResManageOne(resNo);
		logger.info("자원관리 수정 기존 rmVo={}", rmVo);
		
		List<ResKindVo> rkList=service.selectResKind();
		
		String fileInfo
		=Utility.getFileInfo(rmVo.getResOriginalImage(), request);

		model.addAttribute("rmVo", rmVo);
		model.addAttribute("rkList", rkList);
		model.addAttribute("fileInfo", fileInfo);
		
	
	}
		
	@RequestMapping(value="/editResource.do", method=RequestMethod.POST)
	public String edit_post(@ModelAttribute ResManageVO rmVo, 
			@RequestParam String oldFileName, HttpServletRequest request
			, Model model, @RequestParam(required = false) String mode ) {
		logger.info("자원관리 수정 화면 처리, oldFileName={}", oldFileName);

		List<Map<String, Object>> list
		=fileUploadUtil.fileUpload(request, FileUploadUtil.PATH_RESOURCE_FILE);
	
		String fileName="", originalFileName="";
		long fileSize=0;
		for(Map<String, Object> map : list) {
			fileName=(String) map.get("fileName");
			originalFileName=(String) map.get("originalFileName");
			fileSize=(Long) map.get("fileSize");
		}
		
		rmVo.setResImage(fileName);
		rmVo.setResSize(fileSize);
		rmVo.setResOriginalImage(originalFileName);

		logger.info("db 처리 전 rmVo={}", rmVo);

		String msg="자원관리 수정 실패하였습니다."; 
		String url="";
		
		if(mode!=null && !mode.isEmpty()) {
			if(mode.equals("redirect")) {
				url="redirect:/resource/resourceClose.do";
			}
		}else {
			url="/resource/editResource.do?resNo="+rmVo.getResNo();
		}
		int cnt=service.updateResource(rmVo);
		if(cnt>0) {
			if(fileName!=null && !fileName.isEmpty()) {
				if(oldFileName!=null && !oldFileName.isEmpty()) {
					String upPath = fileUploadUtil.getUploadPath(request, FileUploadUtil.PATH_RESOURCE_FILE);
					File file = new File(upPath, oldFileName);
					if(file.exists()) {
						boolean bool=file.delete();
						logger.info("기존 파일 삭제", bool);
					}
				}
			}//if

			msg="자원이 수정되었습니다.";
			url="/resource/resourceClose.do";
		}

		model.addAttribute("msg", msg);
		model.addAttribute("url", url);

		return "common/message";
	}
	
	/* 상세보기 */
	@RequestMapping(value="/detailResource.do", method = RequestMethod.GET)
	@ResponseBody
	public ResManageVO detail_get(@RequestParam int resNo) {
		logger.info("자원 관리 상세보기 화면, resNo={}", resNo);
		
		ResManageVO rmVo= service.selectResManageOne(resNo);
		
		return rmVo;
	}
	
	/* 삭제 */
	@RequestMapping("/deleteResource.do")
	public String delete_get(@ModelAttribute ResManageVO rmVo, Model model,
			@RequestParam (required = false, defaultValue= "0") int rvWaitCount, HttpServletRequest request) {
		logger.info("자원 관리 삭제, rmVo={}, rvWaitCount={}", rmVo, rvWaitCount);
		
		//승인 대기 중인 예약이 있다면 거절 메시지와 함께 거절 처리함.
		int updateRvCount= service.updateReserveBecauseResDelete(rvWaitCount);
		if(updateRvCount>0) {
			logger.info("자원 삭제 시, 승인 대기 중인 예약을 거절 사유와 함께 거절 처리함!");
		}
		
		int deleteCnt=service.updateManageDel(rmVo.getResNo());
		
		String oldFileName=rmVo.getResImage();
		if(oldFileName!=null && !oldFileName.isEmpty()) {
			String upPath = fileUploadUtil.getUploadPath(request, FileUploadUtil.PATH_RESOURCE_FILE);
			File file = new File(upPath, oldFileName);
			if(file.exists()) {
				boolean bool=file.delete();
				logger.info("자원 이미지 파일 삭제 여부: {}", bool);
			}
		}
		
		String msg="", url="/resource/resourceMain.do";
		if(deleteCnt>0) {
			msg="해당 자원을 삭제하였습니다.";
		}else {
			msg="자원 삭제가 실패하였습니다.";
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
	}
	
	@RequestMapping("/canResDelete.do")
	@ResponseBody
	public int casResDelete(@RequestParam int resNo) {
		logger.info("자원 삭제 가능한지 판별");
		
		StringIntVo siVo = new StringIntVo();
		siVo.setNo(resNo);
		int cnt=service.selectReserveResNoHistoryCount(siVo);
		logger.info("해당 자원의 승인대기 중인 예약 유무: cnt={}", cnt);
		
		return cnt;
	}
	
	@RequestMapping("/manageReserve.do") 
	public void manageReserve_get(@ModelAttribute ResReserveSearchVO rssVo, Model model) {
		
		logger.info("예약처리 페이지");
		
		//[1] PaginationInfo 
		PaginationInfo pagingInfo = new PaginationInfo();
		pagingInfo.setBlockSize(AddressUtility.BLOCKSIZE);
		pagingInfo.setRecordCountPerPage(AddressUtility.RECORD_COUNT);
		pagingInfo.setCurrentPage(rssVo.getCurrentPage());

		//[2] SearchVo 
		rssVo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());
		rssVo.setRecordCountPerPage(AddressUtility.RECORD_COUNT);
		rssVo.setRvState("wait");
		logger.info("db 처리 전 rssVo={}", rssVo);
		
		List<ResReserveVO> rsList=service.selectReserveCondition(rssVo);
		logger.info("자원예약 처리 화면, rsList={}", rsList.size());
		
		for(ResReserveVO rsVo : rsList) {
			SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm");
			String rvStart  = dateFormat.format(rsVo.getRvStart());
			String rvEnd  = dateFormat.format(rsVo.getRvEnd());
			
			String[] startArr=rvStart.split(" ");
			String[] endArr=rvEnd.split(" ");
			
			rsVo.setStartDate(startArr[0]);
			rsVo.setStartHour(startArr[1]);
			rsVo.setEndDate(endArr[0]);
			rsVo.setEndHour(endArr[1]);
		}
		
		int totalRecord=service.selectReserveCountCondition(rssVo); 
		logger.info("전체 레코드 : " +	totalRecord);

		pagingInfo.setTotalRecord(totalRecord);

		//3 
		model.addAttribute("pagingInfo", pagingInfo);
		model.addAttribute("rsList", rsList);
		
	}
	
	@RequestMapping("handleReserve.do")
	public String rvYes(@RequestParam int rvNo, @RequestParam String mode, Model model, 
				@RequestParam (required = false) String message) {
		logger.info("예약 신청 처리, rvNo={}, mode={}", rvNo, mode);
		//원래 새 VO를 만들어야 하지만, 파라미터의 타입을 모두 가진 ResKindVo를 대신 임시로 씀.
		StringIntVo handleVo = new StringIntVo();
		handleVo.setNo(rvNo);
		handleVo.setText(mode);
		
		int cnt=service.updateReserveState(handleVo);
		
		String url="/resource/manageReserve.do"; //실패, 성공 무관
		String msg="";
		
		if(cnt>0) {
			//예약 승인
			if(message==null || message.isEmpty()) {
				logger.info("예약신청이 승인 처리됨!");
				msg="신청이 승인 처리 되었습니다.";
			}
			//예약 거절
			else {
				logger.info("거절 메세지 파라미터, message={}", message);
				StringIntVo reasonVo = new StringIntVo();
				reasonVo.setNo(rvNo);
				reasonVo.setText(message);
				int count=service.updateReserveNoReason(reasonVo);
				if(count>0) {
					logger.info("예약신청이 거절 처리됨!");
					msg="신청이 거절 처리 되었습니다.";
				}
			
			}
		}else {
			msg="신청 처리가 실패하였습니다.";
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
	}
	
	@RequestMapping("/historyReserveMain.do") 
	public void historyReserveMain(@ModelAttribute ResReserveSearchVO rssVo, Model model) {
		
		//[1] PaginationInfo 
		PaginationInfo pagingInfo = new PaginationInfo();
		pagingInfo.setBlockSize(AddressUtility.BLOCKSIZE);
		pagingInfo.setRecordCountPerPage(AddressUtility.RECORD_COUNT);
		pagingInfo.setCurrentPage(rssVo.getCurrentPage());

		//[2] SearchVo 
		rssVo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());
		rssVo.setRecordCountPerPage(AddressUtility.RECORD_COUNT);
		logger.info("db 처리 전 rssVo={}", rssVo);
		
		List<ResReserveVO> rsList=service.selectReserveCondition(rssVo);
		logger.info("자원예약 처리 화면, rsList={}", rsList.size());
		
		for(ResReserveVO rsVo : rsList) {
			SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm");
			String rvStart  = dateFormat.format(rsVo.getRvStart());
			String rvEnd  = dateFormat.format(rsVo.getRvEnd());
			
			String[] startArr=rvStart.split(" ");
			String[] endArr=rvEnd.split(" ");
			
			rsVo.setStartDate(startArr[0]);
			rsVo.setStartHour(startArr[1]);
			rsVo.setEndDate(endArr[0]);
			rsVo.setEndHour(endArr[1]);
		}
		
		int totalRecord=service.selectReserveCountCondition(rssVo); 
		logger.info("전체 레코드 : " +	totalRecord);

		pagingInfo.setTotalRecord(totalRecord);

		//3 
		model.addAttribute("pagingInfo", pagingInfo);
		model.addAttribute("rsList", rsList);
		
	}
	
	@RequestMapping("/historyResName.do")
	public void historyResName(@ModelAttribute ResReserveSearchVO rssVo, 
			@RequestParam int resNo, Model model) {
		logger.info("자원명별 자원이용현황, rssVo={}", rssVo);
		
		//페이징 처리를 위한 - rvResNoList 구하기
		//[1] PaginationInfo 
		PaginationInfo pagingInfo = new PaginationInfo();
		pagingInfo.setBlockSize(AddressUtility.BLOCKSIZE);
		pagingInfo.setRecordCountPerPage(AddressUtility.RECORD_COUNT);
		pagingInfo.setCurrentPage(rssVo.getCurrentPage());

		//[2] SearchVo 
		rssVo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());
		rssVo.setRecordCountPerPage(AddressUtility.RECORD_COUNT);
		rssVo.setSearchNumber(resNo);
		rssVo.setRvState("yes");
		logger.info("db 처리 전 rssVo={}", rssVo);
		
		List<ResReserveVO> rvResNoList= service.selectReserveResNoHistory(rssVo);
		logger.info("자원명별 자원이용현황 조회 결과, rvResNoList={}", rvResNoList.size());
		for(ResReserveVO rsVo : rvResNoList) {
			SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm");
			String rvStart  = dateFormat.format(rsVo.getRvStart());
			String rvEnd  = dateFormat.format(rsVo.getRvEnd());
			
			String[] startArr=rvStart.split(" ");
			String[] endArr=rvEnd.split(" ");
			
			rsVo.setStartDate(startArr[0]);
			rsVo.setStartHour(startArr[1]);
			rsVo.setEndDate(endArr[0]);
			rsVo.setEndHour(endArr[1]);
		}
		
		//전체 레코드 수를 구하기 - pagingInfo
		StringIntVo siVo=new StringIntVo(resNo, rssVo.getRvState());
		
		int totalRecord=service.selectReserveResNoHistoryCount(siVo); 
		logger.info("전체 레코드 : " +	totalRecord);

		pagingInfo.setTotalRecord(totalRecord);

		//달력 resource의 Id를 위해서 - resVo
		ResManageVO resVo= service.selectResManageOne(rssVo.getSearchNumber());
		logger.info("달력 resource의 Id : resVo={}" +	resVo);
		
		
		
		//달력을 위해서
		List<ResReserveVO> rsCal = service.selectResNoCalendar(resNo);
		logger.info("달력 전체보기: rsCal={}" +	rsCal);
		
		model.addAttribute("rsCal", rsCal);
		model.addAttribute("resVo", resVo);
		model.addAttribute("pagingInfo", pagingInfo);
		model.addAttribute("rvResNoList", rvResNoList);
		
		
	}
	
	@RequestMapping("/historyResKind.do")
	public void historyResKind(@ModelAttribute ResReserveSearchVO rssVo, 
			@RequestParam int rkNo, Model model) {
		logger.info("자원 종류별 자원이용현황, rssVo={}", rssVo);
		
		//[1] PaginationInfo 
		PaginationInfo pagingInfo = new PaginationInfo();
		pagingInfo.setBlockSize(AddressUtility.BLOCKSIZE);
		pagingInfo.setRecordCountPerPage(AddressUtility.RECORD_COUNT);
		pagingInfo.setCurrentPage(rssVo.getCurrentPage());
		
		//[2] SearchVo 
		rssVo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());
		rssVo.setRecordCountPerPage(AddressUtility.RECORD_COUNT);
		rssVo.setSearchNumber(rkNo);
		rssVo.setRvState("yes");
		logger.info("db 처리 전 rssVo={}", rssVo);
		
		List<ResReserveVO> rvRkNoList= service.selectReserveRkNoHistory(rssVo);
		logger.info("자원 종류별 자원이용현황 조회 결과, rvRkNoList={}", rvRkNoList.size());
		for(ResReserveVO rsVo : rvRkNoList) {
			SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm");
			String rvStart  = dateFormat.format(rsVo.getRvStart());
			String rvEnd  = dateFormat.format(rsVo.getRvEnd());
			
			String[] startArr=rvStart.split(" ");
			String[] endArr=rvEnd.split(" ");
			
			rsVo.setStartDate(startArr[0]);
			rsVo.setStartHour(startArr[1]);
			rsVo.setEndDate(endArr[0]);
			rsVo.setEndHour(endArr[1]);
		}
		
		StringIntVo siVo=new StringIntVo(rssVo.getSearchNumber(), rssVo.getRvState());
		
		int totalRecord=service.selectReserveRkNoHistoryCount(siVo); 
		logger.info("전체 레코드 : " +	totalRecord);
		
		pagingInfo.setTotalRecord(totalRecord);
		
		//달력 resource의 Id를 위해서
		List<ResManageVO> rmList =service.selectReserveKind(rkNo);
		logger.info("달력 resource의 Id : rmList={}" +	rmList.size());
		
		//달력 전체보기를 위해서
		List<ResReserveVO> rsCal = service.selectRkNoCalendar(rkNo);
		logger.info("달력 전체보기: rsCal={}" +	rsCal);
		
		model.addAttribute("rsCal", rsCal);
		model.addAttribute("rmList", rmList);
		model.addAttribute("pagingInfo", pagingInfo);
		model.addAttribute("rvRkNoList", rvRkNoList);
		
	}
	
	@RequestMapping("/preferenceResource.do")
	public String preference_get(Model model, @RequestParam (required = false, defaultValue="0") int rkNo, 
			@RequestParam (required = false) String rkKind, 
			@RequestParam (required = false) String mode) {
		logger.info("자원 환경 설정");
		
		if(mode==null || mode.isEmpty()) {
			List<ResKindVo> rkList = service.selectResKind();
			logger.info("자원관리 조회 결과, rkList.size={}", rkList.size());
			
			model.addAttribute("rkList", rkList);
			
			return "resource/preferenceResource";
		}else if(mode.equals("add")) {
			logger.info("등록함");
		}else if(mode.equals("edit")) {
			
			logger.info("수정함");
		}else if(mode.equals("del")) {
			logger.info("삭제함");
			
		}else {
			
		}
		
		return "";
			
	}
	
		
}
