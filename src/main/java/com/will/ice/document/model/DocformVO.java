package com.will.ice.document.model;

public class DocformVO {
	private int formNo;
	private String formName;
	private String content;
	
	public int getFormNo() {
		return formNo;
	}
	public void setFormNo(int formNo) {
		this.formNo = formNo;
	}
	public String getFormName() {
		return formName;
	}
	public void setFormName(String formName) {
		this.formName = formName;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	@Override
	public String toString() {
		return "DocformVO [formNo=" + formNo + ", formName=" + formName + ", content=" + content + "]";
	}
}
