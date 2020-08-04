package com.will.ice.payment.model;

import java.util.List;

import com.will.ice.common.PaymentSearchVO;
import com.will.ice.document.model.DocumentviewVO;
import com.will.ice.member.model.MemberVO;
import com.will.ice.paymentfile.model.PaymentfileVO;

public interface PaymentService {
	List<PaylistViewVO> selectSent(PaymentSearchVO paysearchVo);
	List<PaymentviewVO> selectImsy(PaymentSearchVO paysearchVo);
	int insertPaymentM(String[] memList, PaylinedocVO pldVo, PaymentfileVO fileVo);
	PaymentviewVO selectDocument(int docNo);
	List<DocumentviewVO> selectPayLine(int docNo);
	int deletePayLine(int docNo);
	List<MemberVO> selectAllMem(int poscode);
	int insertImsyPay(PaylinedocVO pldVo,PaymentfileVO fileVo);
	int updatePaydocM(String[] memList, PaylinedocVO pldVo, PaymentfileVO fileVo,String oldfileName);
	PaymentfileVO getFile(int docNo);
	int updatePaydoc(PaylinedocVO pldVo,PaymentfileVO fileVo,String oldfileName);
}
