package com.will.ice.board.model;

import java.util.List;

import com.will.ice.common.SearchVO;

public interface BoardDAO {
	public int insertBoard(BoardVO vo);
	public List<BoardVO> selectAll(SearchVO searchVo);
	public int selectTotalRecord(SearchVO searchVo);
}
