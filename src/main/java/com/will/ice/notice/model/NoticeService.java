package com.will.ice.notice.model;

import java.util.List;

import com.will.ice.common.SearchVO;

public interface NoticeService {
	public int insertNotice(NoticeVO vo);
	public List<NoticeVO> selectAll(SearchVO searchVo);
	public int selectTotalRecord(SearchVO searchVo);
	public int updateReadCount(int NOTI_NO);
	public NoticeVO selectByNo(int NOTI_NO);
	public int deleteBoard(int NOTI_NO);
	public int updateBoard(int NOTI_NO);
}
