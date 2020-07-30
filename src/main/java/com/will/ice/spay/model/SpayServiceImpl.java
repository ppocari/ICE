package com.will.ice.spay.model;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class SpayServiceImpl implements SpayService{

	@Autowired SpayDAO spayDao;
	
	@Override
	public int insertTic(SpayVO vo) {
		return spayDao.insertTic(vo);
	}

	@Override
	public List<Map<String, Object>> selectSpayView(int MEMNO) {
		return spayDao.selectSpayView(MEMNO);
	}

	@Override
	public List<SpayVO> selectAll() {
		return spayDao.selectAll();
	}
	

}
