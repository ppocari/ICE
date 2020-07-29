package com.will.ice.spay.model;

import java.sql.Timestamp;

public class SpayVO {

	private int TICNO;
	private String MEMNO; 
	private int TICQUANTITY;
	private int TICPRICE;
	private Timestamp TICREGDATE;
	
	public int getTICNO() {
		return TICNO;
	}
	public void setTICNO(int tICNO) {
		TICNO = tICNO;
	}
	public String getMEMNO() {
		return MEMNO;
	}
	public void setMEMNO(String mEMNO) {
		MEMNO = mEMNO;
	}
	public int getTICQUANTITY() {
		return TICQUANTITY;
	}
	public void setTICQUANTITY(int tICQUANTITY) {
		TICQUANTITY = tICQUANTITY;
	}
	public int getTICPRICE() {
		return TICPRICE;
	}
	public void setTICPRICE(int tICPRICE) {
		TICPRICE = tICPRICE;
	}
	public Timestamp getTICREGDATE() {
		return TICREGDATE;
	}
	public void setTICREGDATE(Timestamp tICREGDATE) {
		TICREGDATE = tICREGDATE;
	}
	
	@Override
	public String toString() {
		return "SpayVO [TICNO=" + TICNO + ", MEMNO=" + MEMNO + ", TICQUANTITY=" + TICQUANTITY + ", TICPRICE=" + TICPRICE
				+ ", TICREGDATE=" + TICREGDATE + "]";
	}
	
}
