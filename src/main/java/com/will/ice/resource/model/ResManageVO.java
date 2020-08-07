package com.will.ice.resource.model;

import java.sql.Timestamp;

public class ResManageVO {
	private int resNo;
	private String resName;
	private String resImage;
	private int locNo;
	private String locDetail;
	private int resPerson;
	private String resSubdesc;
	private Timestamp resRegdate;
	private String resState;
	private String resIsDel;
	private String locName;
	public int getResNo() {
		return resNo;
	}
	public String getResName() {
		return resName;
	}
	public void setResName(String resName) {
		this.resName = resName;
	}
	public String getResImage() {
		return resImage;
	}
	public void setResImage(String resImage) {
		this.resImage = resImage;
	}
	public int getLocNo() {
		return locNo;
	}
	public void setLocNo(int locNo) {
		this.locNo = locNo;
	}
	public String getLocDetail() {
		return locDetail;
	}
	public void setLocDetail(String locDetail) {
		this.locDetail = locDetail;
	}
	public int getResPerson() {
		return resPerson;
	}
	public void setResPerson(int resPerson) {
		this.resPerson = resPerson;
	}
	public String getResSubdesc() {
		return resSubdesc;
	}
	public void setResSubdesc(String resSubdesc) {
		this.resSubdesc = resSubdesc;
	}
	public Timestamp getResRegdate() {
		return resRegdate;
	}
	public void setResRegdate(Timestamp resRegdate) {
		this.resRegdate = resRegdate;
	}
	public String getResState() {
		return resState;
	}
	public void setResState(String resState) {
		this.resState = resState;
	}
	public String getResIsDel() {
		return resIsDel;
	}
	public void setResIsDel(String resIsDel) {
		this.resIsDel = resIsDel;
	}
	public String getLocName() {
		return locName;
	}
	public void setLocName(String locName) {
		this.locName = locName;
	}
	public void setResNo(int resNo) {
		this.resNo = resNo;
	}
	
	@Override
	public String toString() {
		return "ResManageVO [resNo=" + resNo + ", resName=" + resName + ", resImage=" + resImage + ", locNo=" + locNo
				+ ", locDetail=" + locDetail + ", resPerson=" + resPerson + ", resSubdesc=" + resSubdesc
				+ ", resRegdate=" + resRegdate + ", resState=" + resState + ", resIsDel=" + resIsDel + ", locName="
				+ locName + "]";
	}

}
