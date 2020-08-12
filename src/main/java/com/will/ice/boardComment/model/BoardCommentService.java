package com.will.ice.boardComment.model;

import java.util.List;

public interface BoardCommentService {
	public int commentInsert(BoardCommentVO vo);
	public List<BoardCommentVO> commentList(int boardNo);
	public int commentUpdate(BoardCommentVO vo);
	public int commentDelete(int no);
}
