package com.will.ice.message.model;

import java.util.List;

import com.will.ice.common.SearchVO;

public interface MessageDAO {

	int msgWrite_send_msg(MessageVO msgVO);
	int msgWrite_send_msg_rec(MessageVO msgVO);
	
	List<MessageVO> msgSendList(MessageVO msgVO);
	
	List<MessageVO> msgRecList(MessageVO msgVO);
	
	MessageVO msgSelecyByno(int no);
	
	int msgUpdateRead(int msgNo);
	int updateDelteMsg(int msgNo);
	int msgREALDeleteByNo(int no);
	int msgREALDeleteByMsgNo(int msgNo);
	List<MessageVO> selectMsgTrash(MessageVO msgVO);
	int msgDelBack(int msgNo);
	int selectUnRead(String recMemNo);
	
	List<MessageVO> msgRecListOnlyN(MessageVO msgVO);
	
	int selectTotalMsgRecord(MessageVO msgVO);
	
	int selectTotalMsgSendRecord(MessageVO msgVO);
	
	int selectTotalMsgRecRecord(MessageVO msgVO);
	
	int updateDelteMsgOne(int msgno);
	
	int msgDelBackOne(int msgno);
}
