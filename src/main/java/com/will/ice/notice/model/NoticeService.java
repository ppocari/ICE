package com.will.ice.notice.model;

import java.util.List;

import com.will.ice.common.SearchVO;

public interface NoticeService {
	public int insertNotice(NoticeVO vo);
	public List<NoticeVO> selectAll(SearchVO searchVo);
	public int selectTotalRecord(SearchVO searchVo);
	public int updateReadCount(int noticeNo);
	public NoticeVO selectByNo(int noticeNo);
	public int deleteNotice(int noticeNo);
	public int updateNotice(NoticeVO vo);
	public int updateDownCount(int noticeNo);
}
