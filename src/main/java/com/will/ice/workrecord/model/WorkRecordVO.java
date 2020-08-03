package com.will.ice.workrecord.model;

public class WorkRecordVO {
	private int cmpNo;
	private String memNo;
	private String cmpIn;
	private String cmpOut;
	private String cmpStatus;
	private String cmpRegdate;
	private String cmpMonth;
	
	
	public int getCmpNo() {
		return cmpNo;
	}
	public void setCmpNo(int cmpNo) {
		this.cmpNo = cmpNo;
	}
	public String getMemNo() {
		return memNo;
	}
	public void setMemNo(String memNo) {
		this.memNo = memNo;
	}
	public String getCmpIn() {
		return cmpIn;
	}
	public void setCmpIn(String cmpIn) {
		this.cmpIn = cmpIn;
	}
	public String getCmpOut() {
		return cmpOut;
	}
	public void setCmpOut(String cmpOut) {
		this.cmpOut = cmpOut;
	}
	public String getCmpStatus() {
		return cmpStatus;
	}
	public void setCmpStatus(String cmpStatus) {
		this.cmpStatus = cmpStatus;
	}
	public String getCmpRegdate() {
		return cmpRegdate;
	}
	public void setCmpRegdate(String cmpRegdate) {
		this.cmpRegdate = cmpRegdate;
	}
	public String getCmpMonth() {
		return cmpMonth;
	}
	public void setCmpMonth(String cmpMonth) {
		this.cmpMonth = cmpMonth;
	}
	
	
	@Override
	public String toString() {
		return "WorkRecordVO [cmpNo=" + cmpNo + ", memNo=" + memNo + ", cmpIn=" + cmpIn + ", cmpOut=" + cmpOut
				+ ", cmpStatus=" + cmpStatus + ", cmpRegdate=" + cmpRegdate + ", cmpMonth=" + cmpMonth + ", getCmpNo()="
				+ getCmpNo() + ", getMemNo()=" + getMemNo() + ", getCmpIn()=" + getCmpIn() + ", getCmpOut()="
				+ getCmpOut() + ", getCmpStatus()=" + getCmpStatus() + ", getCmpRegdate()=" + getCmpRegdate()
				+ ", getCmpMonth()=" + getCmpMonth() + ", getClass()=" + getClass() + ", hashCode()=" + hashCode()
				+ ", toString()=" + super.toString() + "]";
	}
	
	
	
}
