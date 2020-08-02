package com.will.ice.companyCard.model;

import java.util.List;

import com.will.ice.model.SearchYearMonthVO;

public interface ComcardService {

	List<ComcardVO> selectUnUseComcard(SearchYearMonthVO ymvo);
	
	
	ComcardVO selectNoComcard(int comcard_no);
}
