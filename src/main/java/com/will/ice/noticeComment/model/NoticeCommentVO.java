package com.will.ice.noticeComment.model;

import java.sql.Timestamp;

public class NoticeCommentVO {
	private int no;	//댓글번호
	private int noticeNo;	//게시판 번호
	private String name;	//별명
	private String memNo;		//회원번호
	private String content;		//내용	
	private Timestamp regdate;	//올린날짜
}
