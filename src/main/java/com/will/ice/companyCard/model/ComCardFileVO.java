
package com.will.ice.companyCard.model;

public class ComCardFileVO {
	private int fileNo;
	private String fileName;
	private String originalFileName;
	private long fileSize;
	
	
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
	
	@Override
	public String toString() {
		return "ComCardFileVO [fileNo=" + fileNo + ", fileName=" + fileName + ", originalFileName=" + originalFileName
				+ ", fileSize=" + fileSize  + "]";
	}
	
}
