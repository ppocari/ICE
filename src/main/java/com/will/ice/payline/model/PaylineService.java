package com.will.ice.payline.model;

import java.util.List;

import com.will.ice.member.model.MemberVO;

public interface PaylineService {
	List<MemberVO> selectAllMem(int poscode);
}
