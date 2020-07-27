package com.will.ice.payment.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class PaymentServiceImpl implements PaymentService{

	@Autowired
	private PaymentDAO paymentDao;

	@Override
	public int insertPaydoc(PaymentVO paymentVo) {
		paymentVo.setProgress("결재진행중");
		
		return paymentDao.insertPaydoc(paymentVo);
	}

	@Override
	public List<PaymentviewVO> selectAll() {
		return paymentDao.selectAll();
	}
	
}
