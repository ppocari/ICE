package com.will.ice.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class EtcServiceImpl implements EtcService{
	@Autowired
	private EtcDAO etcDao;
	
	@Override
	public List<DepartmentVO> DeptAll() {
		return etcDao.DeptAll();
	}

	@Override
	public List<PositionVO> PosAll() {
		return etcDao.PosAll();
	}

	
}
