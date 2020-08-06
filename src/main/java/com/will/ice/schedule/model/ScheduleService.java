package com.will.ice.schedule.model;

import java.util.List;

public interface ScheduleService {
	int insertSchedule(ScheduleVo scheduleVo);
	List<ScheduleVo> selectSchedule(String memNo);
	ScheduleVo selectDetail(ScheduleVo vo);
	ScheduleVo selectRownum(String memNo);
}
