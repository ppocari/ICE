package com.will.ice.companyCard.model;

import java.sql.Timestamp;

public class ComcardVO {
	private String cardNo;
	private String MEMNO;
	private String accCode;
	private int price;
	private String usePlace;
	private Timestamp useDate;
	public String getCardNo() {
		return cardNo;
	}
	public void setCardNo(String cardNo) {
		this.cardNo = cardNo;
	}
	public String getMEMNO() {
		return MEMNO;
	}
	public void setMEMNO(String mEMNO) {
		MEMNO = mEMNO;
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
	public Timestamp getUseDate() {
		return useDate;
	}
	public void setUseDate(Timestamp useDate) {
		this.useDate = useDate;
	}
	@Override
	public String toString() {
		return "ComcardVO [cardNo=" + cardNo + ", MEMNO=" + MEMNO + ", accCode=" + accCode + ", price=" + price
				+ ", usePlace=" + usePlace + ", useDate=" + useDate + "]";
	}
	
	
	
}
