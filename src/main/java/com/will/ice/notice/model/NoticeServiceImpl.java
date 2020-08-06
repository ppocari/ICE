package com.will.ice.notice.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.will.ice.common.SearchVO;

@Service
public class NoticeServiceImpl implements NoticeService{
	@Autowired
	private NoticeDAO noticeDao;

	@Override
	public int insertNotice(NoticeVO vo) {
		return noticeDao.insertNotice(vo);
	}
	
	public List<NoticeVO> selectAll(SearchVO searchVo){
		return noticeDao.selectAll(searchVo);
	}	
	
	@Override
	public int selectTotalRecord(SearchVO searchVo) {
		return noticeDao.selectTotalRecord(searchVo);
	}
	
	public int updateReadCount(int noticeNo) {
		return noticeDao.updateReadCount(noticeNo);
	}

	@Override
	public NoticeVO selectByNo(int noticeNo) {
		return noticeDao.selectByNo(noticeNo);
	}

	@Override
	public int deleteBoard(int noticeNo) {
		return noticeDao.deleteBoard(noticeNo);
	}

	@Override
	public int updateBoard(int noticeNo) {
		return noticeDao.updateBoard(noticeNo);
	}
}
