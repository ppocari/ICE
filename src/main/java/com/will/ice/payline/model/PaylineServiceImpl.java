package com.will.ice.payline.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.will.ice.member.model.MemberVO;

@Service
public class PaylineServiceImpl implements PaylineService{

	@Autowired
	private PaylineDAO paylineDao;

	@Override
	public List<MemberVO> selectAllMem(int poscode) {
		return paylineDao.selectAllMem(poscode);
	}

	
}
