package com.will.ice.payline.model;

public class PaylineVO {
	private int payNo;
	private int docNo;
	private String payDate;
	private String memNo;
	private String read;
	
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
	@Override
	public String toString() {
		return "PaylineVO [payNo=" + payNo + ", docNo=" + docNo + ", payDate=" + payDate + ", memNo=" + memNo
				+ ", read=" + read + "]";
	}
	
}
