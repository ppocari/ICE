package com.will.ice.workrecord.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class WorkRecordServiceImpl implements WorkRecordService{
	@Autowired WorkRecordDAO workdao;

	@Override
	public int insertWork_status(WorkRecordVO vo) {
		return workdao.insertWork(vo);
	}

	@Override
	public int updateWork(WorkRecordVO vo) {
		return workdao.updateWork(vo);
	}

	@Override
	public List<WorkRecordVO> selectWorkList(WorkRecordVO vo) {
		return workdao.selectWorkList(vo);
	}

	@Override
	public WorkRecordVO selectToday(String memNo) {
		return workdao.selectToday(memNo);
	}


	@Override
	public int selectMonthCount(WorkRecordVO vo) {
		return workdao.selectMonthCount(vo);
	}
	
	
	
	
}
