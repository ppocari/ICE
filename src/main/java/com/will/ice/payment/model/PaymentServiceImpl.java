package com.will.ice.payment.model;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.will.ice.common.PaymentSearchVO;
import com.will.ice.document.model.DocumentviewVO;
import com.will.ice.member.model.MemberVO;
import com.will.ice.payline.model.PaylineVO;
import com.will.ice.paymentfile.model.PaymentfileVO;

@Service
public class PaymentServiceImpl implements PaymentService{
	private static final Logger logger = LoggerFactory.getLogger(PaymentServiceImpl.class);
	
	@Autowired
	private PaymentDAO paymentDao;

	@Override
	public List<PaylistViewVO> selectSent(PaymentSearchVO paysearchVo) {
		return paymentDao.selectSent(paysearchVo);
	}

	@Override
	public List<PaymentviewVO> selectImsy(PaymentSearchVO paysearchVo) {
		return paymentDao.selectImsy(paysearchVo);
	}

	@Override
	public int insertPaymentM(String[] memList, PaylinedocVO pldVo, PaymentfileVO fileVo) {
		int cnt=0;
		pldVo.setProgress("결재진행중");
		pldVo.setImsy("N");
		paymentDao.insertPaydoc(pldVo);

		if(fileVo.getFileName()!=null || fileVo.getFileName().isEmpty()) {
			fileVo.setDocNo(pldVo.getDocNo());
			int cnf = paymentDao.saveFile(fileVo);
			int isf = paymentDao.isFile(pldVo.getDocNo());
			logger.info("파일저장 ={},isFile={}",cnf,isf);
		}
		
		for(int i=0; i<memList.length; i++) {
			pldVo.setGetmemNo(memList[i]);
			cnt += paymentDao.insertPayline(pldVo);
		}
		
		return cnt;
	}
	
	@Override
	public int updatePaydocM(String[] memList, PaylinedocVO pldVo, PaymentfileVO fileVo) {
		int cnt=0;
		pldVo.setProgress("결재진행중");
		pldVo.setImsy("N");
		paymentDao.updatePaydoc(pldVo);
		paymentDao.reallydeletePayLine(pldVo.getDocNo());
		
		if(fileVo.getFileName()!=null || fileVo.getFileName().isEmpty()) {
			paymentDao.updateFile(fileVo);
			paymentDao.isFile(pldVo.getDocNo());
		}
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

	@Override
	public PaymentfileVO getFile(int docNo) {
		return paymentDao.getFile(docNo);
	}

	@Override
	public int updatePaydoc(PaylinedocVO pldVo) {
		return paymentDao.updatePaydoc(pldVo);
	}

}
