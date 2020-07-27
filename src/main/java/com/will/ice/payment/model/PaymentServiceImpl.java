package com.will.ice.payment.model;

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
	
}
