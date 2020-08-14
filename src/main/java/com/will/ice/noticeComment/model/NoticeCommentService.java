package com.will.ice.noticeComment.model;

import java.util.List;

import com.will.ice.boardComment.model.BoardCommentVO;

public interface NoticeCommentService {
	public int commentInsert(NoticeCommentVO vo);
	public List<NoticeCommentViewVO> commentList(int noticeNo);
	public int commentUpdate(NoticeCommentViewVO vo);
	public int commentDelete(int noticeNo);
}
