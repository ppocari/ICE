package com.will.ice.payment.model;

import java.sql.Timestamp;

public class PaymentVO {
	private int docNo;
	private String memNo;
	private int formNo;
	private String title;
	private String content;
	private String hasFile;
	private String progress;
	private String writedate;
	private int keep;
	private Timestamp expirydate;
	
	public int getDocNo() {
		return docNo;
	}
	public void setDocNo(int docNo) {
		this.docNo = docNo;
	}
	public String getMemNo() {
		return memNo;
	}
	public void setMemNo(String memNo) {
		this.memNo = memNo;
	}
	public int getFormNo() {
		return formNo;
	}
	public void setFormNo(int formNo) {
		this.formNo = formNo;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getHasFile() {
		return hasFile;
	}
	public void setHasFile(String hasFile) {
		this.hasFile = hasFile;
	}
	public String getProgress() {
		return progress;
	}
	public void setProgress(String progress) {
		this.progress = progress;
	}
	public String getWritedate() {
		return writedate;
	}
	public void setWritedate(String writedate) {
		this.writedate = writedate;
	}
	public int getKeep() {
		return keep;
	}
	public void setKeep(int keep) {
		this.keep = keep;
	}
	public Timestamp getExpirydate() {
		return expirydate;
	}
	public void setExpirydate(Timestamp expirydate) {
		this.expirydate = expirydate;
	}
	@Override
	public String toString() {
		return "PaymentVO [docNo=" + docNo + ", memNo=" + memNo + ", formNo=" + formNo + ", title=" + title
				+ ", content=" + content + ", hasFile=" + hasFile + ", progress=" + progress + ", writedate="
				+ writedate + ", keep=" + keep + ", expirydate=" + expirydate + "]";
	}
	
}
