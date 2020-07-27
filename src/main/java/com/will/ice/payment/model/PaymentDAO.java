package com.will.ice.payment.model;

import java.util.List;

public interface PaymentDAO {
	int insertPaydoc(PaymentVO paymentVo);
	
	List<PaymentviewVO> selectAll();
}
