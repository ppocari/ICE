package com.will.ice.payment.model;

import java.util.List;

import com.will.ice.common.PaymentSearchVO;
import com.will.ice.document.model.DocumentviewVO;
import com.will.ice.member.model.MemberVO;
import com.will.ice.paycomment.model.PaycommentVO;
import com.will.ice.payline.model.PaylineVO;
import com.will.ice.paymentfile.model.PaymentfileVO;

public interface PaymentDAO {
	/* 기안함 */
	int insertPaydoc(PaylinedocVO pldVo);
	int insertOnePay(PaylinedocVO pldVo);
	List<PaylistViewVO> selectSent(PaymentSearchVO paysearchVo);
	List<PaymentviewVO> selectImsy(PaymentSearchVO paysearchVo);
	int insertPayline(PaylinedocVO pldVo);
	int updatePayline(PaylinedocVO pldVo);
	PaymentviewVO selectDocument(int docNo);
	List<DocumentviewVO> selectPayLine(int docNo);
	int deletePayLine(int docNo);
	int reallydeletePayLine(int docNo);
	List<MemberVO> selectAllMem(int poscode);
	List<PaylineVO> isRead(int docNo);
	int updateImsy(int docNo);
	int updatePaydoc(PaylinedocVO pldVo);
	int saveFile(PaymentfileVO fileVo);
	int isFile(PaylinedocVO pldVo);
	PaymentfileVO getFile(int docNo);
	int updateFile(PaymentfileVO fileVo);
	
	/* 결재함 */
	PaylistViewVO selectUndecided(PaymentSearchVO paysearchVo);
	int insertComment(PaycommentVO comVo);
	int updatePaydate(PaycommentVO comVo);
	int countPayline(int docNo);
	List<Integer> docNolist();
	int updateRead(PaylineVO plVo);
	int updateProgress(PaymentviewVO vo);
	List<PaycommentVO> selectSign(int docNo);
}
