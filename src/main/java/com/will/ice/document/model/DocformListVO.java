package com.will.ice.document.model;

import java.util.List;

public class DocformListVO {
	private List<DocformVO> formItems;

	public List<DocformVO> getFormItems() {
		return formItems;
	}

	public void setFormItems(List<DocformVO> formItems) {
		this.formItems = formItems;
	}

	@Override
	public String toString() {
		return "DocformListVO [formItems=" + formItems + "]";
	}
}
