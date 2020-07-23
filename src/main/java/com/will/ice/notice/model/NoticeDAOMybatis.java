package com.will.ice.notice.model;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
	
@Repository
public class NoticeDAOMybatis implements NoticeDAO{
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	private String namespace="config.mybatis.mapper.oracle.notice.";

	@Override
	public int insertNotice(NoticeVO vo) {
		int cnt=sqlSession.insert(namespace+"insertNotice", vo);
		
		return cnt;
	}
}
