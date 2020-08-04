package com.will.ice.board.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.will.ice.common.SearchVO;

@Service
public class BoardServiceImpl implements BoardService{
	@Autowired
	private BoardDAO boardDao;

	@Override
	public int insertBoard(BoardVO vo) {
		return boardDao.insertBoard(vo);
	}

	@Override
	public List<BoardVO> selectAll(SearchVO searchVo) {
		return boardDao.selectAll(searchVo);
	}

	@Override
	public int selectTotalRecord(SearchVO searchVo) {
		return boardDao.selectTotalRecord(searchVo);
	}
	
}
