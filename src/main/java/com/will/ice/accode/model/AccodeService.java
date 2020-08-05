package com.will.ice.accode.model;

import java.util.List;

import com.will.ice.common.SearchVO;

public interface AccodeService {
	List<AccodeVO> selectListAccode(SearchVO searchVO);
	public int selectTotalRecord(SearchVO searchVo);
	
	int accRegisterMulti(List<AccodeVO> accList);
}
