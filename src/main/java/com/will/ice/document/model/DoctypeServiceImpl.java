package com.will.ice.document.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class DoctypeServiceImpl implements DoctypeService{
	@Autowired 
	private DoctypeDAO doctypeDao;

	@Override
	public List<DoctypeVO> selectAll() {
		return doctypeDao.selectAll();
	}

	@Override
	public String choosenType(int typeNo) {
		return doctypeDao.choosenType(typeNo);
	}
	
}
