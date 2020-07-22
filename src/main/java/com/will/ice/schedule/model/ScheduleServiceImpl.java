package com.will.ice.schedule.model;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ScheduleServiceImpl implements ScheduleService{
	@Autowired ScheduleDAO Scheduledao;

	@Override
	public int insertSchedule(ScheduleVo scheduleVo) {
		return Scheduledao.insertSchedule(scheduleVo);
	}

	@Override
	public ScheduleVo selectSchedule() {
		return Scheduledao.selectSchedule();
	}
	
}
