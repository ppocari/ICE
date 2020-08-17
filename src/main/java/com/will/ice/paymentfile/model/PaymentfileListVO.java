package com.will.ice.paymentfile.model;

import java.util.List;

public class PaymentfileListVO {
	private List<PaymentfileVO> fileItems;

	public List<PaymentfileVO> getFileItems() {
		return fileItems;
	}

	public void setFileItems(List<PaymentfileVO> fileItems) {
		this.fileItems = fileItems;
	}

	@Override
	public String toString() {
		return "PaymentfileListVO [fileItems=" + fileItems + "]";
	}
	
}
