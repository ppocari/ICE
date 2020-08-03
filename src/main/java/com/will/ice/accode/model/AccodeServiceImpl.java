package com.will.ice.accode.model;

import java.util.List;

import org.springframework.stereotype.Service;

@Service
public class AccodeServiceImpl implements AccodeService{
	private AccodeDAO accodeDAO;
	
	@Override
	public List<AccodeVO> selectAccode(String useplace) {
		return accodeDAO.selectAccode(useplace);
	}

}
