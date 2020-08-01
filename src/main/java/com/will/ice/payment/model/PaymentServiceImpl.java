package com.will.ice.payment.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.will.ice.document.model.DocumentviewVO;
import com.will.ice.member.model.MemberVO;
import com.will.ice.payline.model.PaylineVO;

@Service
public class PaymentServiceImpl implements PaymentService{

	@Autowired
	private PaymentDAO paymentDao;

	@Override
	public List<PaylistViewVO> selectSent(String identNum) {
		return paymentDao.selectSent(identNum);
	}

	@Override
	public List<PaymentviewVO> selectImsy(String identNum) {
		return paymentDao.selectImsy(identNum);
	}

	@Override
	public int insertPaymentM(String[] memList, PaylinedocVO pldVo) {
		int cnt=0;
		pldVo.setProgress("결재진행중");
		pldVo.setImsy("N");
		paymentDao.insertPaydoc(pldVo);
		
		for(int i=0; i<memList.length; i++) {
			pldVo.setGetmemNo(memList[i]);
			cnt += paymentDao.insertPayline(pldVo);
		}
		
		return cnt;
	}

	@Override
	public PaymentviewVO selectDocument(int docNo) {
		return paymentDao.selectDocument(docNo);
	}

	@Override
	public List<DocumentviewVO> selectPayLine(int docNo) {
		return paymentDao.selectPayLine(docNo);
	}

	@Override
	public int deletePayLine(int docNo) {
		List<PaylineVO> list = paymentDao.isRead(docNo);
		boolean notRead=true;
		int cnt=0;
		for(PaylineVO vo : list) {
			if(vo.getRead().equalsIgnoreCase("Y")) {
				notRead=false;
				break;
			}
		}
		//읽지 않았으면 delete
		if(notRead) {
			cnt = paymentDao.deletePayLine(docNo);
			int a = paymentDao.updateImsy(docNo);
		}else {
			cnt = -1;
		}
		
		return cnt;
	}
	
	@Override
	public List<MemberVO> selectAllMem(int poscode) {
		return paymentDao.selectAllMem(poscode);
	}

	@Override
	public int insertOnePay(PaylinedocVO pldVo) {
		return paymentDao.insertOnePay(pldVo);
	}

}
