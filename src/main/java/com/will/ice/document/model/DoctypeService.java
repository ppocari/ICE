package com.will.ice.document.model;

import java.util.List;

public interface DoctypeService {
	List<DoctypeVO> selectAll();
	String choosenType(int typeNo);
}
