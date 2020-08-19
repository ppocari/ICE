package com.will.ice.message.model;

import java.sql.Timestamp;

import com.will.ice.common.SearchVO;

public class MessageVO  {
	private int no;				//보낸 번호
	private String recMemNo;	//메세지 받을 사람 목록 8,9,
	private String recName;	//메세지 받을 사람 이름
	private int msgNo; 			//메세지 번호
		
	private String msgStatus;	//메세지 읽음 안읽음
	private String msgContent;	//메세지 내용
	private Timestamp msgRegdate;	//INSERT 안함, sysdate
	
	private String sendMemNo;	//메세지 쓰는 사람꺼
	private String sendName;	//메세지 쓰는 사람꺼
	
	private String searchCondition = "";
	
	/** 검색키워드 */
	private String searchKeyword = "";
    
	/** 검색 사용여부 */
	private String searchUseYn = "";
	
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

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getRecMemNo() {
		return recMemNo;
	}

	public void setRecMemNo(String recMemNo) {
		this.recMemNo = recMemNo;
	}

	public String getRecName() {
		return recName;
	}

	public void setRecName(String recName) {
		this.recName = recName;
	}

	public int getMsgNo() {
		return msgNo;
	}

	public void setMsgNo(int msgNo) {
		this.msgNo = msgNo;
	}

	public String getMsgStatus() {
		return msgStatus;
	}

	public void setMsgStatus(String msgStatus) {
		this.msgStatus = msgStatus;
	}

	public String getMsgContent() {
		return msgContent;
	}

	public void setMsgContent(String msgContent) {
		this.msgContent = msgContent;
	}

	public Timestamp getMsgRegdate() {
		return msgRegdate;
	}

	public void setMsgRegdate(Timestamp msgRegdate) {
		this.msgRegdate = msgRegdate;
	}

	public String getSendMemNo() {
		return sendMemNo;
	}

	public void setSendMemNo(String sendMemNo) {
		this.sendMemNo = sendMemNo;
	}

	public String getSendName() {
		return sendName;
	}

	public void setSendName(String sendName) {
		this.sendName = sendName;
	}

	public String getSearchCondition() {
		return searchCondition;
	}

	public void setSearchCondition(String searchCondition) {
		this.searchCondition = searchCondition;
	}

	public String getSearchKeyword() {
		return searchKeyword;
	}

	public void setSearchKeyword(String searchKeyword) {
		this.searchKeyword = searchKeyword;
	}

	public String getSearchUseYn() {
		return searchUseYn;
	}

	public void setSearchUseYn(String searchUseYn) {
		this.searchUseYn = searchUseYn;
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
		return "MessageVO [no=" + no + ", recMemNo=" + recMemNo + ", recName=" + recName + ", msgNo=" + msgNo
				+ ", msgStatus=" + msgStatus + ", msgContent=" + msgContent + ", msgRegdate=" + msgRegdate
				+ ", sendMemNo=" + sendMemNo + ", sendName=" + sendName + ", searchCondition=" + searchCondition
				+ ", searchKeyword=" + searchKeyword + ", searchUseYn=" + searchUseYn + ", currentPage=" + currentPage
				+ ", blockSize=" + blockSize + ", firstRecordIndex=" + firstRecordIndex + ", lastRecordIndex="
				+ lastRecordIndex + ", recordCountPerPage=" + recordCountPerPage + "]";
	}
	
    
    
	
	
	
	
	

	
}
