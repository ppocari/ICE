package com.will.ice.spay.model;

import java.util.List;
import java.util.Map;

import com.will.ice.common.DateSearchVO;

public interface SpayService {

	public int insertTic(SpayVO vo);
	List<Map<String, Object>> selectSpayView(int MEMNO);
	int selectDay(DateSearchVO dateSearchVo);
	SpayVO searchAll(int ticno);
	int searchNum(int MEMNO);
}
