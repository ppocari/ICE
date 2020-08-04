package com.will.ice.common;

public class Depart_posi_dateVO {
	private String deptCode;
	private String posCode;
	private String hiredate1;
	private String hiredate2;
	
	private String usedate1;
	private String usedate2;
	private String price1;
	private String price2;

	private String useplace;
	
	public String getDeptCode() {
		return deptCode;
	}

	public void setDeptCode(String deptCode) {
		this.deptCode = deptCode;
	}

	public String getPosCode() {
		return posCode;
	}

	public void setPosCode(String posCode) {
		this.posCode = posCode;
	}

	public String getHiredate1() {
		return hiredate1;
	}

	public void setHiredate1(String hiredate1) {
		this.hiredate1 = hiredate1;
	}

	public String getHiredate2() {
		return hiredate2;
	}

	public void setHiredate2(String hiredate2) {
		this.hiredate2 = hiredate2;
	}
	
	

	public String getUsedate1() {
		return usedate1;
	}

	public void setUsedate1(String usedate1) {
		this.usedate1 = usedate1;
	}

	public String getUsedate2() {
		return usedate2;
	}

	public void setUsedate2(String usedate2) {
		this.usedate2 = usedate2;
	}

	public String getPrice1() {
		return price1;
	}

	public void setPrice1(String price1) {
		this.price1 = price1;
	}

	public String getPrice2() {
		return price2;
	}

	public void setPrice2(String price2) {
		this.price2 = price2;
	}
	
	

	public String getUseplace() {
		return useplace;
	}

	public void setUseplace(String useplace) {
		this.useplace = useplace;
	}

	@Override
	public String toString() {
		return "Depart_posi_dateVO [deptCode=" + deptCode + ", posCode=" + posCode + ", hiredate1=" + hiredate1
				+ ", hiredate2=" + hiredate2 + ", usedate1=" + usedate1 + ", usedate2=" + usedate2 + ", price1="
				+ price1 + ", price2=" + price2 + ", useplace=" + useplace + "]";
	}

	
	
	
}
