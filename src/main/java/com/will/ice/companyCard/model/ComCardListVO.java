package com.will.ice.companyCard.model;

import java.util.List;

public class ComCardListVO {
	private List<ComcardVO> comCardItmes;

	public List<ComcardVO> getComCardItmes() {
		return comCardItmes;
	}

	public void setComCardItmes(List<ComcardVO> comCardItmes) {
		this.comCardItmes = comCardItmes;
	}

	@Override
	public String toString() {
		return "ComCardListVO [comCardItmes=" + comCardItmes + "]";
	}
	
	
}
