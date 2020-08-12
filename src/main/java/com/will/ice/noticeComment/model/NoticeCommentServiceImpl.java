package com.will.ice.noticeComment.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class NoticeCommentServiceImpl implements NoticeCommentService{
	@Autowired
	private NoticeCommentDAO noticeCommentDao;
	
	@Override
	public int commentInsert(NoticeCommentVO vo) {
		return noticeCommentDao.commentInsert(vo);
	}

	@Override
	public List<NoticeCommentVO> commentList(int noticeNo) {
		return noticeCommentDao.commentList(noticeNo);
	}

	@Override
	public int commentUpdate(NoticeCommentVO vo) {
		return noticeCommentDao.commentUpdate(vo);
	}

	@Override
	public int commentDelete(int noticeNo) {
		return noticeCommentDao.commentDelete(noticeNo);
	}

}
