package com.will.ice.model;

public class PositionVO {
	private String posCode;
	private String posName;
	public String getPosCode() {
		return posCode;
	}
	public void setPosCode(String posCode) {
		this.posCode = posCode;
	}
	public String getPosName() {
		return posName;
	}
	public void setPosName(String posName) {
		this.posName = posName;
	}
	@Override
	public String toString() {
		return "PositionVO [posCode=" + posCode + ", posName=" + posName + "]";
	}
	
	
}
