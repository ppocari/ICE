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
			HttpServletRequest request) {
		logger.info("자원 관리 삭제, rmVo={}", rmVo);
		
		int cnt=service.deleteResManage(rmVo.getResNo());
		
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
		if(cnt>0) {
			msg="해당 자원을 삭제하였습니다.";
		}else {
			msg="자원 삭제가 실패하였습니다.";
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
	}
	
	@RequestMapping("/manageReserve.do") 
	public void manageReserve_get(@ModelAttribute ResReserveSearchVO rssVo, Model model) {
		
		//[1] PaginationInfo 
		PaginationInfo pagingInfo = new PaginationInfo();
		pagingInfo.setBlockSize(AddressUtility.BLOCKSIZE);
		pagingInfo.setRecordCountPerPage(AddressUtility.RECORD_COUNT);
		pagingInfo.setCurrentPage(rssVo.getCurrentPage());

		//[2] SearchVo 
		rssVo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());
		rssVo.setRecordCountPerPage(AddressUtility.RECORD_COUNT);
		logger.info("db 처리 전 rssVo={}", rssVo);
		
		List<ResReserveVO> rsList=service.selectReserve(rssVo);
		logger.info("자원예약 처리 화면, rsList={}", rsList);
		
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
		
		int totalRecord=service.selectReserveCount(); 
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
		ResKindVo handleVo = new ResKindVo();
		handleVo.setRkNo(rvNo);
		handleVo.setRkKind(mode);
		
		int cnt=service.updateConfirmReserve(handleVo);
		
		if(message!=null && !message.isEmpty()) {
			logger.info("거절 메세지 파라미터, message={}", message);
			ResKindVo reasonVo = new ResKindVo();
			reasonVo.setRkNo(rvNo);
			reasonVo.setRkKind(message);
			int count=service.updateNoReasonReserve(reasonVo);
			if(count>0) {
				logger.info("거절 메세지 저장 완료!");
			}
		}
		
		String url="/resource/manageReserve.do", msg="예약신청 승인처리를 실패하였습니다.";
		if(cnt>0) {
			msg="예약신청 처리 되었습니다.";
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
	}
}
