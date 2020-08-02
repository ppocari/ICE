package com.will.ice.model;

public class SearchYearMonthVO {
	private String begin_ym;
	private String end_ym;
	
	public SearchYearMonthVO(String begin_ym, String end_ym) {
		super();
		this.begin_ym = begin_ym;
		this.end_ym = end_ym;
	}
	public String getBegin_ym() {
		return begin_ym;
	}
	public void setBegin_ym(String begin_ym) {
		this.begin_ym = begin_ym;
	}
	public String getEnd_ym() {
		return end_ym;
	}
	public void setEnd_ym(String end_ym) {
		this.end_ym = end_ym;
	}
	@Override
	public String toString() {
		return "SearchYearMonthVO [begin_ym=" + begin_ym + ", end_ym=" + end_ym + "]";
	}

	
	
}
