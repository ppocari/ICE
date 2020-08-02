package com.will.ice.acccode.model;

import java.util.List;

import org.springframework.stereotype.Service;

@Service
public class AccodeServiceImpl implements AccodeService{
	private AccodeDAO accodeDAO;
	
	@Override
	public List<AccodeVO> selectAccode() {
		return accodeDAO.selectAccode();
	}

}
