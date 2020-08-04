package com.will.ice.spay.model;

import java.util.List;
import java.util.Map;

import com.will.ice.common.DateSearchVO;
import com.will.ice.payment.model.PaymentviewVO;

public interface SpayDAO {

	public int insertTic(SpayVO vo);
	List<SpayViewVO> selectSpayView(DateSearchVO dateSearchVo);
	int selectTotalRecord(DateSearchVO dateSearchVo);
	int searchNum(int MEMNO);
	SpayVO searchAll(int ticno);
}
