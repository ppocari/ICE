package com.will.ice.payment.model;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.will.ice.common.PaymentSearchVO;
import com.will.ice.document.model.ChkDocumentviewVO;
import com.will.ice.document.model.DocumentviewVO;
import com.will.ice.member.model.MemberVO;
import com.will.ice.paycomment.model.CommentviewVO;
import com.will.ice.paycomment.model.PaycommentVO;
import com.will.ice.payline.model.PaylineVO;
import com.will.ice.paymentfile.model.PaymentfileListVO;
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
	public int insertPaymentM(String[] memList, PaylinedocVO pldVo, PaymentfileListVO fListVo) {
		//기안작성 -> 결재선 지정
		int cnt=0;
		pldVo.setImsy("N");
		pldVo.setProgress("waiting");
		paymentDao.insertPaydoc(pldVo);
		List<PaymentfileVO> fileListDB = fListVo.getFileItems();
		logger.info("fileListDB={}",fileListDB);
		
		if(fileListDB==null || fileListDB.isEmpty()) {
			pldVo.setHasFile("N");
			int isf = paymentDao.isFile(pldVo);
			logger.info("isFile={}",isf);
		}
		
		if(fileListDB!=null && !fileListDB.isEmpty()) {
		for(PaymentfileVO fileVo : fileListDB) {
			logger.info("첨부파일 fileVo={}",fileVo);
			if(fileVo.getFileName()!=null&&!fileVo.getFileName().isEmpty()) {
				fileVo.setDocNo(pldVo.getDocNo());
				int cnf = paymentDao.saveFile(fileVo);
				pldVo.setHasFile("Y");
				int isf = paymentDao.isFile(pldVo);
				logger.info("파일저장 ={},isFile={}",cnf,isf);
			}
		}
		}
		
		for(int i=memList.length-1; i>-1; i--) {
			pldVo.setGetmemNo(memList[i]);
			cnt += paymentDao.insertPayline(pldVo);
		}
		
		return cnt;
	}
	
	@Override
	public int insertImsyPay(PaylinedocVO pldVo, List<PaymentfileVO> fileListDB) {
		//기안작성 -> 임시보관
		pldVo.setImsy("Y");
		pldVo.setProgress("imsy");
		int cnt = paymentDao.insertOnePay(pldVo);
		
		if(fileListDB==null || fileListDB.isEmpty()) {
			pldVo.setHasFile("N");
			int isf = paymentDao.isFile(pldVo);
			logger.info("isFile={}",isf);
		}
		
		for(PaymentfileVO fileVo : fileListDB) {
			if(fileVo.getFileName()!=null&&!fileVo.getFileName().isEmpty()) {
				fileVo.setDocNo(pldVo.getDocNo());
				int cnf = paymentDao.saveFile(fileVo);
				pldVo.setHasFile("Y");
				int isf = paymentDao.isFile(pldVo);
				logger.info("파일저장 ={},isFile={}",cnf,isf);
			}
		}
		return cnt;
	}
	
	@Override
	public int updatePaydocM(String[] memList, PaylinedocVO pldVo, PaymentfileListVO fListVo, String oldfileName2) {
		//임시보관 -> 결재선 지정
		int cnt=0;
		int a=paymentDao.updatePaydoc(pldVo);
		logger.info("임시보관 => 완료함 pldVo={},a={}",pldVo,a);
		
		paymentDao.reallydeletePayLine(pldVo.getDocNo());
		List<PaymentfileVO> fileListDB = fListVo.getFileItems();
		
		if(fileListDB==null || fileListDB.isEmpty()) {
			if(oldfileName2!=null && !oldfileName2.isEmpty()) {
				pldVo.setHasFile("Y");
			}else {
				pldVo.setHasFile("N");
			}
			int isf = paymentDao.isFile(pldVo);
			logger.info("isFile={}",isf);
		}	
		
		if(fileListDB!=null && !fileListDB.isEmpty()) {
			for(PaymentfileVO fileVo : fileListDB) {
				fileVo.setDocNo(pldVo.getDocNo());
				if(fileVo.getFileName()!=null&&!fileVo.getFileName().isEmpty()) {
					if(oldfileName2!=null && !oldfileName2.isEmpty()) {//원파일있으면수정
						paymentDao.updateFile(fileVo);
					}else {											//없으면 새로저장
						paymentDao.saveFile(fileVo);
					}
					pldVo.setHasFile("Y");
					paymentDao.isFile(pldVo);
				}
			}
		}
		for(int i=memList.length-1; i>-1; i--) {
			pldVo.setGetmemNo(memList[i]);
			cnt += paymentDao.insertPayline(pldVo);
		}
		
		return cnt;
	}
	
	@Override
	public int updatePaydoc(PaylinedocVO pldVo,List<PaymentfileVO> fileListDB,String oldfileName2) {
		//임시보관 -> 임시보관
		pldVo.setImsy("Y");
		pldVo.setProgress("imsy");
		
		if(fileListDB==null || fileListDB.isEmpty()) {
			if(oldfileName2!=null && !oldfileName2.isEmpty()) {
				pldVo.setHasFile("Y");
			}else {
				pldVo.setHasFile("N");
			}
			int isf = paymentDao.isFile(pldVo);
			logger.info("isFile={}",isf);
		}
		
		for(PaymentfileVO fileVo : fileListDB) {
			fileVo.setDocNo(pldVo.getDocNo());
			if(fileVo.getFileName()!=null&&!fileVo.getFileName().isEmpty()) {
				if(oldfileName2!=null && !oldfileName2.isEmpty()) {//원파일있으면수정
					paymentDao.updateFile(fileVo);
				}else {											//없으면 새로저장
					paymentDao.saveFile(fileVo);
				}
				pldVo.setHasFile("Y");
				paymentDao.isFile(pldVo);
			}
		}
		return paymentDao.updatePaydoc(pldVo);
	}
	
	@Override
	public PaymentviewVO selectDocument(int docNo) {
		return paymentDao.selectDocument(docNo);
	}

	@Override
	public List<ChkDocumentviewVO> selectPayLine(int docNo) {
		return paymentDao.selectPayLine(docNo);
	}

	@Override
	public List<DocumentviewVO> selectPayLine2(int docNo) {
		return paymentDao.selectPayLine2(docNo);
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
	public List<PaymentfileVO> getFile(int docNo) {
		return paymentDao.getFile(docNo);
	}

	@Override
	public List<PaylistViewVO> selectUndecided2(PaymentSearchVO paysearchVo,List<Integer> docNolist) {
		int docNo=0;
		List<PaylistViewVO> list = new ArrayList<PaylistViewVO>();
		
		for(int i=0; i<docNolist.size(); i++) {
			docNo = docNolist.get(i);
			paysearchVo.setDocNo(docNo);
			logger.info("paysearchVo={}",paysearchVo);
			PaylistViewVO vo = paymentDao.selectUndecided(paysearchVo);
			logger.info("PaylistViewVO={}",vo);
			
			if(vo!=null) {
				if(vo.getGmemNo().equals(paysearchVo.getIdentNum())) {
					list.add(vo);
				}
			}
		}
		
		return list;
	}

	@Override
	public int insertComment(PaycommentVO comVo) {
		paymentDao.updatePaydate(comVo);
		int cnt = paymentDao.insertComment(comVo);
		
		PaymentviewVO vo = new PaymentviewVO();
		vo.setDocNo(comVo.getDocNo());
		vo.setMemNo(comVo.getMemNo());
		if(paymentDao.countPayline(comVo.getDocNo())>0) {
			vo.setProgress("ongoing");
		}else if(comVo.getSignName()=="" && !comVo.getSignName().isEmpty()){
			vo.setProgress("reject");
		}else {
			vo.setProgress("decided");
		}
		
		paymentDao.updateProgress(vo);
		
		return cnt;
	}

	@Override
	public List<Integer> docNolist() {
		return paymentDao.docNolist();
	}

	@Override
	public int updateRead(PaylineVO plVo) {
		return paymentDao.updateRead(plVo);
	}

	@Override
	public List<PaycommentVO> selectSign(int docNo) {
		return paymentDao.selectSign(docNo);
	}

	@Override
	public List<PaylistViewVO> selectDecided(PaymentSearchVO paysearchVo) {
		paysearchVo.setProgress("decided");
		return paymentDao.selectDecided(paysearchVo);
	}

	@Override
	public int updateProgress(PaymentviewVO vo) {
		return paymentDao.updateProgress(vo);
	}

	@Override
	public List<PaymentviewVO> selectRejected(PaymentSearchVO paysearchVo) {
		paysearchVo.setProgress("reject");
		return paymentDao.selectRejected(paysearchVo);
	}

	@Override
	public List<CommentviewVO> selectComment(int docNo) {
		return paymentDao.selectComment(docNo);
	}

}
