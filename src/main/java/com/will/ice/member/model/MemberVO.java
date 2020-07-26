package com.will.ice.member.model;

import java.sql.Timestamp;

public class MemberVO {
	private String memNo;
	private String  name;
	private String pwd;
	private String hp1;
	private String hp2;
	private String hp3;
	private String email1;
	private String email2;
	private String ssn1;
	private String ssn2;
	private String zipcode;
	private String addr;
	private String addrDetail;
	private int salary;
	private Timestamp hiredate;
	private Timestamp firedate;
	private String gender;
	private String profileURL;
	private String originalFileName;
	private long fileSize;
	private int deptCode;
	private int posCode;
	private String posName;
	private String deptName;
	
	public String getMemNo() {
		return memNo;
	}
	public void setMemNo(String memNo) {
		this.memNo = memNo;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getHp1() {
		return hp1;
	}
	public void setHp1(String hp1) {
		this.hp1 = hp1;
	}
	public String getHp2() {
		return hp2;
	}
	public void setHp2(String hp2) {
		this.hp2 = hp2;
	}
	public String getHp3() {
		return hp3;
	}
	public void setHp3(String hp3) {
		this.hp3 = hp3;
	}
	public String getEmail1() {
		return email1;
	}
	public void setEmail1(String email1) {
		this.email1 = email1;
	}
	public String getEmail2() {
		return email2;
	}
	public void setEmail2(String email2) {
		this.email2 = email2;
	}
	public String getSsn1() {
		return ssn1;
	}
	public void setSsn1(String ssn1) {
		this.ssn1 = ssn1;
	}
	public String getSsn2() {
		return ssn2;
	}
	public void setSsn2(String ssn2) {
		this.ssn2 = ssn2;
	}
	public String getZipcode() {
		return zipcode;
	}
	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public String getAddrDetail() {
		return addrDetail;
	}
	public void setAddrDetail(String addrDetail) {
		this.addrDetail = addrDetail;
	}
	public int getSalary() {
		return salary;
	}
	public void setSalary(int salary) {
		this.salary = salary;
	}
	public Timestamp getHiredate() {
		return hiredate;
	}
	public void setHiredate(Timestamp hiredate) {
		this.hiredate = hiredate;
	}
	public Timestamp getFiredate() {
		return firedate;
	}
	public void setFiredate(Timestamp firedate) {
		this.firedate = firedate;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getProfileURL() {
		return profileURL;
	}
	public void setProfileURL(String profileURL) {
		this.profileURL = profileURL;
	}
	public String getOriginalFileName() {
		return originalFileName;
	}
	public void setOriginalFileName(String originalFileName) {
		this.originalFileName = originalFileName;
	}
	public long getFileSize() {
		return fileSize;
	}
	public void setFileSize(long fileSize) {
		this.fileSize = fileSize;
	}
	public int getDeptCode() {
		return deptCode;
	}
	public void setDeptCode(int deptCode) {
		this.deptCode = deptCode;
	}
	public int getPosCode() {
		return posCode;
	}
	public void setPosCode(int posCode) {
		this.posCode = posCode;
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
		return "MemberVO [memNo=" + memNo + ", name=" + name + ", pwd=" + pwd + ", hp1=" + hp1 + ", hp2=" + hp2
				+ ", hp3=" + hp3 + ", email1=" + email1 + ", email2=" + email2 + ", ssn1=" + ssn1 + ", ssn2=" + ssn2
				+ ", zipcode=" + zipcode + ", addr=" + addr + ", addrDetail=" + addrDetail + ", salary=" + salary
				+ ", hiredate=" + hiredate + ", firedate=" + firedate + ", gender=" + gender + ", profileURL="
				+ profileURL + ", originalFileName=" + originalFileName + ", fileSize=" + fileSize + ", deptCode="
				+ deptCode + ", posCode=" + posCode + ", posName=" + posName + ", deptName=" + deptName + "]";
	}

	
	
	
	
}
