package com.will.ice.message.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.will.ice.common.SearchVO;

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

	@Override
	public int msgUpdateRead(int msgNo) {
		return sqlsession.update(namespace+"msgUpdateRead", msgNo);
	}

	@Override
	public int updateDelteMsg(int msgNo) {
		return sqlsession.update(namespace+"updateDelteMsg", msgNo);
	}

	@Override
	public int msgREALDeleteByNo(int no) {
		return sqlsession.delete(namespace+"msgREALDeleteByNo", no);
	}
	
	@Override
	public int msgREALDeleteByMsgNo(int msgNo) {
		return sqlsession.delete(namespace+"msgREALDeleteByMsgNo", msgNo);
	}

	@Override
	public List<MessageVO> selectMsgTrash(MessageVO msgVO) {
		return sqlsession.selectList(namespace+"selectMsgTrash", msgVO);
	}

	@Override
	public int msgDelBack(int msgNo) {
		return sqlsession.update(namespace+"msgUpdateRead", msgNo);
	}

	@Override
	public int selectUnRead(String recMemNo) {
		return sqlsession.selectOne(namespace+"selectUnRead", recMemNo);
	}

	@Override
	public List<MessageVO> msgRecListOnlyN(MessageVO msgVO) {
		return sqlsession.selectList(namespace+"msgRecListOnlyN", msgVO);
	}

	@Override
	public int selectTotalMsgRecord(MessageVO msgVO) {
		return sqlsession.selectOne(namespace+"selectTotalMsgRecord", msgVO);
	}

	@Override
	public int selectTotalMsgSendRecord(MessageVO msgVO) {
		return sqlsession.selectOne(namespace+"selectTotalMsgSendRecord", msgVO);
	}

	@Override
	public int selectTotalMsgRecRecord(MessageVO msgVO) {
		return sqlsession.selectOne(namespace+"selectTotalMsgRecRecord", msgVO);
	}

	@Override
	public int updateDelteMsgOne(int msgno) {
		return sqlsession.update(namespace+"updateDelteMsgOne", msgno);
	}

	@Override
	public int msgDelBackOne(int msgno) {
		return sqlsession.update(namespace+"msgDelBackOne", msgno);
	}

	
	
	
}
