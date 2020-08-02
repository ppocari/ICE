package com.will.ice.workrecord.model;

import java.util.List;

public interface WorkRecordDAO {
	int insertWork(WorkRecordVO vo);
	List<WorkRecordVO> selectWorkList(WorkRecordVO vo);
	int updateWork(WorkRecordVO vo);
	WorkRecordVO selectToday(String memNo);
}
