package com.will.ice.board.model;

import java.security.Timestamp;

public class BoardVO {
	private int boardNo;
	private String title; 
	private String memNo; 
	private String nickname;
	private String content;
	private Timestamp regdate; 
	private int visited;
	private int recommend;
	private String category;
	private String isMain;
	private String filePath;
	
	public int getBoardNo() {
		return boardNo;
	}
	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getMemNo() {
		return memNo;
	}
	public void setMemNo(String memNo) {
		this.memNo = memNo;
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
	public int getVisited() {
		return visited;
	}
	public void setVisited(int visited) {
		this.visited = visited;
	}
	public int getRecommend() {
		return recommend;
	}
	public void setRecommend(int recommend) {
		this.recommend = recommend;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getIsMain() {
		return isMain;
	}
	public void setIsMain(String isMain) {
		this.isMain = isMain;
	}
	public String getFilePath() {
		return filePath;
	}
	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}
	
	@Override
	public String toString() {
		return "BoardVO [boardNo=" + boardNo + ", title=" + title + ", memNo=" + memNo + ", nickname=" + nickname
				+ ", content=" + content + ", regdate=" + regdate + ", visited=" + visited + ", recommend=" + recommend
				+ ", category=" + category + ", isMain=" + isMain + ", filePath=" + filePath + "]";
	} 
	
}
