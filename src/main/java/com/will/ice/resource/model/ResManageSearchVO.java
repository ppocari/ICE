package com.will.ice.resource.model;

public class ResManageSearchVO {
	/** 검색조건 */
	private String searchKeyword = "";
	
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
    
    /* 휴지통인지 아닌지 */
    private String isTrash;

	public String getSearchKeyword() {
		return searchKeyword;
	}

	public void setSearchKeyword(String searchKeyword) {
		this.searchKeyword = searchKeyword;
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

	public String getIsTrash() {
		return isTrash;
	}

	public void setIsTrash(String isTrash) {
		this.isTrash = isTrash;
	}

	@Override
	public String toString() {
		return "ResManageSearchVO [searchKeyword=" + searchKeyword + ", currentPage=" + currentPage + ", blockSize="
				+ blockSize + ", firstRecordIndex=" + firstRecordIndex + ", lastRecordIndex=" + lastRecordIndex
				+ ", recordCountPerPage=" + recordCountPerPage + ", isTrash=" + isTrash + "]";
	}
    
}
