package com.will.ice.schedule.model;


public interface ScheduleDAO {
	
	public int insertSchedule(ScheduleVo scheduleVo);
	public ScheduleVo selectSchedule();
}
