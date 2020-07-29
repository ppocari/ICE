package com.will.ice.address.model;

public class AddressGroupVO {
	private int adgNo;
	private String groupName;
	private String memNo;
	public int getAdgNo() {
		return adgNo;
	}
	public void setAdgNo(int adgNo) {
		this.adgNo = adgNo;
	}
	public String getGroupName() {
		return groupName;
	}
	public void setGroupName(String groupName) {
		this.groupName = groupName;
	}
	public String getMemNo() {
		return memNo;
	}
	public void setMemNo(String memNo) {
		this.memNo = memNo;
	}
	@Override
	public String toString() {
		return "AddressGroupVO [adgNo=" + adgNo + ", groupName=" + groupName + ", memNo=" + memNo + "]";
	}
	
}
