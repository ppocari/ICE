package com.will.ice.document.model;

public class DoctypeVO {
	 private int typeNo;
	 private String typeName;
	 
	public int getTypeNo() {
		return typeNo;
	}
	public void setTypeNo(int typeNo) {
		this.typeNo = typeNo;
	}
	public String getTypeName() {
		return typeName;
	}
	public void setTypeName(String typeName) {
		this.typeName = typeName;
	}

	@Override
	public String toString() {
		return "DoctypeVO [typeNo=" + typeNo + ", typeName=" + typeName + "]";
	 
}
