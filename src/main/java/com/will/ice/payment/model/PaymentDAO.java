package com.will.ice.payment.model;

import java.sql.Timestamp;

public interface PaymentDAO {
	int insertPaydoc(PaymentVO paymentVo);
	Timestamp calcKeeping(int keep);
}
