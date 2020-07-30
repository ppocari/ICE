package com.will.ice.spay.model;

import java.util.Map;

public interface SpayService {

	public int insertTic(SpayVO vo);
	Map<String, Object> selectSpayView(int MEMNO);
}
