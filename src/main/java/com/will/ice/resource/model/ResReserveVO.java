package com.will.ice.resource.model;

import java.sql.Timestamp;

public class ResReserveVO {
	private int resNo;
	private String resName;
	private int rkNo;
	private String rkKind;
	
	private int rvNo;
	private Timestamp rvStart;
	private Timestamp rvEnd;
	
	private String rvReason;
	private String rvConfirm;
	private Timestamp rvRegdate;
	private String memNo;
	private String name;
	private String deptName;
	private String posName;
	public int getResNo() {
		return resNo;
	}
	public void setResNo(int resNo) {
		this.resNo = resNo;
	}
	public String getResName() {
		return resName;
	}
	public void setResName(String resName) {
		this.resName = resName;
	}
	public int getRkNo() {
		return rkNo;
	}
	public void setRkNo(int rkNo) {
		this.rkNo = rkNo;
	}
	public String getRkKind() {
		return rkKind;
	}
	public void setRkKind(String rkKind) {
		this.rkKind = rkKind;
	}
	public int getRvNo() {
		return rvNo;
	}
	public void setRvNo(int rvNo) {
		this.rvNo = rvNo;
	}
	public Timestamp getRvStart() {
		return rvStart;
	}
	public void setRvStart(Timestamp rvStart) {
		this.rvStart = rvStart;
	}
	public Timestamp getRvEnd() {
		return rvEnd;
	}
	public void setRvEnd(Timestamp rvEnd) {
		this.rvEnd = rvEnd;
	}
	public String getRvReason() {
		return rvReason;
	}
	public void setRvReason(String rvReason) {
		this.rvReason = rvReason;
	}
	public String getRvConfirm() {
		return rvConfirm;
	}
	public void setRvConfirm(String rvConfirm) {
		this.rvConfirm = rvConfirm;
	}
	public Timestamp getRvRegdate() {
		return rvRegdate;
	}
	public void setRvRegdate(Timestamp rvRegdate) {
		this.rvRegdate = rvRegdate;
	}
	public String getMemNo() {
		return memNo;
	}
	public void setMemNo(String memNo) {
		this.memNo = memNo;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getDeptName() {
		return deptName;
	}
	public void setDeptName(String deptName) {
		this.deptName = deptName;
	}
	public String getPosName() {
		return posName;
	}
	public void setPosName(String posName) {
		this.posName = posName;
	}
	@Override
	public String toString() {
		return "ResReserveVO [resNo=" + resNo + ", resName=" + resName + ", rkNo=" + rkNo + ", rkKind=" + rkKind
				+ ", rvNo=" + rvNo + ", rvStart=" + rvStart + ", rvEnd=" + rvEnd + ", rvReason=" + rvReason
				+ ", rvConfirm=" + rvConfirm + ", rvRegdate=" + rvRegdate + ", memNo=" + memNo + ", name=" + name
				+ ", deptName=" + deptName + ", posName=" + posName + "]";
	}
	
}