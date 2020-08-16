package com.will.ice.message.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.xmlbeans.impl.jam.mutable.MSourcePosition;
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
import com.will.ice.common.Depart_posi_dateVO;
import com.will.ice.member.model.MemberService;
import com.will.ice.member.model.MemberVO;
import com.will.ice.message.model.MessageListVO;
import com.will.ice.message.model.MessageService;
import com.will.ice.message.model.MessageVO;
import com.will.ice.model.DepartmentVO;
import com.will.ice.model.EtcService;


@Controller
@RequestMapping("/message")
public class MessageController {

	private static final Logger logger 
		= LoggerFactory.getLogger(MessageController.class);
	
	@Autowired private AddressService addrService;
	
	@Autowired private EtcService etcService;
	
	@Autowired private MessageService msgService;
	
	@Autowired private MemberService memService;
	
	
	@RequestMapping(value="/msgWrite.do", method = RequestMethod.GET)
	public void messageWrite_get() {
		logger.info("msgWrite.do 쪽지보내기 실행");
		
		
	}
	
	@RequestMapping(value="/msgWriteReply.do", method = RequestMethod.GET)
	public String messageWrite_post(@RequestParam String memNo) {
		logger.info("msgWriteReply.do 쪽지보내기 특정 사람에게 실행 memNo={}", memNo);
		
		return "message/msgWrite";
		
	}
	
	@RequestMapping(value="/msgAddr.do", method = RequestMethod.GET)
	public void msgAddr_get(Model model) {
		logger.info("쪽지그룹 목록 뿌려주기");
		
		
		List<DepartmentVO> deptList = etcService.DeptAll();
		logger.info("deptList={}",deptList);
		model.addAttribute("deptList", deptList);
	}
	
	@RequestMapping(value="/msgAddr_group.do", method = RequestMethod.GET)
	@ResponseBody
	public List<MemberVO> msgAddr_group_get(@RequestParam String deptCode,  Model model) {
		logger.info("쪽지 그룹에 해당하는 주소록 읽어오기 deptCode={}, adgNo={}",deptCode);
	
		Depart_posi_dateVO dpdvo = new Depart_posi_dateVO();
		dpdvo.setDeptCode(deptCode);
		List<MemberVO> memList = memService.selectMemberList(dpdvo);
		logger.info("memList={}",memList);
		return memList;
	}
	
	
	@RequestMapping(value="msgWrite_send.do", method = RequestMethod.POST)
	public String msgWrite_send(@ModelAttribute MessageVO msgVO, Model model) {
		
		msgVO.setMsgStatus("N");//읽지 않은 상태
		
		logger.info("msgVO={}",msgVO);
		int result_msg_rec = msgService.msgWrite_send(msgVO);
		
		String msg = "쪽지 전송 실패", url = "/message/msgWrite.do";
		if(result_msg_rec > 0) {
			msg = "쪽지 전송 성공";  
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
	}
	
	

	
	@RequestMapping(value="/msgSendList.do", method = RequestMethod.GET)
	public void messageList(HttpSession session, Model model) {
		logger.info("보낸 쪽지함 실행 ");
		String memNo = (String)session.getAttribute("identNum");
		MessageVO msgvo = new MessageVO();
		msgvo.setSendMemNo(memNo);
		logger.info("msgvo={}",msgvo);
		 List<MessageVO> msgList = msgService.msgSendList(msgvo);
		 
		 model.addAttribute("msgList", msgList);
	}
	

	
	@RequestMapping(value="/msgRecList.do", method = RequestMethod.GET)
	public void msgRecList(HttpSession session, Model model) {
		logger.info("받은 쪽지함 실행 ");
		String memNo = (String)session.getAttribute("identNum");
		MessageVO msgvo = new MessageVO();
		msgvo.setRecMemNo(memNo);
		logger.info("msgvo={}",msgvo);
		 List<MessageVO> msgList = msgService.msgRecList(msgvo);
		 
		 model.addAttribute("msgList", msgList);
	}
	
	@RequestMapping(value="/msgRecDetail.do", method = RequestMethod.GET)
	public void msgRecDetail(@RequestParam int no, HttpSession session, Model model) {
		logger.info("받은 쪽지함 실행 no={}", no);
		
		MessageVO msgvo = msgService.msgSelecyByno(no);
		
		int cnt = msgService.msgUpdateRead(msgvo.getMsgNo());
		logger.info("받은 쪽지함 실행 msgvo.getMsgNo()={}", msgvo.getMsgNo());
		logger.info("받은 쪽지함 실행 cnt={}", msgvo.getMsgNo());
		logger.info("받은 쪽지함 실행 msgvo={}", msgvo);
		
		model.addAttribute("msgvo", msgvo);
		
	}

	
	@RequestMapping(value="/msgSendDetail.do", method = RequestMethod.GET)
	public void msgSendDetail(@RequestParam int no, HttpSession session, Model model) {
		logger.info("받은 쪽지함 실행 no={}", no);
		
		MessageVO msgvo = msgService.msgSelecyByno(no);
		logger.info("받은 쪽지함 실행 msgvo={}", msgvo);
		
		model.addAttribute("msgvo", msgvo);
		
	}
	
	@RequestMapping(value="/msgDelete.do", method = RequestMethod.POST)
	public String msgDelete(@ModelAttribute MessageListVO msgListVO, Model model) {
		logger.info("쪽지 삭제 msgListVO={}", msgListVO);
		
		List<MessageVO> msgList = msgListVO.getMsgItems();
		
		int cnt =msgService.updateDelteMsg(msgList);
		
		String msg = "쪽지 휴지통 이동 실패", url = "/message/msgRecList.do";
		if(cnt > 0) {
			msg = "쪽지 휴지통 이동 성공";  
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
		
	}
	
	@RequestMapping(value="/msgTrash.do", method = RequestMethod.GET)
	public void msgTrash(HttpSession session, Model model) {
		logger.info("msgTrash.do 휴지통");
		//D인거 조회
		String recMemNo = (String)session.getAttribute("identNum");
		List<MessageVO> msgList = msgService.selectMsgTrash(recMemNo);
		
		model.addAttribute("msgList", msgList);
	}
	
	@RequestMapping(value="/msgREALDelete.do", method = RequestMethod.POST)
	public String msgREALDelete(@ModelAttribute MessageListVO msgListVO, Model model) {
		logger.info("msgREALDelete.do 아예 삭제");
		//D인거 조회
		logger.info("쪽지 삭제 msgListVO={}", msgListVO);
		
		List<MessageVO> msgList = msgListVO.getMsgItems();
		
		int cnt =msgService.msgREALDelete(msgList);
		
		String msg = "쪽지 삭제 실패", url = "/message/msgTrash.do";
		if(cnt > 0) {
			msg = "쪽지 삭제 성공";  
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
		
	}
	
	@RequestMapping(value="/msgDelBack.do", method = RequestMethod.POST)
	public String msgDelBack(@ModelAttribute MessageListVO msgListVO, Model model) {
		logger.info("msgDelBack.do 휴지통");
		//D 에서 읽음 상태로 복원
		logger.info("쪽지 삭제 msgListVO={}", msgListVO);
		
		List<MessageVO> msgList = msgListVO.getMsgItems();
		
		int cnt =msgService.msgDelBack(msgList);
		
		String msg = "쪽지 복원 실패", url = "/message/msgRecList.do";
		if(cnt > 0) {
			msg = "쪽지 복원 성공";  
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
		
	}
	
	
}
