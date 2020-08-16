package com.will.ice.resource.model;

import java.sql.Timestamp;

public class ResManageVO {
	private int resNo;
	private String resName;
	private String resImage;
	private Long resSize;
	private String resOriginalImage;
	private int rkNo;
	private String rkKind;
	private String resLocation;
	private String resSubdesc;
	private String resColor;
	private Timestamp resRegdate;
	private String resState;
	private String resIsDel;
	
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
	public String getResImage() {
		return resImage;
	}
	public void setResImage(String resImage) {
		this.resImage = resImage;
	}
	
	public Long getResSize() {
		return resSize;
	}
	public void setResSize(Long resSize) {
		this.resSize = resSize;
	}
	
	public String getResOriginalImage() {
		return resOriginalImage;
	}
	public void setResOriginalImage(String resOriginalImage) {
		this.resOriginalImage = resOriginalImage;
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
	public String getResLocation() {
		return resLocation;
	}
	public void setResLocation(String resLocation) {
		this.resLocation = resLocation;
	}
	public String getResSubdesc() {
		return resSubdesc;
	}
	public void setResSubdesc(String resSubdesc) {
		this.resSubdesc = resSubdesc;
	}
	
	public String getResColor() {
		return resColor;
	}
	public void setResColor(String resColor) {
		this.resColor = resColor;
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
	@Override
	public String toString() {
		return "ResManageVO [resNo=" + resNo + ", resName=" + resName + ", resImage=" + resImage + ", resSize="
				+ resSize + ", resOriginalImage=" + resOriginalImage + ", rkNo=" + rkNo + ", rkKind=" + rkKind
				+ ", resLocation=" + resLocation + ", resSubdesc=" + resSubdesc + ", resColor=" + resColor
				+ ", resRegdate=" + resRegdate + ", resState=" + resState + ", resIsDel=" + resIsDel + "]";
	}
	
	
}
