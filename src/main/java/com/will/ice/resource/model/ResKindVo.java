package com.will.ice.resource.model;

public class ResKindVo {
	
	private int rkNo;
	private String rkKind;
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

	@Override
	public String toString() {
		return "ResKindVO [rkNo=" + rkNo + ", rkKind=" + rkKind + "]";
	}
	

}
