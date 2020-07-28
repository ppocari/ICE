package com.will.ice.workrecord.model;

import java.util.List;

public interface WorkRecordService {
	int insertWork(WorkRecordVO vo);
	List<WorkRecordVO> selectWork(String cmtNo);
}
