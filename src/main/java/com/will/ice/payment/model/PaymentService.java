package com.will.ice.payment.model;

import java.util.List;

import com.will.ice.document.model.DocumentviewVO;

public interface PaymentService {
	List<PaymentviewVO> selectAll();
	int insertPaymentM(String[] memList, PaylinedocVO pldVo);
	PaymentviewVO selectDocument(int docNo);
	List<DocumentviewVO> selectPayLine(int docNo);
}
