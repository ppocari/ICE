package com.will.ice.document.model;

public class DocumentviewVO {
	private int payNo;
	private int docNo;
	private String payDate;
	private String memNo;
	private String read;
	private String name;
	private String posName;
	private String deptName;
	
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
	@Override
	public String toString() {
		return "DocumentviewVO [payNo=" + payNo + ", docNo=" + docNo + ", payDate=" + payDate + ", memNo=" + memNo
				+ ", read=" + read + ", name=" + name + ", posName=" + posName + ", deptName=" + deptName + "]";
	}
	
}
