package com.will.ice.spay.model;

import java.sql.Timestamp;

public class SpayVO {

	private String memNo; 
	private int sjang;
	private int sprice;
	private String shp;
	private Timestamp sdate;
	
	public String getMemNo() {
		return memNo;
	}
	public void setMemNo(String memNo) {
		this.memNo = memNo;
	}
	public int getSjang() {
		return sjang;
	}
	public void setSjang(int sjang) {
		this.sjang = sjang;
	}
	public int getSprice() {
		return sprice;
	}
	public void setSprice(int sprice) {
		this.sprice = sprice;
	}
	public String getShp() {
		return shp;
	}
	public void setShp(String shp) {
		this.shp = shp;
	}
	public Timestamp getSdate() {
		return sdate;
	}
	public void setSdate(Timestamp sdate) {
		this.sdate = sdate;
	}
	
	@Override
	public String toString() {
		return "SpayVO [memNo=" + memNo + ", sjang=" + sjang + ", sprice=" + sprice + ", shp=" + shp + ", sdate="
				+ sdate + "]";
	} 
	
}
