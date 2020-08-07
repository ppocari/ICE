package com.will.ice.companyCard.model;

import java.io.File;
import java.util.List;

import com.will.ice.common.DateSearchVO;
import com.will.ice.common.Depart_posi_dateVO;

public interface ComcardService {

	List<ComcardVO> selectUnUseComcard(DateSearchVO search_dsvo);
	List<ComcardVO> selectListComcard(Depart_posi_dateVO dpdvo);
	
	
	
	ComcardVO selectNoComcard(int comcard_no);
	
	
	
	
}
