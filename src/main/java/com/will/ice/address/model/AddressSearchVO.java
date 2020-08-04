package com.will.ice.address.model;

/**
 * 검색 정보를 담고있는 Bean
 * 페이징 처리 관련 변수 포함
*/

public class AddressSearchVO {
	/** 검색할 주소의 사원 No */
	private String memNo;
	
	/** 검색조건 */
	private String searchKeyword = "";
	
	/** 검색조건 - 마이바티스 뒷부분*/
	private String nextKeyword = "";
	
	/** 검색조건 - 한글인지, 영어인지, 즐겨찾기인지 */
	private String searchCondition;
	
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
    
   /**
     * 검색 조건을  설정한다.
     * @param bean 검색조건
     */
    public void setSearchVO(AddressSearchVO bean){
    	this.currentPage = bean.currentPage;
    	this.searchCondition = bean.getSearchCondition();
    	this.blockSize = bean.blockSize;
    	this.firstRecordIndex = bean.firstRecordIndex;
    	this.lastRecordIndex = bean.lastRecordIndex;
    	this.recordCountPerPage = bean.recordCountPerPage;
    
    }
    
	public String getSearchKeyword() {
		return searchKeyword;
	}

	public void setSearchKeyword(String searchKeyword) {
		this.searchKeyword = searchKeyword;
	}

	public String getNextKeyword() {
		return nextKeyword;
	}

	public void setNextKeyword(String nextKeyword) {
		this.nextKeyword = nextKeyword;
	}

	public String getIsTrash() {
		return isTrash;
	}

	public void setIsTrash(String isTrash) {
		this.isTrash = isTrash;
	}

	public String getMemNo() {
		return memNo;
	}
	
	public void setMemNo(String memNo) {
		this.memNo = memNo;
	}

	public String getSearchCondition() {
    	return searchCondition;
    }

    public void setSearchCondition(String searchCondition) {
    	this.searchCondition = searchCondition;
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
	
	@Override
	public String toString() {
		return "AddressSearchVO [memNo=" + memNo + ", searchKeyword=" + searchKeyword + ", nextKeyword=" + nextKeyword
				+ ", searchCondition=" + searchCondition + ", currentPage=" + currentPage + ", blockSize=" + blockSize
				+ ", firstRecordIndex=" + firstRecordIndex + ", lastRecordIndex=" + lastRecordIndex
				+ ", recordCountPerPage=" + recordCountPerPage + ", isTrash=" + isTrash + "]";
	}
	
	
}
 