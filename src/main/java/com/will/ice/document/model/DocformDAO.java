package com.will.ice.document.model;

import java.util.List;

public interface DocformDAO {
	int insertForm(DocformVO docformVo);
	List<DocformVO> selectAllForm();
	DocformVO getcontent(int formNo);
	int deleteForm(int formNo);
}
