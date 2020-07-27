package com.will.ice.document.model;

import java.util.List;

public interface DocformService {
	int insertForm(DocformVO docformVo);
	List<DocformVO> selectAllForm();
}
