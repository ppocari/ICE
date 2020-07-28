package com.will.ice.schedule.model;

import java.util.List;

public interface ScheduleDAO {
	
	public int insertSchedule(ScheduleVo scheduleVo);
	public List<ScheduleVo> selectSchedule(String memNo);
}
