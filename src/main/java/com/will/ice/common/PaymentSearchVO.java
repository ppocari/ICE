package com.will.ice.common;

public class PaymentSearchVO {
	private String startDay;  //시작일
	private String endDay; //종료일
	private String identNum; //고객 아이디
	private String searchCondition = "";//문서종류
	private String searchKeyword = "";//키워드
	private String searchUseYn = "";//검색사용여부
	public String getStartDay() {
		return startDay;
	}
	public void setStartDay(String startDay) {
		this.startDay = startDay;
	}
	public String getEndDay() {
		return endDay;
	}
	public void setEndDay(String endDay) {
		this.endDay = endDay;
	}
	public String getIdentNum() {
		return identNum;
	}
	public void setIdentNum(String identNum) {
		this.identNum = identNum;
	}
	public String getSearchCondition() {
		return searchCondition;
	}
	public void setSearchCondition(String searchCondition) {
		this.searchCondition = searchCondition;
	}
	public String getSearchKeyword() {
		return searchKeyword;
	}
	public void setSearchKeyword(String searchKeyword) {
		this.searchKeyword = searchKeyword;
	}
	public String getSearchUseYn() {
		return searchUseYn;
	}
	public void setSearchUseYn(String searchUseYn) {
		this.searchUseYn = searchUseYn;
	}
	@Override
	public String toString() {
		return "PaymentSearchVO [startDay=" + startDay + ", endDay=" + endDay + ", identNum=" + identNum
				+ ", searchCondition=" + searchCondition + ", searchKeyword=" + searchKeyword + ", searchUseYn="
				+ searchUseYn + "]";
	}
	
	
}
