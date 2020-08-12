package com.will.ice.boardComment.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.will.ice.board.model.BoardService;

@Service
public class BoardCommentServiceImpl implements BoardCommentService{
	@Autowired
	private BoardCommentDAO boardCommentDao;

	@Override
	public int commentInsert(BoardCommentVO vo) {
		return boardCommentDao.commentInsert(vo);
	}

	@Override
	public List<BoardCommentVO> commentList(int boardNo) {
		return  boardCommentDao.commentList(boardNo);
	}

	@Override
	public int commentUpdate(BoardCommentVO vo) {
		return  boardCommentDao.commentUpdate(vo);
	}

	@Override
	public int commentDelete(int no) {
		return  boardCommentDao.commentDelete(no);
	}
	
	
}
