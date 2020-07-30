package com.will.ice.workrecord.model;

import java.util.List;

public interface WorkRecordService {
	int insertWork_status(WorkRecordVO vo);
	List<WorkRecordVO> selectWorkList(int memNo);
	int updateWork(WorkRecordVO vo);
}
