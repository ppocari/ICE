package com.will.ice.workrecord.model;

import java.util.Date;

public class WorkRecordVO {
	private int cmtNo;
	private String memNo;
	private Date cmpIn;
	private Date cmpOut;
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
	public Date getCmpIn() {
		return cmpIn;
	}
	public void setCmpIn(Date cmpIn) {
		this.cmpIn = cmpIn;
	}
	public Date getCmpOut() {
		return cmpOut;
	}
	public void setCmpOut(Date cmpOut) {
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
