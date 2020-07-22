package com.will.ice.member.model;

import java.sql.Timestamp;

public class MemberVO_log {
	private String name;
	private String memNo;
	private String pwd;
	private Timestamp fireDate;
	private String posName;
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
	public Timestamp getFireDate() {
		return fireDate;
	}
	public void setFireDate(Timestamp fireDate) {
		this.fireDate = fireDate;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getPosName() {
		return posName;
	}
	public void setPosName(String posName) {
		this.posName = posName;
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
				+ ", posName=" + posName + ", deptName=" + deptName + "]";
	}
	
	
	
}
