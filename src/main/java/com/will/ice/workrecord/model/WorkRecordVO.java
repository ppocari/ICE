package com.will.ice.workrecord.model;

public class WorkRecordVO {
	private int cmtNo;
	private String memNo;
	private String cmpIn;
	private String cmpOut;
	private String cmpStatus;
	
	
	public int getCmtNo() {
		return cmtNo;
	}
	public void setCmtNo(int cmtNo) {
		this.cmtNo = cmtNo;
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
	
	
	@Override
	public String toString() {
		return "WorkRecordVO [cmtNo=" + cmtNo + ", memNo=" + memNo + ", cmpIn=" + cmpIn + ", cmpOut=" + cmpOut
				+ ", cmpStatus=" + cmpStatus + "]";
	}
	
	
}
