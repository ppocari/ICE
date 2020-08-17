package com.will.ice.resource.model;

public class ResReserveSearchVO {
	/** 검색조건 */
	private String rvState = "";
	
	private int searchNumber=0;
	
	/** 현재 페이지 */
	private int currentPage = 1;
	
    /**블럭당 보여질 페이지 수,  페이지 사이즈 */
    private int blockSize; // properties에서 설정
    
    /** 시작 인덱스 */
    private int firstRecordIndex = 1;
    
    /** 끝 인덱스 */
    private int lastRecordIndex = 1;
    
    /**페이지 별 레코드 갯수 (pageSize) */
    private int recordCountPerPage; 
    
    /* 예약 처리 시 승인인지 거절인지 구분 */
    private String mode;
    
	public String getRvState() {
		return rvState;
	}

	public void setRvState(String rvState) {
		this.rvState = rvState;
	}
	

	public int getSearchNumber() {
		return searchNumber;
	}

	public void setSearchNumber(int searchNumber) {
		this.searchNumber = searchNumber;
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public int getBlockSize() {
		return blockSize;
	}

	public void setBlockSize(int blockSize) {
		this.blockSize = blockSize;
	}

	public int getFirstRecordIndex() {
		return firstRecordIndex;
	}

	public void setFirstRecordIndex(int firstRecordIndex) {
		this.firstRecordIndex = firstRecordIndex;
	}

	public int getLastRecordIndex() {
		return lastRecordIndex;
	}

	public void setLastRecordIndex(int lastRecordIndex) {
		this.lastRecordIndex = lastRecordIndex;
	}

	public int getRecordCountPerPage() {
		return recordCountPerPage;
	}

	public void setRecordCountPerPage(int recordCountPerPage) {
		this.recordCountPerPage = recordCountPerPage;
	}

	public String getMode() {
		return mode;
	}

	public void setMode(String mode) {
		this.mode = mode;
	}

	@Override
	public String toString() {
		return "ResReserveSearchVO [rvState=" + rvState + ", searchNumber=" + searchNumber + ", currentPage="
				+ currentPage + ", blockSize=" + blockSize + ", firstRecordIndex=" + firstRecordIndex
				+ ", lastRecordIndex=" + lastRecordIndex + ", recordCountPerPage=" + recordCountPerPage + ", mode="
				+ mode + "]";
	}


	
}
