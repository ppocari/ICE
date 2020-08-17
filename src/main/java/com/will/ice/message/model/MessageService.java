package com.will.ice.message.model;

import java.util.List;

public interface MessageService {

	int msgWrite_send(MessageVO msgVO);

	List<MessageVO> msgSendList(MessageVO msgVO);

	List<MessageVO> msgRecList(MessageVO msgVO);

	MessageVO msgSelecyByno(int no);
}
