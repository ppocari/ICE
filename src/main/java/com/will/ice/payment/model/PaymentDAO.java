package com.will.ice.payment.model;

import java.util.List;

import com.will.ice.document.model.DocumentviewVO;
import com.will.ice.member.model.MemberVO;
import com.will.ice.payline.model.PaylineVO;

public interface PaymentDAO {
	int insertPaydoc(PaylinedocVO pldVo);
	int insertOnePay(PaylinedocVO pldVo);
	List<PaylistViewVO> selectSent(String identNum);
	List<PaymentviewVO> selectImsy(String identNum);
	int insertPayline(PaylinedocVO pldVo);
	PaymentviewVO selectDocument(int docNo);
	List<DocumentviewVO> selectPayLine(int docNo);
	int deletePayLine(int docNo);
	List<MemberVO> selectAllMem(int poscode);
	List<PaylineVO> isRead(int docNo);
	int updateImsy(int docNo);
}
