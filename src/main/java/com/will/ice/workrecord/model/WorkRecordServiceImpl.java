package com.will.ice.workrecord.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class WorkRecordServiceImpl implements WorkRecordService{
	@Autowired WorkRecordDAO workdao;

	@Override
	public int insertWork_status(WorkRecordVO vo) {
		/*
		int cnt = 0;
		if(vo.getMemNo() != null && vo.getMemNo().isEmpty()) {
			vo.setCmpStatus("출근");
			cnt = workdao.insertWork(vo);
		}else {
			vo.setCmpStatus("결근");
		}
		*/
		return workdao.insertWork(vo);
	}

	@Override
	public int updateWork(WorkRecordVO vo) {
		return workdao.updateWork(vo);
	}

	@Override
	public List<WorkRecordVO> selectWorkList(int memNo) {
		return workdao.selectWorkList(memNo);
	}
	
	
	
	
}
