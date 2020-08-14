package com.will.ice.board.model;

import java.util.List;

import com.will.ice.common.SearchVO;

public interface BoardService {
	public int insertBoard(BoardVO vo);
	public List<BoardVO> selectAll(SearchVO searchVo);
	public int selectTotalRecord(SearchVO searchVo);
	public BoardVO selectByNo(int boardNo);
	public boolean checkPwd(int boardNo, String pwd);
	public int deleteBoard(int boardNo);
	public int updateBoard(BoardVO vo);
	public int updateVisited(int boardNo);
}
