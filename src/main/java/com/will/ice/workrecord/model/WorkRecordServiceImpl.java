package com.will.ice.workrecord.model;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class WorkRecordServiceImpl implements WorkRecordService{
	@Autowired WorkRecordService workService;

	@Override
	public int insertWork(WorkRecordVO vo) {
		return workService.insertWork(vo);
	}

	@Override
	public List<WorkRecordVO> selectWork(String cmtNo) {
		return workService.selectWork(cmtNo);
		
		
		 
	}
	
	
}
