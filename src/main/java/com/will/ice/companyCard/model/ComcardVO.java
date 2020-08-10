package com.will.ice.companyCard.model;


public class ComcardVO {
	private int no;
	private String company;
	private String cardNo;
	private String memNo;
	private String accCode;
	private int price;
	private String usePlace;
	private String useDate;
	private String name;
	private String confirmDate;
	private String confirmTime;
	private String confirmCode;
	private String payType;
	private int fileNo;
	

	private String posCode;
	private String posName;
	private String deptCode;
	private String deptName;
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	
	public String getCompany() {
		return company;
	}
	public void setCompany(String company) {
		this.company = company;
	}
	public String getCardNo() {
		return cardNo;
	}
	public void setCardNo(String cardNo) {
		this.cardNo = cardNo;
	}
	public String getMemNo() {
		return memNo;
	}
	public void setMemNo(String memNo) {
		this.memNo = memNo;
	}
	public String getAccCode() {
		return accCode;
	}
	public void setAccCode(String accCode) {
		this.accCode = accCode;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getUsePlace() {
		return usePlace;
	}
	public void setUsePlace(String usePlace) {
		this.usePlace = usePlace;
	}
	public String getUseDate() {
		return useDate;
	}
	public void setUseDate(String useDate) {
		this.useDate = useDate;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getConfirmDate() {
		return confirmDate;
	}
	public void setConfirmDate(String confirmDate) {
		this.confirmDate = confirmDate;
	}
	public String getConfirmTime() {
		return confirmTime;
	}
	public void setConfirmTime(String confirmTime) {
		this.confirmTime = confirmTime;
	}
	public String getConfirmCode() {
		return confirmCode;
	}
	public void setConfirmCode(String confirmCode) {
		this.confirmCode = confirmCode;
	}
	public String getPayType() {
		return payType;
	}
	public void setPayType(String payType) {
		this.payType = payType;
	}
	public int getFileNo() {
		return fileNo;
	}
	public void setFileNo(int fileNo) {
		this.fileNo = fileNo;
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
		return "ComcardVO [no=" + no + ", company=" + company + ", cardNo=" + cardNo + ", memNo=" + memNo + ", accCode="
				+ accCode + ", price=" + price + ", usePlace=" + usePlace + ", useDate=" + useDate + ", name=" + name
				+ ", confirmDate=" + confirmDate + ", confirmTime=" + confirmTime + ", confirmCode=" + confirmCode
				+ ", payType=" + payType + ", fileNo=" + fileNo + ", posCode=" + posCode + ", posName=" + posName
				+ ", deptCode=" + deptCode + ", deptName=" + deptName + "]";
	}
	
}
