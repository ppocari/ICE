package com.will.ice.companyCard.model;


public class CartVO {
	private int price;
	private String deptName;
	private String posCode;
	
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getDeptName() {
		return deptName;
	}
	public void setDeptName(String deptName) {
		this.deptName = deptName;
	}
	public String getPosCode() {
		return posCode;
	}
	public void setPosCode(String posCode) {
		this.posCode = posCode;
	}
	@Override
	public String toString() {
		return "CartVO [price=" + price + ", deptName=" + deptName + ", posCode=" + posCode + "]";
	}
	
}
