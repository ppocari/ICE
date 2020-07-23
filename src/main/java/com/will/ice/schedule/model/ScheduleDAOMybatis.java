package com.will.ice.schedule.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ScheduleDAOMybatis implements ScheduleDAO{
	@Autowired SqlSessionTemplate sqlseeion;
	private String namespace = "com.mybatis.mapper.oracle.schedule.";
	
	@Override
	public int insertSchedule(ScheduleVo scheduleVo) {
		return sqlseeion.insert(namespace+"insertSchedule",scheduleVo);
	}

	@Override
	public List<ScheduleVo> selectSchedule(String memNo) {
		return sqlseeion.selectList(namespace+"selectSchedule",memNo);
	}
	
	
	
}
