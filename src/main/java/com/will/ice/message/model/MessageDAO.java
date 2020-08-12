package com.will.ice.message.model;

import java.util.List;

public interface MessageDAO {

	int msgWrite_send_msg(MessageVO msgVO);
	int msgWrite_send_msg_rec(MessageVO msgVO);
	
	List<MessageVO> msgSendList(MessageVO msgVO);
	
	List<MessageVO> msgRecList(MessageVO msgVO);
}
