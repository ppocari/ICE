package com.will.ice.payment.model;

import java.util.List;

import com.will.ice.common.PaymentSearchVO;
import com.will.ice.document.model.ChkDocumentviewVO;
import com.will.ice.document.model.DocumentviewVO;
import com.will.ice.member.model.MemberVO;
import com.will.ice.paycomment.model.CommentviewVO;
import com.will.ice.paycomment.model.PaycommentVO;
import com.will.ice.payline.model.PaylineVO;
import com.will.ice.paymentfile.model.PaymentfileVO;

public interface PaymentService {
	/* ---------------기안함------------------- */
	List<PaylistViewVO> selectSent(PaymentSearchVO paysearchVo);
	List<PaymentviewVO> selectImsy(PaymentSearchVO paysearchVo);
	int insertPaymentM(String[] memList, PaylinedocVO pldVo, PaymentfileVO fileVo);
	PaymentviewVO selectDocument(int docNo);
	List<ChkDocumentviewVO> selectPayLine(int docNo);
	List<DocumentviewVO> selectPayLine2(int docNo);
	int deletePayLine(int docNo);
	List<MemberVO> selectAllMem(int poscode);
	int insertImsyPay(PaylinedocVO pldVo,PaymentfileVO fileVo);
	int updatePaydocM(String[] memList, PaylinedocVO pldVo, PaymentfileVO fileVo,String oldfileName);
	PaymentfileVO getFile(int docNo);
	int updatePaydoc(PaylinedocVO pldVo,PaymentfileVO fileVo,String oldfileName);
	
	/* ---------------결재함------------------- */
	List<PaylistViewVO> selectUndecided2(PaymentSearchVO paysearchVo,List<Integer> docNolist);
	int insertComment(PaycommentVO comVo);
	List<Integer> docNolist();
	int updateRead(PaylineVO plVo);
	List<PaycommentVO> selectSign(int docNo);
	List<PaylistViewVO> selectDecided(PaymentSearchVO paysearchVo);
	int updateProgress(PaymentviewVO vo);
	List<PaymentviewVO> selectRejected(PaymentSearchVO paysearchVo);
	List<CommentviewVO> selectComment(int docNo);
}
