package com.will.ice.document.model;

import java.util.List;

public interface DoctypeDAO {
	List<DoctypeVO> selectAll();
	String choosenType(int typeNo);
}
