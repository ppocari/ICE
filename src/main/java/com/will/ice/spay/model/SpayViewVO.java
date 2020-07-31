package com.will.ice.spay.model;

import java.sql.Timestamp;

public class SpayViewVO {

	private int TICNO;
	private String MEMNO; 
	private int TICQUANTITY;
	private int TICPRICE;
	private Timestamp TICREGDATE;
	private String name;
	private int hp1;
	private int hp2;
	private int hp3;
	private String email1;
	private String email2;
	
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
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getHp1() {
		return hp1;
	}
	public void setHp1(int hp1) {
		this.hp1 = hp1;
	}
	public int getHp2() {
		return hp2;
	}
	public void setHp2(int hp2) {
		this.hp2 = hp2;
	}
	public int getHp3() {
		return hp3;
	}
	public void setHp3(int hp3) {
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
	
	@Override
	public String toString() {
		return "SpayViewVO [TICNO=" + TICNO + ", MEMNO=" + MEMNO + ", TICQUANTITY=" + TICQUANTITY + ", TICPRICE="
				+ TICPRICE + ", TICREGDATE=" + TICREGDATE + ", name=" + name + ", hp1=" + hp1 + ", hp2=" + hp2
				+ ", hp3=" + hp3 + ", email1=" + email1 + ", email2=" + email2 + "]";
	}

}
