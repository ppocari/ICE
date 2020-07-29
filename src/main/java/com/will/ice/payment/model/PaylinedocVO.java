package com.will.ice.payment.model;

import java.sql.Timestamp;

public class PaylinedocVO {
	private int docNo;
	private String writememNo;
	private int formNo;
	private int typeNo;
	private String title;
	private String content;
	private String hasFile;
	private String progress;
	private String writedate;
	private int keep;
	private Timestamp expirydate;
	private String imsy;
	private int payNo;
	private String getmemNo;
	private String payDate;
	
	public int getDocNo() {
		return docNo;
	}
	public void setDocNo(int docNo) {
		this.docNo = docNo;
	}
	public String getWritememNo() {
		return writememNo;
	}
	public void setWritememNo(String writememNo) {
		this.writememNo = writememNo;
	}
	public int getFormNo() {
		return formNo;
	}
	public void setFormNo(int formNo) {
		this.formNo = formNo;
	}
	public int getTypeNo() {
		return typeNo;
	}
	public void setTypeNo(int typeNo) {
		this.typeNo = typeNo;
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
	public String getImsy() {
		return imsy;
	}
	public void setImsy(String imsy) {
		this.imsy = imsy;
	}
	public int getPayNo() {
		return payNo;
	}
	public void setPayNo(int payNo) {
		this.payNo = payNo;
	}
	public String getGetmemNo() {
		return getmemNo;
	}
	public void setGetmemNo(String getmemNo) {
		this.getmemNo = getmemNo;
	}
	public String getPayDate() {
		return payDate;
	}
	public void setPayDate(String payDate) {
		this.payDate = payDate;
	}
	@Override
	public String toString() {
		return "PaylinedocVO [docNo=" + docNo + ", writememNo=" + writememNo + ", formNo=" + formNo + ", typeNo="
				+ typeNo + ", title=" + title + ", content=" + content + ", hasFile=" + hasFile + ", progress="
				+ progress + ", writedate=" + writedate + ", keep=" + keep + ", expirydate=" + expirydate + ", imsy="
				+ imsy + ", payNo=" + payNo + ", getmemNo=" + getmemNo + ", payDate=" + payDate + "]";
	}
	
}
