package com.will.ice.noticeComment.model;

import java.sql.Timestamp;

public class NoticeCommentViewVO {
	private int no;	//댓글번호
	private int noticeNo;	//게시판 번호
	private String name;	//별명
	private String memNo;		//회원번호
	private String content;		//내용	
	private Timestamp regdate;	//올린날짜
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getNoticeNo() {
		return noticeNo;
	}
	public void setNoticeNo(int noticeNo) {
		this.noticeNo = noticeNo;
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
	public Timestamp getRegdate() {
		return regdate;
	}
	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}
	@Override
	public String toString() {
		return "NoticeCommentViewVO [no=" + no + ", noticeNo=" + noticeNo + ", name=" + name + ", memNo=" + memNo
				+ ", content=" + content + ", regdate=" + regdate + "]";
	}
}
