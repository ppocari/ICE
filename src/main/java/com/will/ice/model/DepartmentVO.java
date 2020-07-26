package com.will.ice.model;

public class DepartmentVO {
	private String deptCode;
	private String deptName;
	public String getDeptCode() {
		return deptCode;
	}
	public void setDeptCode(String deptCode) {
		this.deptCode = deptCode;
	}
	public String getDeptName() {
		return deptName;
	}
	public void setDeptName(String deptName) {
		this.deptName = deptName;
	}
	@Override
	public String toString() {
		return "DepartmentVO [deptCode=" + deptCode + ", deptName=" + deptName + "]";
	}
	
	
	
}
