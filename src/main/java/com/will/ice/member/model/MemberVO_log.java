package com.will.ice.member.model;

import java.sql.Timestamp;

public class MemberVO_log {
	private String name;
	private String memNo;
	private String pwd;
	private Timestamp fireDate;
	private String posCode;
	private String posName;
	private String deptCode;
	private String deptName;
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getMemNo() {
		return memNo;
	}
	public void setMemNo(String memNo) {
		this.memNo = memNo;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public Timestamp getFireDate() {
		return fireDate;
	}
	public void setFireDate(Timestamp fireDate) {
		this.fireDate = fireDate;
	}
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
		return "MemberVO_log [name=" + name + ", memNo=" + memNo + ", pwd=" + pwd + ", fireDate=" + fireDate
				+ ", posCode=" + posCode + ", posName=" + posName + ", deptCode=" + deptCode + ", deptName=" + deptName
				+ "]";
	}
	
}
