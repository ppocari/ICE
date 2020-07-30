package com.will.ice.spay.model;

import java.util.Map;

public interface SpayDAO {

	public int insertTic(SpayVO vo);
	Map<String, Object> selectSpayView(int MEMNO);
}
