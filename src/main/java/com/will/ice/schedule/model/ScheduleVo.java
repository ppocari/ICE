package com.will.ice.schedule.model;

public class ScheduleVo {
	private String title;
	private String content;
	private String scheduleStart;
	private String scheduleEnd;
	private String memNo;
	private int scheduleNo;
	private String type;
	
	
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
	public String getScheduleStart() {
		return scheduleStart;
	}
	public void setScheduleStart(String scheduleStart) {
		this.scheduleStart = scheduleStart;
	}
	public String getScheduleEnd() {
		return scheduleEnd;
	}
	public void setScheduleEnd(String scheduleEnd) {
		this.scheduleEnd = scheduleEnd;
	}
	public String getMemNo() {
		return memNo;
	}
	public void setMemNo(String memNo) {
		this.memNo = memNo;
	}
	public int getScheduleNo() {
		return scheduleNo;
	}
	public void setScheduleNo(int scheduleNo) {
		this.scheduleNo = scheduleNo;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	
	@Override
	public String toString() {
		return "ScheduleVo [title=" + title + ", content=" + content + ", scheduleStart=" + scheduleStart
				+ ", scheduleEnd=" + scheduleEnd + ", memNo=" + memNo + ", scheduleNo=" + scheduleNo + ", type=" + type
				+ "]";
	}
	
	
	
}
