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

	@Override
	public ScheduleVo selectDetail(ScheduleVo vo) {
		return Scheduledao.selectDetail(vo);
	}

	@Override
	public ScheduleVo selectRownum(String memNo) {
		return Scheduledao.selectRownum(memNo);
	}

	@Override
	public int deleteSchedule(String schNo) {
		return Scheduledao.deleteSchedule(schNo);
	}

	@Override
	public int updateSchedule(ScheduleVo vo) {
		return Scheduledao.updateSchedule(vo);
	}
	
}
