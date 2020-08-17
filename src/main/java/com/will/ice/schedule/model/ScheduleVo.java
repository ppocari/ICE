package com.will.ice.schedule.model;

public class ScheduleVo {
	private int schNo;
	private String title;
	private String content;
	private String startDay;
	private String endDay;
	private String memNo;
	private String place;
	private String resourceId;
	
	public int getSchNo() {
		return schNo;
	}
	public void setSchNo(int schNo) {
		this.schNo = schNo;
	}
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
	public String getPlace() {
		return place;
	}
	public void setPlace(String place) {
		this.place = place;
	}
	public String getResourceId() {
		return resourceId;
	}
	public void setResourceId(String resourceId) {
		this.resourceId = resourceId;
	}
	
	@Override
	public String toString() {
		return "ScheduleVo [schNo=" + schNo + ", title=" + title + ", content=" + content + ", startDay=" + startDay
				+ ", endDay=" + endDay + ", memNo=" + memNo + ", place=" + place + ", resourceId=" + resourceId + "]";
	}

	
	
}
