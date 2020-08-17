package com.will.ice.message.model;

import java.sql.Timestamp;

import com.will.ice.common.SearchVO;

public class MessageVO extends SearchVO {
	private int no;				//보낸 번호
	private String recMemNo;	//메세지 받을 사람 목록 8,9,
	private String recName;	//메세지 받을 사람 이름
	private int msgNo; 			//메세지 번호
		
	private String msgStatus;	//메세지 읽음 안읽음
	private String msgContent;	//메세지 내용
	private Timestamp msgRegdate;	//INSERT 안함, sysdate
	
	private String sendMemNo;	//메세지 쓰는 사람꺼
	private String sendName;	//메세지 쓰는 사람꺼
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getRecMemNo() {
		return recMemNo;
	}
	public void setRecMemNo(String recMemNo) {
		this.recMemNo = recMemNo;
	}
	public String getRecName() {
		return recName;
	}
	public void setRecName(String recName) {
		this.recName = recName;
	}
	public int getMsgNo() {
		return msgNo;
	}
	public void setMsgNo(int msgNo) {
		this.msgNo = msgNo;
	}
	public String getMsgStatus() {
		return msgStatus;
	}
	public void setMsgStatus(String msgStatus) {
		this.msgStatus = msgStatus;
	}
	public String getMsgContent() {
		return msgContent;
	}
	public void setMsgContent(String msgContent) {
		this.msgContent = msgContent;
	}
	public Timestamp getMsgRegdate() {
		return msgRegdate;
	}
	public void setMsgRegdate(Timestamp msgRegdate) {
		this.msgRegdate = msgRegdate;
	}
	public String getSendMemNo() {
		return sendMemNo;
	}
	public void setSendMemNo(String sendMemNo) {
		this.sendMemNo = sendMemNo;
	}
	public String getSendName() {
		return sendName;
	}
	public void setSendName(String sendName) {
		this.sendName = sendName;
	}
	@Override
	public String toString() {
		return "MessageVO [no=" + no + ", recMemNo=" + recMemNo + ", recName=" + recName + ", msgNo=" + msgNo
				+ ", msgStatus=" + msgStatus + ", msgContent=" + msgContent + ", msgRegdate=" + msgRegdate
				+ ", sendMemNo=" + sendMemNo + ", sendName=" + sendName + "]";
	}
	
	
	

	
}
