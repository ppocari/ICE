package com.will.ice.message.model;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.will.ice.message.controller.MessageController;

@Service
public class MessageServiceImpl implements MessageService {
	@Autowired private MessageDAO msgDao;

	private static final Logger logger 
	= LoggerFactory.getLogger(MessageServiceImpl.class);

	@Override
	public int msgWrite_send(MessageVO msgVO) {

		logger.info("msgVO={}",msgVO);
	
		int result_msg = msgDao.msgWrite_send_msg(msgVO);		// 메세지 내용 저장
		logger.info("result_msg={}",result_msg);
		String recMemNo = msgVO.getRecMemNo(); 
		String recMemNo_arr[] = recMemNo.split(",");
		logger.info("recMemNo_arr={}",recMemNo_arr.length);

		
		int result_msg_rec = 0;
		if(result_msg > 0) {
			//쪾지 내용 저장 성공 
			for( int i=0; i<recMemNo_arr.length; i++) {
				msgVO.setRecMemNo(recMemNo_arr[i]); 
				
				logger.info("recMemNo_arr[]={}",recMemNo_arr[i]);
				logger.info("msgVO={}",msgVO);
				result_msg_rec = msgDao.msgWrite_send_msg_rec(msgVO); 
			} 
			
		}else { //실패 
			
		}

		return result_msg_rec;

	}

	@Override
	public List<MessageVO> msgSendList(MessageVO msgVO) {
		return msgDao.msgSendList(msgVO);
	}

	@Override
	public List<MessageVO> msgRecList(MessageVO msgVO) {
		return msgDao.msgRecList(msgVO);
	}

	
}