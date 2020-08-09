package com.will.ice.accode.model;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Random;

import org.apache.commons.lang3.RandomUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.will.ice.common.SearchVO;

@Service
public class AccodeServiceImpl implements AccodeService{
	private static final Logger logger 
	= LoggerFactory.getLogger(AccodeServiceImpl.class);
	
	@Autowired private AccodeDAO accodeDao;

	
	@Override
	public List<AccodeVO> selectListAccode(SearchVO searchVO) {
		return accodeDao.selectListAccode(searchVO);
	}

	@Override
	public int selectTotalRecord(SearchVO searchVo) {
		return accodeDao.selectTotalRecord(searchVo);
	}

	@Override
	public int accRegisterMulti(List<AccodeVO> accList) {
		int cnt = 0;
		Date d = new Date();
		SimpleDateFormat sdf_date = new SimpleDateFormat("yyyy-MM-dd"); 
		SimpleDateFormat sdf_time = new SimpleDateFormat("HH:mm:ss"); 
		
		for( int i = 0; i<accList.size(); i++) {
			System.out.print("accList.size()"+accList.size());
			AccodeVO accVO = accList.get(i);
			
			if(accVO.getAccCode() == null) {
				cnt = 0;				
			}else {
				accVO.setConfirmDate(sdf_date.format(d));
				accVO.setConfirmTime(sdf_time.format(d));
				
				int confirm_num = RandomUtils.nextInt(3000,6000);
				accVO.setConfirmCode(Integer.toString(confirm_num));
				
				
				
				cnt = accodeDao.accRegisterMulti(accVO);
				logger.info("cnt ={}",cnt);
			}
		
		}
		
		return cnt;
	}

}
