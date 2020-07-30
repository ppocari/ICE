package com.will.ice.payline.model;

import java.util.List;

import com.will.ice.member.model.MemberVO;

public interface PaylineDAO {
	List<MemberVO> selectAllMem(int poscode);
}
