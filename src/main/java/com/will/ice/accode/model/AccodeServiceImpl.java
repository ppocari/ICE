package com.will.ice.accode.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.will.ice.common.Depart_posi_dateVO;
import com.will.ice.common.SearchVO;
import com.will.ice.member.model.MemberVO;

@Service
public class AccodeServiceImpl implements AccodeService{
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
		
		for( int i = 0; i<accList.size(); i++) {
			AccodeVO accVO = accList.get(i);
			if(accVO.getAccCode() == null) {
				cnt = 0;
			}else {
				cnt = accodeDao.accRegisterMulti(accVO);
			}
			
		}
		
		return cnt;
	}

}
