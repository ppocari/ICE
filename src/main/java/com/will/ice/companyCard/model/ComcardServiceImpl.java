package com.will.ice.companyCard.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
public class ComcardServiceImpl implements ComcardService{
	@Autowired private ComcardDAO comcardDAO;
	
	@Override
	public List<ComcardVO> selectAllComcard() {
		return comcardDAO.selectAllComcard();
	}

	
	
	
}
