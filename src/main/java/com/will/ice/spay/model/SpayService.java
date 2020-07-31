package com.will.ice.spay.model;

import java.util.List;
import java.util.Map;

import com.will.ice.common.DateSearchVO;

public interface SpayService {

	public int insertTic(SpayVO vo);
	List<Map<String, Object>> selectSpayView(int MEMNO);
	List<SpayVO> selectAll();
	int selectDay(DateSearchVO dateSearchVo);
}
