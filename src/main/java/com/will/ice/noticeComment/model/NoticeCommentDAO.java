package com.will.ice.noticeComment.model;

import java.util.List;

import com.will.ice.boardComment.model.BoardCommentVO;

public interface NoticeCommentDAO {
	public int commentInsert(NoticeCommentVO vo);
	public List<NoticeCommentVO> commentList(int noticeNo);
	public int commentUpdate(NoticeCommentVO vo);
	public int commentDelete(int noticeNo);
}
