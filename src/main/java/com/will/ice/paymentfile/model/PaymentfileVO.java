package com.will.ice.paymentfile.model;

public class PaymentfileVO {
	private int fileNo;
	private String fileName;
	private String originalFileName;
	private long fileSize;
	private int docNo;
	
	public int getFileNo() {
		return fileNo;
	}
	public void setFileNo(int fileNo) {
		this.fileNo = fileNo;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public String getOriginalFileName() {
		return originalFileName;
	}
	public void setOriginalFileName(String originalFileName) {
		this.originalFileName = originalFileName;
	}
	public long getFileSize() {
		return fileSize;
	}
	public void setFileSize(long fileSize) {
		this.fileSize = fileSize;
	}
	public int getDocNo() {
		return docNo;
	}
	public void setDocNo(int docNo) {
		this.docNo = docNo;
	}
	@Override
	public String toString() {
		return "PaymentfileVO [fileNo=" + fileNo + ", fileName=" + fileName + ", originalFileName=" + originalFileName
				+ ", fileSize=" + fileSize + ", docNo=" + docNo + "]";
	}
	
}
