package com.will.ice.companyCard.model;


public class ComcardVO {
	private int NO;
	private String CARDNO;
	private String MEMNO;
	private String ACCCODE;
	private int PRICE;
	private String USEPLACE;
	private String USEDATE;
	private String FILENO;
	private String NAME;
	private String DEPTNAME;
	private String POSNAME;
	public int getNO() {
		return NO;
	}
	public void setNO(int nO) {
		NO = nO;
	}
	public String getCARDNO() {
		return CARDNO;
	}
	public void setCARDNO(String cARDNO) {
		CARDNO = cARDNO;
	}
	public String getMEMNO() {
		return MEMNO;
	}
	public void setMEMNO(String mEMNO) {
		MEMNO = mEMNO;
	}
	public String getACCCODE() {
		return ACCCODE;
	}
	public void setACCCODE(String aCCCODE) {
		ACCCODE = aCCCODE;
	}
	public int getPRICE() {
		return PRICE;
	}
	public void setPRICE(int pRICE) {
		PRICE = pRICE;
	}
	public String getUSEPLACE() {
		return USEPLACE;
	}
	public void setUSEPLACE(String uSEPLACE) {
		USEPLACE = uSEPLACE;
	}
	public String getUSEDATE() {
		return USEDATE;
	}
	public void setUSEDATE(String uSEDATE) {
		USEDATE = uSEDATE;
	}
	public String getFILENO() {
		return FILENO;
	}
	public void setFILENO(String fILENO) {
		FILENO = fILENO;
	}
	public String getNAME() {
		return NAME;
	}
	public void setNAME(String nAME) {
		NAME = nAME;
	}
	public String getPOSNAME() {
		return POSNAME;
	}
	public void setPOSNAME(String pOSNAME) {
		POSNAME = pOSNAME;
	}
	
	
	public String getDEPTNAME() {
		return DEPTNAME;
	}
	public void setDEPTNAME(String dEPTNAME) {
		DEPTNAME = dEPTNAME;
	}
	@Override
	public String toString() {
		return "ComcardVO [NO=" + NO + ", CARDNO=" + CARDNO + ", MEMNO=" + MEMNO + ", ACCCODE=" + ACCCODE + ", PRICE="
				+ PRICE + ", USEPLACE=" + USEPLACE + ", USEDATE=" + USEDATE + ", FILENO=" + FILENO + ", NAME=" + NAME
				+ ", DEPTNAME=" + DEPTNAME + ", POSNAME=" + POSNAME + "]";
	}
	
	
	
}
