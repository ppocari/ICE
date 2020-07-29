package com.will.ice.member.model;

import java.util.List;

//커맨드 객체로 List 받기
/*
 스프링 MVC는 List 타입의 프로퍼티에 대한 바인딩도 처리해 줌
예) ProductListVO 클래스는  productVo 목록을 갖는 List 타입의 
pdItems 프로퍼티를 갖고 있다
*/

public class MemberListVO {
	private List<MemberVO> memList;

	public List<MemberVO> getMemList() {
		return memList;
	}

	public void setMemList(List<MemberVO> memList) {
		this.memList = memList;
	}

	@Override
	public String toString() {
		return "MemberListVO [memList=" + memList + "]";
	}
	
	
}
