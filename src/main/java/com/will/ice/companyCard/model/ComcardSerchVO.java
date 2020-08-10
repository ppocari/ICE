package com.will.ice.companyCard.model;

public class ComcardSerchVO {
	private String month;
	private String year;
	
	private String clickfileName;

	public String getMonth() {
		return month;
	}

	public void setMonth(String month) {
		this.month = month;
	}

	public String getYear() {
		return year;
	}

	public void setYear(String year) {
		this.year = year;
	}

	public String getClickfileName() {
		return clickfileName;
	}

	public void setClickfileName(String clickfileName) {
		this.clickfileName = clickfileName;
	}

	@Override
	public String toString() {
		return "ComcardSerchVO [month=" + month + ", year=" + year + ", clickfileName=" + clickfileName + "]";
	}
	
	
}	
