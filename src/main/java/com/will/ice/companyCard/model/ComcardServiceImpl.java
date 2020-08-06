package com.will.ice.companyCard.model;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.will.ice.common.DateSearchVO;
import com.will.ice.common.Depart_posi_dateVO;


@Service
public class ComcardServiceImpl implements ComcardService{
	@Autowired private ComcardDAO comcardDAO;
	
	@Override
	public List<ComcardVO> selectUnUseComcard(DateSearchVO search_dsvo) {
		return comcardDAO.selectUnUseComcard(search_dsvo);
	}

	@Override
	public ComcardVO selectNoComcard(int comcard_no) {
		return comcardDAO.selectNoComcard(comcard_no);
	}
	
	@Override
	public List<ComcardVO> selectListComcard(Depart_posi_dateVO dpdvo) {
		return comcardDAO.selectListComcard(dpdvo);
	}

	

	
}