package com.will.ice.payment.model;

import java.util.List;

import com.will.ice.document.model.DocumentviewVO;

public interface PaymentDAO {
	int insertPaydoc(PaylinedocVO pldVo);
	List<PaymentviewVO> selectAll();
	int insertPayline(PaylinedocVO pldVo);
	PaymentviewVO selectDocument(int docNo);
	List<DocumentviewVO> selectPayLine(int docNo);
}
