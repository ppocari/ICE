package com.will.ice.document.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class DocformDAOMybatis implements DocformDAO{
	@Autowired
	private SqlSessionTemplate sqlSession;
	private String namespace="com.mybatis.mapper.oracle.doctype.";
	
	@Override
	public int insertForm(DocformVO docformVo) {
		return sqlSession.insert(namespace+"insertForm",docformVo);
	}

	@Override
	public List<DocformVO> selectAllForm() {
		return sqlSession.selectList(namespace+"selectAllForm");
	}

	@Override
	public DocformVO getcontent(int formNo) {
		return sqlSession.selectOne(namespace+"getcontent",formNo);
	}

	@Override
	public int deleteForm(int formNo) {
		return sqlSession.delete(namespace+"deleteForm",formNo);
	}
	
}
