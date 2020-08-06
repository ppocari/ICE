package com.will.ice.notice.model;

import java.sql.Timestamp;

public class NoticeVO {
	private int NOTI_NO; 
	private String NOTI_TITLE;  
	private String MEMNO; 
	private String NOTI_CONTENT;
	private Timestamp NOTI_REGDATE;
	private String NOTI_FILENAME; 
	private long NOTI_FILESIZE; 
	private String NOTI_ORFILENAME;
	private int NOTI_DOWNCOUNT; 
	private int NOTI_READCOUNT; 
	private String NOTI_CATEGORY; 
	private String NOTI_MAIN;
	private int newImgTerm;
	public int getNOTI_NO() {
		return NOTI_NO;
	}
	public void setNOTI_NO(int nOTI_NO) {
		NOTI_NO = nOTI_NO;
	}
	public String getNOTI_TITLE() {
		return NOTI_TITLE;
	}
	public void setNOTI_TITLE(String nOTI_TITLE) {
		NOTI_TITLE = nOTI_TITLE;
	}
	public String getMEMNO() {
		return MEMNO;
	}
	public void setMEMNO(String mEMNO) {
		MEMNO = mEMNO;
	}
	public String getNOTI_CONTENT() {
		return NOTI_CONTENT;
	}
	public void setNOTI_CONTENT(String nOTI_CONTENT) {
		NOTI_CONTENT = nOTI_CONTENT;
	}
	public Timestamp getNOTI_REGDATE() {
		return NOTI_REGDATE;
	}
	public void setNOTI_REGDATE(Timestamp nOTI_REGDATE) {
		NOTI_REGDATE = nOTI_REGDATE;
	}
	public String getNOTI_FILENAME() {
		return NOTI_FILENAME;
	}
	public void setNOTI_FILENAME(String nOTI_FILENAME) {
		NOTI_FILENAME = nOTI_FILENAME;
	}
	public long getNOTI_FILESIZE() {
		return NOTI_FILESIZE;
	}
	public void setNOTI_FILESIZE(long nOTI_FILESIZE) {
		NOTI_FILESIZE = nOTI_FILESIZE;
	}
	public String getNOTI_ORFILENAME() {
		return NOTI_ORFILENAME;
	}
	public void setNOTI_ORFILENAME(String nOTI_ORFILENAME) {
		NOTI_ORFILENAME = nOTI_ORFILENAME;
	}
	public int getNOTI_DOWNCOUNT() {
		return NOTI_DOWNCOUNT;
	}
	public void setNOTI_DOWNCOUNT(int nOTI_DOWNCOUNT) {
		NOTI_DOWNCOUNT = nOTI_DOWNCOUNT;
	}
	public int getNOTI_READCOUNT() {
		return NOTI_READCOUNT;
	}
	public void setNOTI_READCOUNT(int nOTI_READCOUNT) {
		NOTI_READCOUNT = nOTI_READCOUNT;
	}
	public String getNOTI_CATEGORY() {
		return NOTI_CATEGORY;
	}
	public void setNOTI_CATEGORY(String nOTI_CATEGORY) {
		NOTI_CATEGORY = nOTI_CATEGORY;
	}
	public String getNOTI_MAIN() {
		return NOTI_MAIN;
	}
	public void setNOTI_MAIN(String nOTI_MAIN) {
		NOTI_MAIN = nOTI_MAIN;
	}
	public int getNewImgTerm() {
		return newImgTerm;
	}
	public void setNewImgTerm(int newImgTerm) {
		this.newImgTerm = newImgTerm;
	}
	@Override
	public String toString() {
		return "NoticeVO [NOTI_NO=" + NOTI_NO + ", NOTI_TITLE=" + NOTI_TITLE + ", MEMNO=" + MEMNO + ", NOTI_CONTENT="
				+ NOTI_CONTENT + ", NOTI_REGDATE=" + NOTI_REGDATE + ", NOTI_FILENAME=" + NOTI_FILENAME
				+ ", NOTI_FILESIZE=" + NOTI_FILESIZE + ", NOTI_ORFILENAME=" + NOTI_ORFILENAME + ", NOTI_DOWNCOUNT="
				+ NOTI_DOWNCOUNT + ", NOTI_READCOUNT=" + NOTI_READCOUNT + ", NOTI_CATEGORY=" + NOTI_CATEGORY
				+ ", NOTI_MAIN=" + NOTI_MAIN + ", newImgTerm=" + newImgTerm + "]";
	}

	
	
	
	
}
