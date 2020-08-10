package com.will.ice.boardComment.model;

import java.sql.Timestamp;

public class BoardCommentVO {
	private int no;
	private String boardNo;
	private String nickname;
	private String content;
	private Timestamp regdate;
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getBoardNo() {
		return boardNo;
	}
	public void setBoardNo(String boardNo) {
		this.boardNo = boardNo;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
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
		return "BoardCommentVO [no=" + no + ", boardNo=" + boardNo + ", nickname=" + nickname + ", content=" + content
				+ ", regdate=" + regdate + "]";
	}
	
}
