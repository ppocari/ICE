package com.will.ice.companyCard.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.will.ice.model.SearchYearMonthVO;


@Service
public class ComcardServiceImpl implements ComcardService{
	@Autowired private ComcardDAO comcardDAO;
	
	@Override
	public List<ComcardVO> selectUnUseComcard(SearchYearMonthVO ymvo) {
		return comcardDAO.selectUnUseComcard(ymvo);
	}

	@Override
	public ComcardVO selectNoComcard(int comcard_no) {
		return comcardDAO.selectNoComcard(comcard_no);
	}

	
	
	
}
