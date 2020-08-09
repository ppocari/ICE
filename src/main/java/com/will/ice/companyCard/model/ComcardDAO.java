package com.will.ice.companyCard.model;

import java.util.List;

import com.will.ice.common.DateSearchVO;
import com.will.ice.common.Depart_posi_dateVO;
import com.will.ice.paymentfile.model.PaymentfileVO;

public interface ComcardDAO {
	
	List<ComcardVO> selectUnUseComcard(DateSearchVO search_dsvo);
	List<ComcardVO> selectListComcard(Depart_posi_dateVO dpdvo);
	
	
	ComcardVO selectNoComcard(int comcard_no);
	
	int insertCCMulti(ComcardVO ccvo);

	int insertCCFile(ComCardFileVO CCfileVO);
	
}	
