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
	public int deleteNotice(int noticeNo) {
		return noticeDao.deleteNotice(noticeNo);
	}

	@Override
	public int updateNotice(NoticeVO vo) {
		return noticeDao.updateNotice(vo);
	}

	@Override
	public int updateDownCount(int noticeNo) {
		return noticeDao.updateDownCount(noticeNo);
	}

	@Override
	public List<NoticeVO> selectMain() {
		return noticeDao.selectMain();
	}

}
