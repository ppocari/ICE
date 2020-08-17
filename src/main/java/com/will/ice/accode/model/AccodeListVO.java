package com.will.ice.accode.model;

import java.util.List;

public class AccodeListVO {
	private List<AccodeVO> accItems;

	public List<AccodeVO> getAccItems() {
		return accItems;
	}

	public void setAccItems(List<AccodeVO> accItems) {
		this.accItems = accItems;
	}

	@Override
	public String toString() {
		return "AccodeListVO [accItems=" + accItems + "]";
	}
	
	
}
