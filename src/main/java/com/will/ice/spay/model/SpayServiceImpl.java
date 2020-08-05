package com.will.ice.spay.model;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.will.ice.common.DateSearchVO;

@Service
public class SpayServiceImpl implements SpayService{

	@Autowired SpayDAO spayDao;
	
	@Override
	public int insertTic(SpayVO vo) {
		return spayDao.insertTic(vo);
	}

	@Override
	public List<SpayViewVO> selectSpayView(DateSearchVO dateSearchVo) {
		return spayDao.selectSpayView(dateSearchVo);
	}

	@Override
	public int selectTotalRecord(DateSearchVO dateSearchVo) {
		return spayDao.selectTotalRecord(dateSearchVo);
	}

	@Override
	public SpayVO searchAll(int ticno) {
		return spayDao.searchAll(ticno);
	}

	@Override
	public int searchNum(int MEMNO) {
		return spayDao.searchNum(MEMNO);
	}

	@Override
	public List<SpayViewVO> selectSpayViewAll(DateSearchVO dateSearchVo) {
		return spayDao.selectSpayViewAll(dateSearchVo);
	}

	@Override
	public int selectTotalRecordAll(DateSearchVO dateSearchVo) {
		return spayDao.selectTotalRecordAll(dateSearchVo);
	}

	

}
