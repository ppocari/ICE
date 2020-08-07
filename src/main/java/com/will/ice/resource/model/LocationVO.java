package com.will.ice.resource.model;

public class LocationVO {
	private int locNo;
	private String locName;
	public int getLocNo() {
		return locNo;
	}
	public void setLocNo(int locNo) {
		this.locNo = locNo;
	}
	public String getLocName() {
		return locName;
	}
	public void setLocName(String locName) {
		this.locName = locName;
	}
	@Override
	public String toString() {
		return "LocationVO [locNo=" + locNo + ", locName=" + locName + "]";
	}
	
	
}
