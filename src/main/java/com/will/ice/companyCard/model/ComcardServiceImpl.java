package com.will.ice.companyCard.model;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.will.ice.common.DateSearchVO;
import com.will.ice.common.Depart_posi_dateVO;
import com.will.ice.member.model.MemberServiceImpl;
import com.will.ice.member.model.MemberVO;
import com.will.ice.paymentfile.model.PaymentfileVO;


@Service
public class ComcardServiceImpl implements ComcardService{
	private static final Logger logger
	= LoggerFactory.getLogger(ComcardServiceImpl.class);

	@Autowired private ComcardDAO comcardDAO;

	@Override
	public List<ComcardVO> selectUnUseComcard(DateSearchVO search_dsvo) {
		return comcardDAO.selectUnUseComcard(search_dsvo);
	}

	@Override
	public ComcardVO selectNoComcard(int comcard_no) {
		return comcardDAO.selectNoComcard(comcard_no);
	}

	@Override
	public List<ComcardVO> selectListComcard(Depart_posi_dateVO dpdvo) {
		return comcardDAO.selectListComcard(dpdvo);
	}

	@Override
	public int insertCCMulti(List<ComcardVO> ccList, ComCardFileVO ccfvo) {
		int cnt = 0;
		logger.info("ccfvo ={}",ccfvo);

		for( int i = 0; i<ccList.size(); i++) {
			ComcardVO ccvo = ccList.get(i);
			if(ccvo.getCardNo() == null) {
				cnt = 0;
			}else {
				ccvo.setFileNo(ccfvo.getFileNo());
				cnt = comcardDAO.insertCCMulti(ccvo);
			}

			logger.info("i={}, cnt ={}", i, cnt);
		}

		return cnt;
	}

	@Override
	public int insertCCFile(ComCardFileVO CCfileVO) {

		return comcardDAO.insertCCFile(CCfileVO);
	}

	@Override
	public ComCardFileVO selectCCFile_recent() {
		return comcardDAO.selectCCFile_recent();
	}




}