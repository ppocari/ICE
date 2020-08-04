package com.will.ice.accode.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.will.ice.common.Depart_posi_dateVO;
import com.will.ice.common.SearchVO;

@Service
public class AccodeServiceImpl implements AccodeService{
	@Autowired private AccodeDAO accodeDao;
	
	@Override
	public List<AccodeVO> selectListAccode(SearchVO searchVO) {
		return accodeDao.selectListAccode(searchVO);
	}

}
