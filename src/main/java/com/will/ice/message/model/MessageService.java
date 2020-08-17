package com.will.ice.message.model;

import java.util.List;

import com.will.ice.common.SearchVO;

public interface MessageService {

	int msgWrite_send(MessageVO msgVO);

	List<MessageVO> msgSendList(MessageVO msgVO);

	List<MessageVO> msgRecList(MessageVO msgVO);

	MessageVO msgSelecyByno(int no);

	int msgUpdateRead(int msgNo);

	int updateDelteMsg(List<MessageVO> msgList);

	int msgREALDelete(List<MessageVO> msgList);

	List<MessageVO> selectMsgTrash(MessageVO msgVO);

	int msgDelBack(List<MessageVO> msgList);

	int selectUnRead(String recMemNo);
	
	List<MessageVO> msgRecListOnlyN(MessageVO msgVO);

	int selectTotalMsgRecord(MessageVO msgVO);

	int selectTotalMsgSendRecord(MessageVO msgVO);
	
	int selectTotalMsgRecRecord(MessageVO msgVO);
}
