package com.will.ice.address.controller;

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
import org.springframework.web.bind.annotation.ResponseBody;

import com.will.ice.address.model.AddressGroupVO;
import com.will.ice.address.model.AddressSearchVO;
import com.will.ice.address.model.AddressService;
import com.will.ice.address.model.AddressUtility;
import com.will.ice.address.model.AddressVO;
import com.will.ice.common.GetSelect;
import com.will.ice.common.PaginationInfo;
import com.will.ice.member.model.MemberVO;
import com.will.ice.model.DepartmentVO;

@Controller
@RequestMapping("/address")
public class AddressController {
	
	private final Logger logger
	=LoggerFactory.getLogger(AddressController.class);

	@Autowired
	private AddressService service;
	
	/* 주소록 조회 */
	@RequestMapping("/addressMain.do")
	public String address_get(@ModelAttribute AddressSearchVO adSearchVo, HttpServletRequest request, Model model) {
		
		 HttpSession session= request.getSession(); 
		 String memNo=(String)session.getAttribute("identNum");
		 /* String memNo="111910"; */
		
		 logger.info("주소록 메인 보기, memNo={}", memNo);
		 
		 String url="/log/login.do", msg="먼저 로그인 해주세요!";
		 if(memNo==null) {
			 model.addAttribute("msg", msg);
			 model.addAttribute("url", url);
			 
			 return "common/message";
		 }
		 
		//[1] PaginationInfo
		PaginationInfo pagingInfo = new PaginationInfo();
		pagingInfo.setBlockSize(AddressUtility.BLOCKSIZE);
		pagingInfo.setRecordCountPerPage(AddressUtility.RECORD_COUNT);
		pagingInfo.setCurrentPage(adSearchVo.getCurrentPage());
		
		//[2] SearchVo
		adSearchVo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());
		adSearchVo.setRecordCountPerPage(AddressUtility.RECORD_COUNT);
		
		//2
		adSearchVo.setMemNo(memNo);
		
		logger.info("처리 후 AddressSearchVo={}", adSearchVo);;
		List<AddressVO> adList=service.selectAddress(adSearchVo);
		logger.info("주소록 조회 결과, list.size={}", adList.size());

		int totalRecord=service.selectTotalRecord(adSearchVo);
		logger.info("전체 레코드 : " + totalRecord);
		
		pagingInfo.setTotalRecord(totalRecord);
				
		//3
		model.addAttribute("adList", adList);
		model.addAttribute("pagingInfo", pagingInfo);
		
		//4
		return "address/addressMain";
		
	}
	
	@RequestMapping("/organizeChart.do")
	public void showOrganization(Model model) {
		logger.info("조직도 보기");
		
		List<MemberVO> organList=service.selectMemDeptPosForOrgan();
		
		List<DepartmentVO> deptList=service.selectDepartment();
		logger.info("조직도 보기 결과 organList.size={}, deptList.size={}", 
				organList.size(), deptList.size());
		
		model.addAttribute("organList", organList);
		model.addAttribute("deptList", deptList);
		
	}
	
	/* 주소록 상세보기 */
	@RequestMapping("/detailAddress.do")
	public void detailAddress_get(@RequestParam int adNo, Model model) {
		
		logger.info("주소록 상세보기 화면, 파라미터 adNo={}", adNo);
		
		AddressVO adVo=service.selectOneAdderss(adNo);
		logger.info("주소록 상세보기 화면 보여주기, adVo={},", adVo);
		
		model.addAttribute("adVo", adVo);
	}
	
	/* 주소록 insert 관련 */
	@RequestMapping(value="/addAddress.do", method=RequestMethod.GET)
	public void addAddress_get(HttpServletRequest request, Model model) {
		
		HttpSession session= request.getSession();
		String memNo=(String)session.getAttribute("identNum");
		logger.info("주소록 등록 화면, memNo={}", memNo);
		
		
		List<AddressGroupVO> adgList= service.selectAddressGroup();
		List<String> phList = GetSelect.getPhoneSelect();
		List<String> emList = GetSelect.getEmailSelect();
		
		logger.info("주소록 등록 화면 처리 결과, adgList.size={}", adgList.size());
		
		model.addAttribute("adgList", adgList);
		model.addAttribute("phList", phList);
		model.addAttribute("emList", emList);
	}

	@RequestMapping(value="/addAddress.do", method=RequestMethod.POST) 
	public String addAddress_post(@ModelAttribute AddressVO adVo, 
			HttpServletRequest request, Model model, @RequestParam String email3) {
 
		HttpSession session= request.getSession();
		String memNo=(String)session.getAttribute("identNum");
		
		
		logger.info("주소록 등록 addressVo={}, memNo={}", adVo, memNo);
		adVo.setMemNo(memNo);
		
		/*이메일 빈칸 처리*/
		if(adVo.getEmail1()==null || adVo.getEmail1().isEmpty()) {
			adVo.setEmail1("");
			adVo.setEmail2("");
		}else {
			if(adVo.getEmail2().equals("직접 입력")) {
				adVo.setEmail2(email3);
			}
		}
		
		/*전화번호 빈칸 처리*/
		if(adVo.getHp2()==null || adVo.getHp2().isEmpty() || adVo.getHp3()==null || adVo.getHp3().isEmpty()) {
			adVo.setHp1("");
			adVo.setHp2("");
			adVo.setHp3("");
		}
		
		int cnt=service.insertAddress(adVo); 
		logger.info("주소록 등록 결과 cnt={}", cnt);
  
		String msg="주소록 등록에 실패하였습니다.", url="/address/addressMain.do"; 
		if(cnt>0) { 
			msg="주소록이 등록되었습니다.";
		}
  
		model.addAttribute("msg", msg); 
		model.addAttribute("url", url);
  
		return "common/message"; 
		  
	}
	
	/* 주소록 수정 */
	@RequestMapping(value="/editAddress.do", method=RequestMethod.GET)
	public void editAddress_get(@RequestParam int adNo, Model model) {
		
		/* 주소 정보 뿌려주기 */
		logger.info("주소록 수정 화면, 파라미터 adNo={}", adNo);
		
		AddressVO adVo=service.selectOneAdderss(adNo);
		
		/* 그룹, 전화번호, 이메일 리스트 보여주기 */
		List<AddressGroupVO> adgList= service.selectAddressGroup();
		logger.info("주소록 수정 화면 보여주기, adVo={}, adgList.size={}", adVo, adgList.size());
		
		List<String> phList = GetSelect.getPhoneSelect();
		List<String> emList = GetSelect.getEmailSelect();
		
		model.addAttribute("adgList", adgList);
		model.addAttribute("phList", phList);
		model.addAttribute("emList", emList);

		model.addAttribute("adVo", adVo);
		
	}
	
	@RequestMapping(value="/editAddress.do", method=RequestMethod.POST)
	public String editAddress_post(@ModelAttribute AddressVO adVo, Model model,
			@RequestParam String email3) {
		
		logger.info("주소록 수정, 파라미터 adVo={}", adVo);
		
		/*이메일 빈칸 처리*/
		if(adVo.getEmail1()==null || adVo.getEmail1().isEmpty()) {
			adVo.setEmail1("");
			adVo.setEmail2("");
		}else {
			if(adVo.getEmail2().equals("직접 입력")) {
				adVo.setEmail2(email3);
			}
		}
		
		/*전화번호 빈칸 처리*/
		if(adVo.getHp2()==null || adVo.getHp2().isEmpty() || adVo.getHp3()==null || adVo.getHp3().isEmpty()) {
			adVo.setHp1("");
			adVo.setHp2("");
			adVo.setHp3("");
		}
		
		int cnt=service.updateAddress(adVo);
		logger.info("주소록 수정 결과, cnt={}", cnt);
		
		String url="", msg="";
		if(cnt>0) {
			url="/address/addressClose.do";
			msg="주소록이 수정되었습니다.";
			
		}
		
		model.addAttribute("url", url);
		model.addAttribute("msg", msg);
		
		return "common/message";
	}
	
	@RequestMapping("/addressClose.do")
	public void windowClose() {
		 logger.info("주소록 수정 완료!"); 
	}
	
	/* 좋아요 처리 */
	@RequestMapping("/isFavorite.do")
	@ResponseBody
	public String isFavorite(@RequestParam int adNo) {
		logger.info("ajax - isFavorite.do 실행, adNo={}", adNo);
		
		int cnt=service.updateIsFavorite(adNo);
		if(cnt>0) {
			logger.info("좋아요 처리 완료!");
		}else {
			logger.info("좋아요 처리 실패!");
		}
		
		return "";
	}
	
	@RequestMapping("/notFavorite.do")
	@ResponseBody
	public String notFavorite(@RequestParam int adNo) {
		logger.info("ajax - notFavorite.do 실행, adNo={}", adNo);
		
		int cnt=service.updateNotFavorite(adNo);
		if(cnt>0) {
			logger.info("좋아요 취소 처리 완료!");
		}else {
			logger.info("좋아요 취소 처리 실패!");
		}
		
		return "";
	}
	
}
