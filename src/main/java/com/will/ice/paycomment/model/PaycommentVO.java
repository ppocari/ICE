package com.will.ice.paycomment.model;

import java.sql.Timestamp;

public class PaycommentVO {
	private int commentNo;
	private String memNo;
	private String content;
	private int docNo;
	private Timestamp regdate;
	private String signName;
	private String originalSignName;
	
	public int getCommentNo() {
		return commentNo;
	}
	public void setCommentNo(int commentNo) {
		this.commentNo = commentNo;
	}
	public String getMemNo() {
		return memNo;
	}
	public void setMemNo(String memNo) {
		this.memNo = memNo;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getDocNo() {
		return docNo;
	}
	public void setDocNo(int docNo) {
		this.docNo = docNo;
	}
	public Timestamp getRegdate() {
		return regdate;
	}
	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}
	public String getSignName() {
		return signName;
	}
	public void setSignName(String signName) {
		this.signName = signName;
	}
	public String getOriginalSignName() {
		return originalSignName;
	}
	public void setOriginalSignName(String originalSignName) {
		this.originalSignName = originalSignName;
	}
	@Override
	public String toString() {
		return "PaycommentVO [commentNo=" + commentNo + ", memNo=" + memNo + ", content=" + content + ", docNo=" + docNo
				+ ", regdate=" + regdate + ", signName=" + signName + ", originalSignName=" + originalSignName + "]";
	}
}
