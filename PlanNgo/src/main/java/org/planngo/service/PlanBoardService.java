package org.planngo.service;

import java.util.List;

import org.planngo.domain.PlanBoardVO;
import org.planngo.domain.PlanSearchCriteria;

public interface PlanBoardService {

	public List<PlanBoardVO> listSearchCriteria(PlanSearchCriteria cri);
	
	public int listSearchCount(PlanSearchCriteria cri);

}
