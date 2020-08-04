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
		//기안작성 -> 결재선 지정
		int cnt=0;
		pldVo.setImsy("N");
		pldVo.setProgress("결재대기중");
		paymentDao.insertPaydoc(pldVo);
		
		logger.info("첨부파일 fileVo={}",fileVo);

		if(fileVo.getFileName()!=null&&!fileVo.getFileName().isEmpty()) {
			fileVo.setDocNo(pldVo.getDocNo());
			int cnf = paymentDao.saveFile(fileVo);
			pldVo.setHasFile("Y");
			int isf = paymentDao.isFile(pldVo);
			logger.info("파일저장 ={},isFile={}",cnf,isf);
		}else {
			pldVo.setHasFile("N");
			int isf = paymentDao.isFile(pldVo);
			logger.info("isFile={}",isf);
		}
		
		for(int i=0; i<memList.length; i++) {
			pldVo.setGetmemNo(memList[i]);
			cnt += paymentDao.insertPayline(pldVo);
		}
		
		return cnt;
	}
	
	@Override
	public int insertImsyPay(PaylinedocVO pldVo, PaymentfileVO fileVo) {
		//기안작성 -> 임시보관
		logger.info("첨부파일 fileVo={}",fileVo);
		pldVo.setImsy("Y");
		pldVo.setProgress("임시보관");
		int cnt = paymentDao.insertOnePay(pldVo);
				
		if(fileVo.getFileName()!=null&&!fileVo.getFileName().isEmpty()) {
			fileVo.setDocNo(pldVo.getDocNo());
			int cnf = paymentDao.saveFile(fileVo);
			pldVo.setHasFile("Y");
			int isf = paymentDao.isFile(pldVo);
			logger.info("파일저장 ={},isFile={}",cnf,isf);
		}else {
			pldVo.setHasFile("N");
			int isf = paymentDao.isFile(pldVo);
			logger.info("isFile={}",isf);
		}
		
		return cnt;
	}
	
	@Override
	public int updatePaydocM(String[] memList, PaylinedocVO pldVo, PaymentfileVO fileVo, String oldfileName2) {
		//임시보관 -> 결재선 지정
		int cnt=0;
		pldVo.setImsy("N");
		pldVo.setProgress("결재대기중");
		int a=paymentDao.updatePaydoc(pldVo);
		logger.info("임시보관 => 완료함 pldVo={},a={}",pldVo,a);
		
		paymentDao.reallydeletePayLine(pldVo.getDocNo());
		
		fileVo.setDocNo(pldVo.getDocNo());
		if(fileVo.getFileName()!=null&&!fileVo.getFileName().isEmpty()) {
			if(oldfileName2!=null && !oldfileName2.isEmpty()) {//원파일있으면수정
				paymentDao.updateFile(fileVo);
			}else {											//없으면 새로저장
				paymentDao.saveFile(fileVo);
			}
			pldVo.setHasFile("Y");
			paymentDao.isFile(pldVo);
		}else {
			if(oldfileName2!=null && !oldfileName2.isEmpty()) {
				pldVo.setHasFile("Y");
			}else {
				pldVo.setHasFile("N");
			}
			int isf = paymentDao.isFile(pldVo);
			logger.info("isFile={}",isf);
		}
		
		for(int i=0; i<memList.length; i++) {
			pldVo.setGetmemNo(memList[i]);
			cnt += paymentDao.insertPayline(pldVo);
		}
		
		return cnt;
	}
	
	@Override
	public int updatePaydoc(PaylinedocVO pldVo,PaymentfileVO fileVo,String oldfileName) {
		//임시보관 -> 임시보관
		logger.info("첨부파일 fileVo={}",fileVo);
		pldVo.setImsy("Y");
		pldVo.setProgress("임시보관");
		
		if(fileVo.getFileName()!=null&&!fileVo.getFileName().isEmpty()) {
			fileVo.setDocNo(pldVo.getDocNo());
			int cnf =0;
			if(oldfileName!=null && !oldfileName.isEmpty()) {//원파일있으면수정
				cnf = paymentDao.updateFile(fileVo);
			}else {											//없으면 새로저장
				cnf = paymentDao.saveFile(fileVo);
			}
			
			pldVo.setHasFile("Y");
			int isf = paymentDao.isFile(pldVo);
			logger.info("파일저장 ={},isFile={}",cnf,isf);
		}else {
			pldVo.setHasFile("N");
			int isf = paymentDao.isFile(pldVo);
			logger.info("isFile={}",isf);
		}
		
		return paymentDao.updatePaydoc(pldVo);
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
	public PaymentfileVO getFile(int docNo) {
		return paymentDao.getFile(docNo);
	}

}
