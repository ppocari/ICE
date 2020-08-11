package com.will.ice.boardComment.model;

import java.sql.Timestamp;

public class BoardCommentVO {
	private int no;	//댓글번호
	private int boardNo;	//게시판 번호
	private String nickname;	//별명
	private String memNo;		//회원번호
	private String content;		//내용	
	private Timestamp regdate;	//올린날짜
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public int getBoardNo() {
		return boardNo;
	}
	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
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
		return "BoardCommentVO [no=" + no + ", boardNo=" + boardNo + ", nickname=" + nickname + ", memNo=" + memNo
				+ ", content=" + content + ", regdate=" + regdate + "]";
	}
	
}
