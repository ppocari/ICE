package com.will.ice.resource.model;

public class StringIntVo {
	private int no;
	private String text;
	private String text2;
	
	public int getNo() {
		return no;
	}
	

	public StringIntVo() {
		super();
	}

	public StringIntVo(int no, String text) {
		super();
		this.no = no;
		this.text = text;
	}


	public StringIntVo(String text, String text2) {
		super();
		this.text = text;
		this.text2 = text2;
	}


	public String getText() {
		return text;
	}


	public void setText(String text) {
		this.text = text;
	}


	public String getText2() {
		return text2;
	}


	public void setText2(String text2) {
		this.text2 = text2;
	}


	public void setNo(int no) {
		this.no = no;
	}


	@Override
	public String toString() {
		return "StringIntVo [no=" + no + ", text=" + text + ", text2=" + text2 + "]";
	}
	
	
	
	
}
