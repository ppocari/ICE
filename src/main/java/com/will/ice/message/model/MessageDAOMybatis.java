package com.will.ice.message.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MessageDAOMybatis implements MessageDAO{

	private String namespace = "com.mybatis.mapper.oracle.message.";
	
	@Autowired private SqlSessionTemplate sqlsession;

	private static final Logger logger 
	= LoggerFactory.getLogger(MessageDAOMybatis.class);
	
	@Override
	public int msgWrite_send_msg(MessageVO msgVO) {
		return sqlsession.insert(namespace+"msgWrite_send_msg",msgVO);
	}

	@Override
	public int msgWrite_send_msg_rec(MessageVO msgVO) {
		return sqlsession.insert(namespace+"msgWrite_send_msg_rec",msgVO);
	}

	@Override
	public List<MessageVO> msgSendList(MessageVO msgVO) {
		return sqlsession.selectList(namespace+"msgSendList", msgVO);
	}

	@Override
	public List<MessageVO> msgRecList(MessageVO msgVO) {
		return sqlsession.selectList(namespace+"msgRecList", msgVO);
	}

	@Override
	public MessageVO msgSelecyByno(int no) {
		return sqlsession.selectOne(namespace+"msgSelecyByno", no);
	}

	
	
	
}
