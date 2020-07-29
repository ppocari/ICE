package com.will.ice.schedule.model;

public class ScheduleVo {
	private String title;
	private String content;
	private String startDay;
	private String endDay;
	private String memNo;
	private int schNo;
	private String place;
	
	
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
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
	public String getMemNo() {
		return memNo;
	}
	public void setMemNo(String memNo) {
		this.memNo = memNo;
	}
	public int getSchNo() {
		return schNo;
	}
	public void setSchNo(int schNo) {
		this.schNo = schNo;
	}
	public String getPlace() {
		return place;
	}
	public void setPlace(String place) {
		this.place = place;
	}
	
	
	@Override
	public String toString() {
		return "ScheduleVo [title=" + title + ", content=" + content + ", startDay=" + startDay + ", endDay=" + endDay
				+ ", memNo=" + memNo + ", schNo=" + schNo + ", place=" + place + "]";
	}
	
	
	
}
