package com.will.ice.resource.model;

import java.sql.Timestamp;

public class ResReserveVO {
	private int resNo;
	private String resName;
	private int rkNo;
	private String rkKind;
	private String rkColor;
	
	private int rvNo;
	
	private String startDate;
	private String endDate;
	private String startHour;
	private String endHour;
	
	private Timestamp rvStart;
	private Timestamp rvEnd;
	private String pickDate;
	
	private String rvReason;
	private String rvCantReason;
	private String rvState;
	private Timestamp rvRegdate;
	private String memNo;
	private String name;
	private String deptName;
	private String posName;
	
	
	public ResReserveVO() {
		super();
	}

	public ResReserveVO(int resNo, String pickDate) {
		super();
		this.resNo = resNo;
		this.pickDate = pickDate;
	}


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
	
	public String getRkColor() {
		return rkColor;
	}

	public void setRkColor(String rkColor) {
		this.rkColor = rkColor;
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
	
	

	public String getRvCantReason() {
		return rvCantReason;
	}

	public void setRvCantReason(String rvCantReason) {
		this.rvCantReason = rvCantReason;
	}

	public String getRvState() {
		return rvState;
	}

	public void setRvState(String rvState) {
		this.rvState = rvState;
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

	
	public String getStartDate() {
		return startDate;
	}

	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}

	public String getEndDate() {
		return endDate;
	}

	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}

	public String getStartHour() {
		return startHour;
	}

	public void setStartHour(String startHour) {
		this.startHour = startHour;
	}

	public String getEndHour() {
		return endHour;
	}

	public void setEndHour(String endHour) {
		this.endHour = endHour;
	}

	public String getPickDate() {
		return pickDate;
	}

	public void setPickDate(String pickDate) {
		this.pickDate = pickDate;
	}

	@Override
	public String toString() {
		return "ResReserveVO [resNo=" + resNo + ", resName=" + resName + ", rkNo=" + rkNo + ", rkKind=" + rkKind
				+ ", rkColor=" + rkColor + ", rvNo=" + rvNo + ", startDate=" + startDate + ", endDate=" + endDate
				+ ", startHour=" + startHour + ", endHour=" + endHour + ", rvStart=" + rvStart + ", rvEnd=" + rvEnd
				+ ", pickDate=" + pickDate + ", rvReason=" + rvReason + ", rvCantReason=" + rvCantReason + ", rvState="
				+ rvState + ", rvRegdate=" + rvRegdate + ", memNo=" + memNo + ", name=" + name + ", deptName="
				+ deptName + ", posName=" + posName + "]";
	}


}
