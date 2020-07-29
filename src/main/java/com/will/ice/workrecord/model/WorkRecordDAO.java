package com.will.ice.workrecord.model;

import java.util.List;

public interface WorkRecordDAO {
	int insertWork(WorkRecordVO vo);
	List<WorkRecordVO> selectWorkList(int memNo);
	int updateWork(WorkRecordVO vo);
}
