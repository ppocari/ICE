package com.will.ice.schedule.model;

import java.util.List;

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
	public List<ScheduleVo> selectSchedule(String memNo) {
		return Scheduledao.selectSchedule(memNo);
	}
	
}
