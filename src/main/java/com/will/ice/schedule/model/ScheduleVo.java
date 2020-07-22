package com.will.ice.schedule.model;

public class ScheduleVo {
	private String title;
	private String content;
	private String scheduleStart;
	private String scheduleEnd;
	private String empNo;
	private int scheduleNo;
	
	
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
	public String getEmpNo() {
		return empNo;
	}
	public void setEmpNo(String empNo) {
		this.empNo = empNo;
	}
	public int getScheduleNo() {
		return scheduleNo;
	}
	public void setScheduleNo(int scheduleNo) {
		this.scheduleNo = scheduleNo;
	}
	
	
	@Override
	public String toString() {
		return "ScheduleVo [title=" + title + ", content=" + content + ", scheduleStart=" + scheduleStart
				+ ", scheduleEnd=" + scheduleEnd + ", empNo=" + empNo + ", scheduleNo=" + scheduleNo + "]";
	}
	
	
	
	
}
