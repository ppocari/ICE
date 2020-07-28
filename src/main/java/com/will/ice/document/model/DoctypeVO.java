package com.will.ice.document.model;

public class DoctypeVO {
	 private int typeNo;
	 private String typeName;
	 private int poscode;
	 
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
	public int getPoscode() {
		return poscode;
	}
	public void setPoscode(int poscode) {
		this.poscode = poscode;
	}
	@Override
	public String toString() {
		return "DoctypeVO [typeNo=" + typeNo + ", typeName=" + typeName + ", poscode=" + poscode + "]";
	}
	 
}
