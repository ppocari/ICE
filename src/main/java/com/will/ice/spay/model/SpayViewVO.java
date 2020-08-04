package com.will.ice.spay.model;

import java.sql.Timestamp;

public class SpayViewVO {
	
	private int TICNO;
	private String MEMNO;
	private int TICQUANTITY;
	private int TICPRICE;
	private Timestamp TICREGDATE;
	private String NAME;
	private String HP1;
	private String HP2;
	private String HP3;
	private String EMAIL1;
	private String EMAIL2;
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
	public String getNAME() {
		return NAME;
	}
	public void setNAME(String nAME) {
		NAME = nAME;
	}
	public String getHP1() {
		return HP1;
	}
	public void setHP1(String hP1) {
		HP1 = hP1;
	}
	public String getHP2() {
		return HP2;
	}
	public void setHP2(String hP2) {
		HP2 = hP2;
	}
	public String getHP3() {
		return HP3;
	}
	public void setHP3(String hP3) {
		HP3 = hP3;
	}
	public String getEMAIL1() {
		return EMAIL1;
	}
	public void setEMAIL1(String eMAIL1) {
		EMAIL1 = eMAIL1;
	}
	public String getEMAIL2() {
		return EMAIL2;
	}
	public void setEMAIL2(String eMAIL2) {
		EMAIL2 = eMAIL2;
	}
	
	@Override
	public String toString() {
		return "SpayViewVO [TICNO=" + TICNO + ", MEMNO=" + MEMNO + ", TICQUANTITY=" + TICQUANTITY + ", TICPRICE="
				+ TICPRICE + ", TICREGDATE=" + TICREGDATE + ", NAME=" + NAME + ", HP1=" + HP1 + ", HP2=" + HP2
				+ ", HP3=" + HP3 + ", EMAIL1=" + EMAIL1 + ", EMAIL2=" + EMAIL2 + "]";
	}
	
}
