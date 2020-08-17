package com.will.ice.address.model;

import java.util.List;


public class AddressListVO {
	private List<AddressVO> adItems;

	public List<AddressVO> getAdItems() {
		return adItems;
	}

	public void setAdItems(List<AddressVO> adItems) {
		this.adItems = adItems;
	}

	@Override
	public String toString() {
		return "AddressListVO [adItems의 adNo=" + adItems + "]";
	}


}
