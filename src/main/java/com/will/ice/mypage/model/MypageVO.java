package com.will.ice.mypage.model;

import java.util.Date;

public class MypageVO {
	private int empno;
	private String name;
	private String pwd;
	private String hp1;
	private String hp2;
	private String hp3;
	private String email1;
	private String email2;
	private String zipcode;
	private String addr;
	private String addrDetail;
	private int salary;
	private Date hireDate;
	private String gender;
	private String proFileURL;
	private String originalFileName;
	private long fileSize;
	private int deptNo;
	private int pcode;
	
	public int getEmpno() {
		return empno;
	}
	public void setEmpno(int empno) {
		this.empno = empno;
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
	public Date getHireDate() {
		return hireDate;
	}
	public void setHireDate(Date hireDate) {
		this.hireDate = hireDate;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getProFileURL() {
		return proFileURL;
	}
	public void setProFileURL(String proFileURL) {
		this.proFileURL = proFileURL;
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
	public int getDeptNo() {
		return deptNo;
	}
	public void setDeptNo(int deptNo) {
		this.deptNo = deptNo;
	}
	public int getPcode() {
		return pcode;
	}
	public void setPcode(int pcode) {
		this.pcode = pcode;
	}
	
	
	@Override
	public String toString() {
		return "MypageVO [empno=" + empno + ", name=" + name + ", pwd=" + pwd + ", hp1=" + hp1 + ", hp2=" + hp2
				+ ", hp3=" + hp3 + ", email1=" + email1 + ", email2=" + email2 + ", zipcode=" + zipcode + ", addr="
				+ addr + ", addrDetail=" + addrDetail + ", salary=" + salary + ", hireDate=" + hireDate + ", gender="
				+ gender + ", proFileURL=" + proFileURL + ", originalFileName=" + originalFileName + ", fileSize="
				+ fileSize + ", deptNo=" + deptNo + ", pcode=" + pcode + "]";
	}
	
	
	
}
