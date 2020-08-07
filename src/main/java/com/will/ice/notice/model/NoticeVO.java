package com.will.ice.notice.model;

import java.sql.Timestamp;

public class NoticeVO {
	private int noticeNo; 
	private String title;  
	private String memNo; 
	private String content;
	private Timestamp regdate;
	private String fileName; 
	private long fileSize; 
	private String orFileName;
	private int downcount; 
	private int readcount; 
	private String category; 
	private String main;
	private int newImgTerm;
	public int getNoticeNo() {
		return noticeNo;
	}
	public void setNoticeNo(int noticeNo) {
		this.noticeNo = noticeNo;
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
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public long getFileSize() {
		return fileSize;
	}
	public void setFileSize(long fileSize) {
		this.fileSize = fileSize;
	}
	public String getOrFileName() {
		return orFileName;
	}
	public void setOrFileName(String orFileName) {
		this.orFileName = orFileName;
	}
	public int getDowncount() {
		return downcount;
	}
	public void setDowncount(int downcount) {
		this.downcount = downcount;
	}
	public int getReadcount() {
		return readcount;
	}
	public void setReadcount(int readcount) {
		this.readcount = readcount;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getMain() {
		return main;
	}
	public void setMain(String main) {
		this.main = main;
	}
	public int getNewImgTerm() {
		return newImgTerm;
	}
	public void setNewImgTerm(int newImgTerm) {
		this.newImgTerm = newImgTerm;
	}
	
	@Override
	public String toString() {
		return "NoticeVO [noticeNo=" + noticeNo + ", title=" + title + ", memNo=" + memNo + ", content=" + content
				+ ", regdate=" + regdate + ", fileName=" + fileName + ", fileSize=" + fileSize + ", orFileName="
				+ orFileName + ", downcount=" + downcount + ", readcount=" + readcount + ", category=" + category
				+ ", main=" + main + ", newImgTerm=" + newImgTerm + "]";
	}
	
}
