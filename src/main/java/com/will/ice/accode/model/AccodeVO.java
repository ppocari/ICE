package com.will.ice.accode.model;

public class AccodeVO {
	private String accCode;
	private String accGroup;
	private String accTitle;
	private String accContent;
	public String getAccCode() {
		return accCode;
	}
	public void setAccCode(String accCode) {
		this.accCode = accCode;
	}
	public String getAccGroup() {
		return accGroup;
	}
	public void setAccGroup(String accGroup) {
		this.accGroup = accGroup;
	}
	public String getAccTitle() {
		return accTitle;
	}
	public void setAccTitle(String accTitle) {
		this.accTitle = accTitle;
	}
	public String getAccContent() {
		return accContent;
	}
	public void setAccContent(String accContent) {
		this.accContent = accContent;
	}
	@Override
	public String toString() {
		return "AccodeVO [accCode=" + accCode + ", accGroup=" + accGroup + ", accTitle=" + accTitle + ", accContent="
				+ accContent + "]";
	}
	
	
}
