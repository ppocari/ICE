package com.will.ice.document.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class DocformServiceImpl implements DocformService{
	@Autowired
	private DocformDAO docformDao;

	@Override
	public int insertForm(DocformVO docformVo) {
		return docformDao.insertForm(docformVo);
	}

	@Override
	public List<DocformVO> selectAllForm() {
		return docformDao.selectAllForm();
	}

	@Override
	public DocformVO getcontent(int formNo) {
		return docformDao.getcontent(formNo);
	}
	
}
