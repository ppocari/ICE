package com.will.ice.payment.model;

import java.sql.Timestamp;

public class PaylistViewVO {
	private int docNo;
	private String memNo;
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
	private String gmemNo;
	private String paydate;
	private int payNo;
	private String read;
	private String typeName;
	private String name;
	
	public String getGmemNo() {
		return gmemNo;
	}
	public void setGmemNo(String gmemNo) {
		this.gmemNo = gmemNo;
	}
	public String getPaydate() {
		return paydate;
	}
	public void setPaydate(String paydate) {
		this.paydate = paydate;
	}
	public int getPayNo() {
		return payNo;
	}
	public void setPayNo(int payNo) {
		this.payNo = payNo;
	}
	public String getRead() {
		return read;
	}
	public void setRead(String read) {
		this.read = read;
	}
	public String getImsy() {
		return imsy;
	}
	public void setImsy(String imsy) {
		this.imsy = imsy;
	}
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
	public String getTypeName() {
		return typeName;
	}
	public void setTypeName(String typeName) {
		this.typeName = typeName;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	@Override
	public String toString() {
		return "PaylistViewVO [docNo=" + docNo + ", memNo=" + memNo + ", formNo=" + formNo + ", typeNo=" + typeNo
				+ ", title=" + title + ", content=" + content + ", hasFile=" + hasFile + ", progress=" + progress
				+ ", writedate=" + writedate + ", keep=" + keep + ", expirydate=" + expirydate + ", imsy=" + imsy
				+ ", gmemNo=" + gmemNo + ", paydate=" + paydate + ", payNo=" + payNo + ", read=" + read + ", typeName="
				+ typeName + ", name=" + name + "]";
	}
}
