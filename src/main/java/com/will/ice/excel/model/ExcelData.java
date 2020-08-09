package com.will.ice.excel.model;


public class ExcelData {

	private String company;
	private String cardNo;
	private String memNo;
	private int price;
	private String usePlace;
	private String useDate;
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
	@Override
	public String toString() {
		return "ExcelData [company=" + company + ", cardNo=" + cardNo + ", memNo=" + memNo + ", price=" + price
				+ ", usePlace=" + usePlace + ", useDate=" + useDate + "]";
	}
	
	
	


}
