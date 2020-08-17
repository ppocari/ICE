package com.will.ice.document.model;

import java.sql.Timestamp;

public class DocumentviewVO {
	private int payNo;
	private int docNo;
	private String payDate;
	private String memNo;
	private String read;
	private String name;
	private String posName;
	private int posCode;
	private String deptName;
	private String content; //피드백
	private Timestamp regdate;
	private String signName;
	
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
	public String getSignName() {
		return signName;
	}
	public void setSignName(String signName) {
		this.signName = signName;
	}
	public int getPayNo() {
		return payNo;
	}
	public void setPayNo(int payNo) {
		this.payNo = payNo;
	}
	public int getDocNo() {
		return docNo;
	}
	public void setDocNo(int docNo) {
		this.docNo = docNo;
	}
	public String getPayDate() {
		return payDate;
	}
	public void setPayDate(String payDate) {
		this.payDate = payDate;
	}
	public String getMemNo() {
		return memNo;
	}
	public void setMemNo(String memNo) {
		this.memNo = memNo;
	}
	public String getRead() {
		return read;
	}
	public void setRead(String read) {
		this.read = read;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPosName() {
		return posName;
	}
	public void setPosName(String posName) {
		this.posName = posName;
	}
	public String getDeptName() {
		return deptName;
	}
	public void setDeptName(String deptName) {
		this.deptName = deptName;
	}
	
	public int getPosCode() {
		return posCode;
	}
	public void setPosCode(int posCode) {
		this.posCode = posCode;
	}
	@Override
	public String toString() {
		return "DocumentviewVO [payNo=" + payNo + ", docNo=" + docNo + ", payDate=" + payDate + ", memNo=" + memNo
				+ ", read=" + read + ", name=" + name + ", posName=" + posName + ", posCode=" + posCode + ", deptName="
				+ deptName + ", content=" + content + ", regdate=" + regdate + ", signName=" + signName + "]";
	}
}
