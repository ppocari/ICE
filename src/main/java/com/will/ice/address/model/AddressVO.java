package com.will.ice.address.model;

import java.security.Timestamp;

public class AddressVO {
	private int adNo;
	private String name;
	private String hp1;
	private String hp2;
	private String hp3;
	private String email1;
	private String email2;
	private int adgNo;
	private String company;
	private String deptName;
	private String posName;
	private String isFavorite;
	private Timestamp isDeleted;
	private String groupName;
	private String homeAddress;
	private String homePage;
	private String messenger;
	private String SNS;
	private String memo;
	public int getAdNo() {
		return adNo;
	}
	public void setAdNo(int adNo) {
		this.adNo = adNo;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getHp1() {
		return hp1;
	}
	public void setHp1(String hp1) {
		this.hp1 = hp1;
	}
	public String getHp2() {
		return hp2;
	}
	public void setHp2(String hp2) {
		this.hp2 = hp2;
	}
	public String getHp3() {
		return hp3;
	}
	public void setHp3(String hp3) {
		this.hp3 = hp3;
	}
	public String getEmail1() {
		return email1;
	}
	public void setEmail1(String email1) {
		this.email1 = email1;
	}
	public String getEmail2() {
		return email2;
	}
	public void setEmail2(String email2) {
		this.email2 = email2;
	}
	public int getAdgNo() {
		return adgNo;
	}
	public void setAdgNo(int adgNo) {
		this.adgNo = adgNo;
	}
	public String getCompany() {
		return company;
	}
	public void setCompany(String company) {
		this.company = company;
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
	public String getIsFavorite() {
		return isFavorite;
	}
	public void setIsFavorite(String isFavorite) {
		this.isFavorite = isFavorite;
	}
	public Timestamp getIsDeleted() {
		return isDeleted;
	}
	public void setIsDeleted(Timestamp isDeleted) {
		this.isDeleted = isDeleted;
	}
	public String getGroupName() {
		return groupName;
	}
	public void setGroupName(String groupName) {
		this.groupName = groupName;
	}
	public String getHomeAddress() {
		return homeAddress;
	}
	public void setHomeAddress(String homeAddress) {
		this.homeAddress = homeAddress;
	}
	public String getHomePage() {
		return homePage;
	}
	public void setHomePage(String homePage) {
		this.homePage = homePage;
	}
	public String getMessenger() {
		return messenger;
	}
	public void setMessenger(String messenger) {
		this.messenger = messenger;
	}
	public String getSNS() {
		return SNS;
	}
	public void setSNS(String sNS) {
		SNS = sNS;
	}
	public String getMemo() {
		return memo;
	}
	public void setMemo(String memo) {
		this.memo = memo;
	}
	
	@Override
	public String toString() {
		return "AddressVO [adNo=" + adNo + ", name=" + name + ", hp1=" + hp1 + ", hp2=" + hp2 + ", hp3=" + hp3
				+ ", email1=" + email1 + ", email2=" + email2 + ", adgNo=" + adgNo + ", company=" + company
				+ ", deptName=" + deptName + ", posName=" + posName + ", isFavorite=" + isFavorite + ", isDeleted="
				+ isDeleted + ", groupName=" + groupName + ", homeAddress=" + homeAddress + ", homePage=" + homePage
				+ ", messenger=" + messenger + ", SNS=" + SNS + ", memo=" + memo + "]";
	}
	
}
