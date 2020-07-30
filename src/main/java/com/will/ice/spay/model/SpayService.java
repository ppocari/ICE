package com.will.ice.spay.model;

import java.util.List;
import java.util.Map;

public interface SpayService {

	public int insertTic(SpayVO vo);
	List<Map<String, Object>> selectSpayView(int MEMNO);
	List<SpayVO> selectAll();
}
