package com.will.ice.insa.model;

import java.util.List;

//커맨드 객체로 List 받기
/*
 스프링 MVC는 List 타입의 프로퍼티에 대한 바인딩도 처리해 줌
예) MemberListVO 클래스는  MemberVO 목록을 갖는 List 타입의 
memItems 프로퍼티를 갖고 있다
*/

public class InsaListVO {
	private List<InsaVO> memItems;

	public List<InsaVO> getMemItems() {
		return memItems;
	}

	public void setMemItems(List<InsaVO> memItems) {
		this.memItems = memItems;
	}

	@Override
	public String toString() {
		return "MemberListVO [memItems=" + memItems + "]";
	}

	
}
