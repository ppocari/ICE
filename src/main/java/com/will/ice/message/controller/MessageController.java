package com.will.ice.message.controller;

import java.util.List;

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

import com.will.ice.accode.model.AccodeVO;
import com.will.ice.address.model.AddressGroupVO;
import com.will.ice.address.model.AddressService;
import com.will.ice.address.model.AddressVO;


@Controller
@RequestMapping("/message")
public class MessageController {

	private static final Logger logger 
		= LoggerFactory.getLogger(MessageController.class);
	
	@Autowired private AddressService addrService;
	
	
	@RequestMapping(value="/msgWrite.do", method = RequestMethod.GET)
	public void messageWrite() {
		logger.info("msgWrite.do 쪽지보내기 실행");
		
	}
	
	@RequestMapping(value="/msgAddr.do", method = RequestMethod.GET)
	public void msgAddr_get(Model model) {
		logger.info("쪽지그룹 목록 뿌려주기");
		
		List<AddressGroupVO> addrList = addrService.selectAddressGroup();
		logger.info("addrList={}",addrList);
		model.addAttribute("addrList", addrList);
	}
	
	@RequestMapping(value="/msgAddr_group.do", method = RequestMethod.GET)
	@ResponseBody
	public List<AddressVO> msgAddr_group_get(@RequestParam String memNo, 
			@RequestParam int adgNo, Model model) {
		logger.info("쪽지 그룹에 해당하는 주소록 읽어오기 memNo={}, adgNo={}",memNo, adgNo);
	
		AddressVO advo = new AddressVO();
		advo.setMemNo(memNo);
		advo.setAdgNo(adgNo);
		List<AddressVO> addList = addrService.selectListMsgAddr_memNo_adgNo(advo);
		logger.info("addList={}",addList);
		
		return addList;
	}
	
	
	
	@RequestMapping(value="/msgClose.do", method = RequestMethod.GET)
	public void msgClose() {
		logger.info("연락처 실행");

	}
	
	
	
	@RequestMapping(value="/msgContact.do", method = RequestMethod.GET)
	public void messageContact() {
		logger.info("연락처 실행");

	}
	
	@RequestMapping(value="/msgList.do", method = RequestMethod.GET)
	public void messageList() {
		logger.info("쪽지함 실행");
	}
	

}
