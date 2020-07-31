package com.will.ice.payment.model;

import java.util.List;

import com.will.ice.document.model.DocumentviewVO;
import com.will.ice.member.model.MemberVO;

public interface PaymentService {
	List<PaylistViewVO> selectSent(String identNum);
	List<PaymentviewVO> selectImsy(String identNum);
	int insertPaymentM(String[] memList, PaylinedocVO pldVo);
	PaymentviewVO selectDocument(int docNo);
	List<DocumentviewVO> selectPayLine(int docNo);
	int deletePayLine(int docNo);
	List<MemberVO> selectAllMem(int poscode);
	int insertOnePay(PaylinedocVO pldVo);
}
